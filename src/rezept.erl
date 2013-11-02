%%
%% Copyright (C) 2013-2013 UENISHI Kota
%%
%%    Licensed under the Apache License, Version 2.0 (the "License");
%%    you may not use this file except in compliance with the License.
%%    You may obtain a copy of the License at
%%
%%        http://www.apache.org/licenses/LICENSE-2.0
%%
%%    Unless required by applicable law or agreed to in writing, software
%%    distributed under the License is distributed on an "AS IS" BASIS,
%%    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%%    See the License for the specific language governing permissions and
%%    limitations under the License.
%%

-module(rezept).

-include_lib("eunit/include/eunit.hrl").
-include("rezept.hrl").

-export([process_file/2, process_file/3,
         parse_file/2, parse_file/3,
         put_record/2, default_extractor/1,
         from_json/1, to_json/1
        ]).

-spec process_file(filename:filename(), file:file_info()) -> {ok, [term()]}.
process_file(Filename, Info) ->
    process_file(Filename, Info, fun ?MODULE:default_extractor/1).

-spec process_file(filename:filename(), file:file_info(), fun()) -> {ok, [term()]}.
process_file(Filename, Info, InfoExtractor) when is_function(InfoExtractor) ->
    Records = parse_file(Filename, Info, InfoExtractor),
    {ok, Records}.

-spec parse_file(filename:filename(), file:file_info()) -> {ok, [term()]}.
parse_file(Filename, Info) ->
    parse_file(Filename, Info, fun ?MODULE:default_extractor/1).

parse_file(Filename, _Info, InfoExtractor) when is_function(InfoExtractor) ->
    {ok, Lines} = japanese:read_file(Filename),
    %% io:format("~p~n", [Lines]),

    F = fun({newline, NewLine}, Ctx0) ->
                {ok, Ctx} = parse_line(NewLine, Ctx0),
                Ctx;
           (_, Ctx0) -> Ctx0
        end,
    {ok, ResultCtx} = ecsv:process_csv_string_with(lists:flatten(Lines), F, {[], []}),
    {Remain, Records0} = ResultCtx,
    Records1 = [ lists:reverse(Remain) | Records0 ],
    meddatum:log(info, "~p records.~n", [length(Records1)]),
    case InfoExtractor of
        undefined -> Records1;
        _  -> lists:map(InfoExtractor, Records1)
    end.

default_extractor(Record) ->
    extract(Record)++[{<<"segments">>, Record}].

extract([]) -> [];
extract([H|T]) ->
    case proplists:get_value(<<"レコード識別情報">>, H) of
        <<"IR">> ->
            [{<<"date">>, list_to_binary(extract_date(H))},
             {<<"hospital_id">>, extract_hospital(H)}];
        _ -> extract(T)
    end.

extract_date(Col) ->
    case proplists:get_value(<<"請求年月">>, Col) of
        undefined -> undefined;
        DateBin ->
            [P,Y0,Y1,M0,M1] = binary_to_list(DateBin),
            Year = p2base(P) + list_to_integer([Y0,Y1]),
            lists:flatten(integer_to_list(Year) ++ [M0,M1])
    end.

p2base($4) -> 1988; %% 平成0年
p2base($3) -> 1925; %% 昭和0年
p2base($2) -> 1911; %% 大正0年
p2base($1) -> 1971. %% 明治0年

extract_hospital(Col) ->
    proplists:get_value(<<"医療機関コード">>, Col).


to_json(Rezept) when length(Rezept) > 0 ->
    case jsonx:encode(Rezept) of
        {error, A, B} ->
            meddatum:log(error, " ~p, ~p~n", [A, B]),
            {error, {A,B}};
        {no_match, _O} ->
            meddatum:log(error, "~p~n", [Rezept]),
            {error, no_match};
        JSONRecords when is_binary(JSONRecords) ->
            {ok, JSONRecords}
    end;
to_json(_) ->
    {error, empty}.

from_json(RezeptJson) ->
    jsonx:decode(RezeptJson).

put_record(C, Record0) ->
    %% io:format("~p", [(Record0)]),
    case to_json(Record0) of
        {ok, JSONRecords} ->
            %%ok = file:write_file("test.json", JSONRecords).
            ContentType = "application/json",
            Key = list_to_binary(integer_to_list(erlang:phash2(JSONRecords))),
            RiakObj0 = riakc_obj:new(<<"rezept">>, Key,
                                    JSONRecords, ContentType),

            %% put indices to all member
            RiakObj = set_2i(RiakObj0, Record0),
            riakc_pb_socket:put(C, RiakObj);
        {error, empty} -> ok;
        Other ->
            %% TODO: insert probe code to find bad data format or spec.
            %% lists:foreach(fun(R) ->
            %%                       lists:foreach(fun(P) ->
            %%                                             io:format("~n~p~n", [[P]]),
            %%                                             {ok, _} = to_json([P])
            %%                                     end, R)
            %%               end, proplists:get_value(<<"segments">>, Record0)),
            error(Other)
    end.

set_2i(RiakObj0, Record0) ->
    RiakObj1 = case proplists:get_value(<<"patient_id">>, Record0) of
                   undefined -> RiakObj0;
                   PatientID ->
                       MD0 = riakc_obj:get_update_metadata(RiakObj0),
                       MD1 = riakc_obj:set_secondary_index(MD0, {{binary_index, ssmix_importer:index_name(patient_id)}, [PatientID]}),
                       riakc_obj:update_metadata(RiakObj0, MD1)
               end,
    Date = proplists:get_value(<<"date">>, Record0),
    MD2 = riakc_obj:get_update_metadata(RiakObj1),
    MD3 = riakc_obj:set_secondary_index(MD2, {{binary_index, ssmix_importer:index_name(date)}, [Date]}),
    riakc_obj:update_metadata(RiakObj1, MD3).    

%% how to make hardcoded "ほげほげ" printable:
hardcode_list_to_string(S) ->
    %% ?debugVal(NewLine),
    %% io:format("~ts~n", [NewLine]),
    %% io:format(unicode:characters_to_list(list_to_binary("210MN910000158東京都港区新橋13142405910000158"))),
    unicode:characters_to_list(list_to_binary(S)).

hardcode_to_binary(S) ->
    list_to_binary(S).

parse_line(Line, {List, Records}) ->
    [_DataID, _, _, RecordID|_] = Line,

    case lists:keytake(RecordID, 1, ?RECORD_TYPES) of
        {value, {RecordID, Name, Cols0}, _} ->
            meddatum:log(info, "[info]: '~s' ~ts~n",
                         [RecordID,
                          hardcode_list_to_string(Name)]),

            ShortLen = erlang:min(length(Line), length(Cols0)),
            {Line1,_} = lists:split(ShortLen, Line),
            {Cols, _} = lists:split(ShortLen, Cols0),
            Data0 = lists:map(fun({Col, Entry}) ->
                                      %%?debugVal({Col,Entry}),
                                      case check_type(Col, Entry) of
                                          {ok, {K,V}} ->
                                              {hardcode_to_binary(K), V};
                                          {warning, {K,V}} ->
                                              %% meddatum:log(warning, "[warning]: ~s~n", [RecordID]),
                                              {hardcode_to_binary(K), V}
                                      end
                              end,
                              lists:zip(Cols, Line1)),
            Data = lists:filter(fun({_,null}) -> false; (_) -> true end,
                                Data0),

            case RecordID of

                "MN" ->
                    {ok, {[Data], [lists:reverse(List)|Records]}};
                _ ->
                    NewList = [Data|List],
                    {ok, {NewList, Records}}
            end;
        {value, _, _} ->
            {error, {not_yet, RecordID}};
        false ->
            {error, {unknown_record, RecordID}}
    end.

-spec check_type({string(), atom()|{maybe,atom()}, integer()}, string())
                -> {ok, {string(), null|binary()}}. %% unicode binary
check_type({Name, {maybe, _}, _}, []) -> {ok, {Name, null}};
check_type({Name, {maybe, Type}, MaxDigits}, Entry) ->
    check_type({Name, Type, MaxDigits}, Entry);
check_type({Name, _, _}, []) ->
    meddatum:log(warning, "[warning]: empty value which is not optional: ~ts~n",
              [hardcode_list_to_string(Name)]),
    {warning, {Name, null}};
check_type({Name, integer, _MaxDigits}, Entry) ->
    {ok, {Name, list_to_integer(Entry)}};
check_type({Name, latin1, _MaxDigits}, Entry) ->
    {ok, {Name, list_to_binary(Entry)}};
check_type({Name, unicode, _MaxDigits}, Entry) ->
    %% meddatum:log(">>>> => ~ts~n", [unicode:characters_to_binary(Entry, utf8)]),
    {ok, {Name, unicode:characters_to_binary(Entry, unicode)}};
check_type({Name, gyymm, 5}, Entry) ->
    {ok, {Name, list_to_binary(Entry)}};
check_type({Name, gyymmdd, 7}, Entry) ->
    {ok, {Name, list_to_binary(Entry)}};
check_type({Name, jy_code, _}, Entry) when length(Entry) =:= 1 ->
    {ok, {Name, unicode:characters_to_binary(Entry)}}.

