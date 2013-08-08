%%% @copyright (C) 2013, Basho Technologies Inc.,
%%% @doc
%%%  puts hl7 messages into Riak
%%% @end
%%% Created : 17 Jul 2013 by UENISHI Kota <kota@basho.com>

-module(ssmix_importer).

-export([connect/2, disconnect/1, put/2]).

-spec connect(term(), inet:port_number()) -> {ok, pid()}.
connect(Host, Port) ->
    riakc_pb_socket:start_link(Host, Port).

disconnect(Client) ->
    riakc_pb_socket:stop(Client).

put(Client, Msg) ->
    %% TODO: Bucket, Key is to be extracted from msg
    RiakObj = riakc_obj:new(<<"somebucket">>, <<"Key">>, hl7:to_json(Msg)),
    %% TODO: put indices to all member
    riakc_pb_socket:put(Client, RiakObj).
