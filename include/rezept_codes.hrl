
%% カルテ番号とか患者ID
-type patient_id() :: string().

-type vol_id() :: non_neg_integer().

%% 別表1 審査支払機関コード
-type payment_body() :: 1|2.
-define(PAYMENT_BODY, [ %%  審査支払機関コード
                        {1, "社会保険診療報酬支払基金"},
                        {2, "国民健康保険団体連合会"}
                      ]).

%% 別表2 都道府県コード コード名
-type prefecture() :: 1..47.
-define(PREFECTURE, [
                     { 1, "北海道"}, { 2, "青森"}, { 3, "岩手"}, { 4, "宮城"},
                     { 5, "秋田"},   { 6, "山形"}, { 7, "福島"}, { 8, "茨城"},
                     { 9, "栃木"},   {10, "群馬"}, {11, "埼玉"}, {12, "千葉"},
                     {13, "東京"}, {14, "神奈川"}, {15, "新潟"}, {16, "富山"},
                     {17, "石川"}, {18, "福井"}, {19, "山梨"}, {20, "長野"},
                     {21, "岐阜"}, {22, "静岡"}, {23, "愛知"}, {24, "三重"},
                     {25, "滋賀"}, {26, "京都"}, {27, "大阪"}, {28, "兵庫"},
                     {29, "奈良"}, {30, "和歌山"}, {31, "鳥取"}, {32, "島根"},
                     {33, "岡山"}, {34, "広島"}, {35, "山口"}, {36, "徳島"},
                     {37, "香川"}, {38, "愛媛"}, {39, "高知"}, {40, "福岡"},
                     {41, "佐賀"}, {42, "長崎"}, {43, "熊本"}, {44, "大分"},
                     {45, "宮崎"}, {46, "鹿児島"}, {47, "沖縄"}]).

%% 別表3 点数表コード
-type point_table() :: 1.
-define(POINT_TABLE, [{1, "医科"}]).

%% 別表4 年号区分コード
-type era() :: 1|2|3|4.
-define(ERA_TABLE, [{1, "明治"}, {2, "大正"}, {3, "昭和"}, {4, "平成"}]).

%% 別表5 レセプト種別コード(医科)
-type rezept_type() :: 1111..1456.
-define(REZEPT_TYPE, [
                      %%社会保険診療報酬支払基金  国民健康保険団体連合会
                      {1111, {"医科・医保単独      ・本人     ・入院",
                              "医科・国保単独       ・世帯主    ・入院"}},
                      {1112, {" 〃・〃 ・本人 ・入院外",
                              " 〃・〃 ・世帯主・入院外"}},
                      {1113, {" 〃・〃 ・未就学者 ・入院",
                              " 〃 ・ 〃 ・未就学者 ・入院"}},
                      {1114, {" 〃・〃 ・未就学者 ・入院外",
                              " 〃 ・  〃        ・未就学者   ・入院外"}},
                      {1115, {" 〃・〃 ・家族 ・入院",
                              " 〃・〃 ・その他・入院"}},
                      {1116, {" 〃・〃 ・家族 ・入院外",
                              " 〃・〃 ・その他・入院外"}},
                      {1117, {" 〃 ・  〃 ・高齢受給者一般・低所得者 ・入院",
                              " 〃 ・  〃  ・高齢受給者一般・低所得者 ・入院"}},
                      {1118, {" 〃 ・  〃 ・高齢受給者一般・低所得者 ・入院外",
                              " 〃 ・  〃  ・高齢受給者一般・低所得者 ・入院外"}},
                      {1119, {" 〃 ・  〃       ・高齢受給者7割・入院",
                              " 〃 ・  〃        ・高齢受給者7割・入院"}},
                      {1110, {" 〃 ・  〃       ・高齢受給者7割・入院外",
                              "〃 ・  〃        ・高齢受給者7割・入院外"}},
                      {1121, {" 〃 ・医保と1種の公費併用・本人     ・入院",
                              "〃 ・国保と1種の公費併用 ・世帯主    ・入院"}},
                      {1122, {" 〃・〃 ・本人 ・入院外",
                              "〃・〃 ・世帯主・入院外"}},
                      {1123, {" 〃・〃 ・未就学者 ・入院",
                              "〃 ・ 〃 ・未就学者 ・入院"}},
                      {1124, {" 〃・〃 ・未就学者 ・入院外",
                              "〃 ・  〃        ・未就学者   ・入院外"}},
                      {1125, {" 〃・〃 ・家族 ・入院",
                              "〃・〃 ・その他・入院"}},
                      {1126, {" 〃・〃 ・家族 ・入院外",
                              "〃・〃 ・その他・入院外"}},
                      {1127, {" 〃 ・  〃 ・高齢受給者一般・低所得者 ・入院",
                              "〃 ・  〃  ・高齢受給者一般・低所得者 ・入院"}},
                      {1128, {" 〃 ・  〃 ・高齢受給者一般・低所得者 ・入院外",
                              "〃 ・  〃  ・高齢受給者一般・低所得者 ・入院外"}},
                      {1129, {" 〃 ・  〃       ・高齢受給者7割・入院",
                              "〃 ・  〃        ・高齢受給者7割・入院"}},
                      {1120, {" 〃 ・  〃       ・高齢受給者7割・入院外",
                              "〃 ・  〃        ・高齢受給者7割・入院外"}},
                      {1131, {" 〃 ・医保と2種の公費併用・本人     ・入院",
                              "〃 ・国保と2種の公費併用 ・世帯主    ・入院"}},
                      {1132, {" 〃・〃 ・本人 ・入院外",
                              "〃・〃 ・世帯主・入院外"}},
                      {1133, {" 〃・〃 ・未就学者 ・入院",
                              " 〃 ・ 〃 ・未就学者 ・入院"}},
                      {1134, {" 〃・〃 ・未就学者 ・入院外",
                              " 〃 ・  〃        ・未就学者   ・入院外"}},
                      {1135, {" 〃・〃 ・家族 ・入院",
                              "〃・〃 ・その他・入院"}},
                      {1136, {" 〃・〃 ・家族 ・入院外",
                              "〃・〃 ・その他・入院外"}},
                      {1137, {" 〃 ・  〃 ・高齢受給者一般・低所得者 ・入院",
                              "〃 ・  〃  ・高齢受給者一般・低所得者 ・入院"}},
                      {1138, {" 〃 ・  〃 ・高齢受給者一般・低所得者 ・入院外",
                              "〃 ・  〃  ・高齢受給者一般・低所得者 ・入院外"}},
                      {1139, {" 〃 ・  〃       ・高齢受給者7割・入院",
                              "〃 ・  〃        ・高齢受給者7割・入院"}},
                      {1130, {" 〃 ・  〃       ・高齢受給者7割・入院外",
                              "〃 ・  〃        ・高齢受給者7割・入院外"}},
                      {1141, {" 〃 ・医保と3種の公費併用・本人     ・入院",
                              "〃 ・国保と3種の公費併用 ・世帯主    ・入院"}},
                      {1142, {"〃・〃 ・本人 ・入院外",
                              "〃・〃 ・世帯主・入院外"}},
                      {1143, {"〃・〃 ・未就学者 ・入院",
                              "〃 ・ 〃 ・未就学者 ・入院"}},
                      {1144, {"〃・〃 ・未就学者 ・入院外",
                              "〃 ・  〃        ・未就学者   ・入院外"}},
                      {1145, {"〃・〃 ・家族 ・入院", "〃・〃 ・その他・入院"}},
                      {1146, {"〃・〃 ・家族 ・入院外", "〃・〃 ・その他・入院外"}},
                      {1147, {"〃 ・  〃 ・高齢受給者一般・低所得者 ・入院",
                              "〃 ・  〃  ・高齢受給者一般・低所得者 ・入院"}},
                      {1148, {"〃 ・  〃 ・高齢受給者一般・低所得者 ・入院外",
                              "〃 ・  〃  ・高齢受給者一般・低所得者 ・入院外"}},
                      {1149, {"〃 ・  〃       ・高齢受給者7割・入院",
                              "〃 ・  〃        ・高齢受給者7割・入院"}},
                      {1140, {"〃 ・  〃       ・高齢受給者7割・入院外",
                              "〃 ・  〃        ・高齢受給者7割・入院外"}},
                      {1151, {"医科・医保と4種の公費併用・本人     ・入院",
                              "医科・国保と4種の公費併用 ・世帯主    ・入院"}},
                      {1152, {"〃・〃 ・本人 ・入院外",
                              "〃・〃 ・世帯主・入院外"}},
                      {1153, {"〃・〃 ・未就学者 ・入院"
                              "〃 ・ 〃 ・未就学者 ・入院"}},
                      {1154, {"〃・〃 ・未就学者 ・入院外",
                              "〃 ・  〃        ・未就学者   ・入院外"}},
                      {1155, {"〃・〃 ・家族 ・入院",
                              "〃・〃 ・その他・入院"}},
                      {1156, {"〃・〃 ・家族 ・入院外",
                              "〃・〃 ・その他・入院外"}},
                      {1157, {"〃 ・  〃 ・高齢受給者一般・低所得者 ・入院",
                              "〃 ・  〃  ・高齢受給者一般・低所得者 ・入院"}},
                      {1158, {"〃 ・  〃 ・高齢受給者一般・低所得者 ・入院外",
                              "〃 ・  〃  ・高齢受給者一般・低所得者 ・入院外"}},
                      {1159, {"〃 ・  〃       ・高齢受給者7割・入院",
                              "〃 ・  〃        ・高齢受給者7割・入院"}},
                      {1150, {"〃 ・  〃       ・高齢受給者7割・入院外",
                              "〃 ・  〃        ・高齢受給者7割・入院外"}},
                      {1211, {"〃 ・公費単独 ・入院",
                              "──────────────────────"}},
                      {1212, {"〃・ 〃 ・入院外",
                              "──────────────────────"}},
                      {1221, {"〃 ・2種の公費併用           ・入院",
                              "──────────────────────"}},
                      {1222, {"〃・ 〃 ・入院外",
                              "──────────────────────"}},
                      {1231, {"〃 ・3種の公費併用           ・入院",
                              "──────────────────────"}},
                      {1232, {"〃・ 〃 ・入院外",
                              "──────────────────────"}},
                      {1241, {"〃 ・4種の公費併用           ・入院",
                              "──────────────────────"}},
                      {1242, {"〃・ 〃 ・入院外",
                              "──────────────────────"}},
                      {1317, {"〃 ・後期高齢者単独   ・一般・低所得者・入院",
                              "医科・後期高齢者単独    ・一般・低所得者・入院"}},
                      {1318, {"〃 ・  〃       ・一般・低所得者・入院外",
                              "〃 ・  〃        ・一般・低所得者・入院外"}},
                      {1319, {"〃・〃 ・7割 ・入院",
                              "〃・〃 ・7割 ・入院"}},
                      {1310, {"〃・〃 ・7割 ・入院外",
                              "〃・〃 ・7割 ・入院外"}},
                      {1327, {"〃 ・後期高齢者と1種の公費併用             ・一般・低所得者・入院",
                              "〃 ・後期高齢者と1種の公費併用              ・一般・低所得者・入院"}},
                      {1328, {"〃 ・  〃       ・一般・低所得者・入院外",
                              "〃 ・  〃        ・一般・低所得者・入院外"}},
                      {1329, {"〃・〃 ・7割 ・入院",
                              "〃・〃 ・7割 ・入院"}},
                      {1320, {"〃・〃 ・7割 ・入院外",
                              "〃・〃 ・7割 ・入院外"}},
                      {1337, {"〃 ・後期高齢者と2種の公費併用             ・一般・低所得者・入院",
                              "〃 ・後期高齢者と2種の公費併用              ・一般・低所得者・入院"}},
                      {1338, {"〃 ・  〃       ・一般・低所得者・入院外",
                              "〃 ・  〃        ・一般・低所得者・入院外"}},
                      {1339, {"〃・〃 ・7割 ・入院", "〃・〃 ・7割 ・入院"}},
                      {1330, {"〃・〃 ・7割 ・入院外", "〃・〃 ・7割 ・入院外"}},
                      {1347, {"〃 ・後期高齢者と3種の公費併用             ・一般・低所得者・入院",
                              "〃 ・後期高齢者と3種の公費併用              ・一般・低所得者・入院"}},
                      {1348, {"〃 ・  〃       ・一般・低所得者・入院外",
                              "〃 ・  〃        ・一般・低所得者・入院外"}},
                      {1349, {"〃・〃 ・7割 ・入院", "〃・〃 ・7割 ・入院"}},
                      {1340, {"〃・〃 ・7割 ・入院外", "〃・〃 ・7割 ・入院外"}},
                      {1357, {"〃 ・後期高齢者と4種の公費併用             ・一般・低所得者・入院",
                              "〃 ・後期高齢者と4種の公費併用              ・一般・低所得者・入院"}},
                      {1358, {"〃 ・  〃       ・一般・低所得者・入院外",
                              "〃 ・  〃        ・一般・低所得者・入院外"}},
                      {1359, {"〃・〃 ・7割 ・入院", "〃・〃 ・7割 ・入院"}},
                      {1350, {"〃・〃 ・7割 ・入院外",  "〃・〃 ・7割 ・入院外"}},
                      {1411, {"─────────────────────",
                              "医科・退職者単独      ・本人     ・入院"}},
                      {1412, {"─────────────────────",
                              "〃・〃 ・本人 ・入院外"}},
                      {1413, {"─────────────────────",
                              "〃 ・ 〃 ・未就学者 ・入院"}},
                      {1414, {"─────────────────────",
                              "〃 ・  〃        ・未就学者   ・入院外"}},
                      {1415, {"─────────────────────",
                              "〃・〃 ・家族 ・入院"}},
                      {1416, {"─────────────────────",
                              "〃・〃 ・家族 ・入院外"}},
                      {1421, {"─────────────────────",
                              "〃 ・退職者と1種の公費併用・本人     ・入院"}},
                      {1422, {"─────────────────────",
                              "〃・〃 ・本人 ・入院外"}},
                      {1423, {"─────────────────────",
                              "〃 ・ 〃 ・未就学者 ・入院"}},
                      {1424, {"─────────────────────",
                              "〃 ・  〃        ・未就学者   ・入院外"}},
                      {1425, {"─────────────────────",
                              "〃・〃 ・家族 ・入院"}},
                      {1426, {"─────────────────────",
                              "〃・〃 ・家族 ・入院外"}},
                      {1431, {"─────────────────────",
                              "〃 ・退職者と2種の公費併用・本人     ・入院"}},
                      {1432, {"─────────────────────",
                              "〃・〃 ・本人 ・入院外"}},
                      {1433, {"─────────────────────",
                              "〃 ・ 〃 ・未就学者 ・入院"}},
                      {1434, {"─────────────────────",
                              "〃 ・  〃        ・未就学者   ・入院外"}},
                      {1435, {"─────────────────────",
                              "〃・〃 ・家族 ・入院"}},
                      {1436, {"─────────────────────",
                              "〃・〃 ・家族 ・入院外"}},
                      {1441, {"─────────────────────",
                              "〃 ・退職者と3種の公費併用・本人     ・入院"}},
                      {1442, {"─────────────────────",
                              "〃・〃 ・本人 ・入院外"}},
                      {1443, {"─────────────────────",
                              "〃 ・ 〃 ・未就学者 ・入院"}},
                      {1444, {"─────────────────────",
                              "〃 ・  〃        ・未就学者   ・入院外"}},
                      {1445, {"─────────────────────",
                              "〃・〃 ・家族 ・入院"}},
                      {1446, {"─────────────────────",
                              "〃・〃 ・家族 ・入院外"}},
                      {1451, {"─────────────────────",
                              "医科・退職者と4種の公費併用・本人     ・入院"}},
                      {1452, {"─────────────────────",
                              "〃・〃 ・本人 ・入院外"}},
                      {1453, {"─────────────────────",
                              "〃 ・ 〃 ・未就学者 ・入院"}},
                      {1454, {"─────────────────────",
                              "〃 ・  〃        ・未就学者   ・入院外"}},
                      {1455, {"─────────────────────",
                              "〃・〃 ・家族 ・入院"}},
                      {1456, {"─────────────────────",
                              "〃・〃 ・家族 ・入院外"}}
                     ]).


%% 別表6 男女区分コード
%%     1  男
%%     2  女
-type sex() :: 1|2.

%% 別表7 病棟区分コード
-type building_id() :: non_neg_integer().
%% 01  精 神(精神病棟)
%% 02  結 核(結核病棟)
%% 07  療 養(療養病棟)
%% example: 01020107 

%% 別表8 一部負担金・食事療養費・生活療養費標準負担額区分コード
-type payment_category() :: 1|2|3|4.
%%       1
%%  入院時負担金額又は外来時一部負担金額並び に食事療養又は生活療養に係る標準負担額に ついて、限度額適用・標準負担額減額認定証 又は低所得者世帯の特定疾患医療受給者証若 しくは小児慢性特定疾患医療受診券(適用区 分がC又はII)の交付を受けている者(入院 日数が90日以下の者)
%% ・低所得者II
%%   2
%%  入院時負担金額並びに食事療養又は生活療養 に係る標準負担額について、限度額適用・標 準負担額減額認定証又は低所得者世帯の特定 疾患医療受給者証若しくは小児慢性特定疾患 医療受診券(適用区分がC又はII)の交付を 受けている者(入院日数が90日を超える 者)
%% ・低所得者II
%%   3
%%  入院時負担金額又は外来時一部負担金額並び に食事療養又は生活療養に係る標準負担額に ついて、限度額適用・標準負担額減額認定証 又は低所得者世帯の特定疾患医療受給者証 (適用区分がI)の交付を受けている者
%% ・低所得者I
%%  4
%%  入院時負担金額又は外来時一部負担金額並び に食事療養又は生活療養に係る標準負担額に ついて、限度額適用・標準負担額減額認定証 又は低所得者世帯の特定疾患医療受給者証 (適用区分がI)の交付を受けている者であ って、老齢福祉年金を受給している者
%% ・低所得者I

%% 別表9 レセプト特記事項コード
-type rezept_notice() :: 1..25.
%%  01 公
%%  02 長
%%  03 長処
%%  04 後保
%%  07 老併
%%  08 老健
%%  09 施
%%  10 第三
%%  11 薬治
%%  12 器治
%%  13 先進
%%  14 制超
%%  16 長2
%%  17 上位
%%  18 一般
%%  19 低所
%%  20 二割
%%  21 高半
%%  22 多上
%%  23 多一
%%  24 多低
%%  25 出産
%% 注  レセプト特記事項の取扱いについては、「診療報酬請求書等の記載要領等について」(昭和51.8.7保険発第82号)による。


%% 別表10 診療科名コード コード名
-type clinical_department_id() :: non_neg_integer().
%%   01    内科
%%     02 精神科
%%    09    小児科
%%     10  外科
%%     19 皮膚科
%%    20   ひ尿器科
%%    23    産婦人科(産科又は婦人科)
%%     26 眼科
%%    27    耳鼻いんこう科
%%     30 放射線科(放射線診断科又は放 射線治療科)
%%    31   麻酔科
%%    34   アレルギー科
%%    35    リウマチ科
%%     36 リハビリテーション科
%%    37   病理診断科
%%    38    臨床検査科
%%     39 救急科
%%     03 神経科
%%    04    神経内科
%%     05 呼吸器科
%%    06   消化器科
%%    07    胃腸科
%%     08 循環器科
%%    11   整形外科
%%    12    形成外科
%%     13 美容外科
%%    14   脳神経外科
%%    15    呼吸器外科
%%     16 心臓血管外科
%%    17   小児外科
%%    18    皮膚ひ尿器科
%%     21 性病科
%%    22   こう門科
%%    24    産科
%%     25 婦人科
%%    28    気管食道科
%%     33  心療内科

%% 別表11 人体の部位等コード コード名
-type body_part() :: 1..33.
%% 001    頭頸部
%%   002 胸部
%%  003    腹部
%%   004  呼吸器
%%   005 消化器
%%  006   循環器
%%  007    気管食道
%%   008 肛門
%%  009    血管
%%   010  心臓血管
%%   011 腎臓
%%  012   脳神経
%%  013    神経
%%   014 血液
%%  015   乳腺
%%  016    内分泌
%%   017 代謝
%%  018   頭部
%%  019    頸部
%%   020 気管
%%  021   気管支
%%  022    肺
%%   023 食道
%%  024   胃腸
%%  025    十二指腸
%%   026 小腸
%%  027   大腸
%%  028    肝臓
%%   029 胆のう
%%  030   膵臓
%%  031    心臓
%%   032 脳
%%  033    脂質代謝



%%   別表12 性別等コード
-type body_type() :: 1..10.
%%   001   男性
%% 002    女性
%%  003 小児
%% 004   老人
%% 005   周産期
%%  006 新生児
%% 007   児童
%% 008    思春期
%%  009 老年
%% 010    高齢者

%% 別表13 医学的処置コード
-type treatment_type() :: 1..19.
%%                  001    整形
%%  002 形成
%% 003    美容
%%  004  心療
%%  005 薬物療法
%% 006   透析
%% 007    移植
%%  008 光学医療
%% 009    生殖医療
%%  010  疼痛緩和
%%  011 漢方
%% 012   化学療法
%% 013    人工透析
%%  014 臓器移植
%% 015   骨髄移植
%% 016    内視鏡
%%  017 不妊治療
%% 018    緩和ケア
%%  019  ペインクリニック

%% 別表14 特定疾病コード
-type specific_disease_type() :: 1..6 .
%%    特定疾病コード
%%       001    感染症
%%   002 腫瘍
%%  003   糖尿病
%%  004    アレルギー疾患
%%   005 性感染症
%%  006    がん

%% 別表15 職務上の事由コード
%%    職務上の事由コード
%%     1   職 上(職務上)
%%    2    下 3(下船後3月以内)
%%     3  通 災(通勤災害)

%% 別表16 減免区分コード
%%     1   減額
%%    2    免除
%%     3  支払猶予


%% 別表17 転帰区分コード
-type out_type() :: 1|2|3|4.
%%   1 治ゆ、死亡、中止以外
%%   2 治ゆ
%%   3 死亡
%%   4 中 止(転医)

 %%  別表18 主傷病コード
 %% 主傷病コード  01 (主)

%% 別表19 診療識別コード(医科)
-type treatment_type2() :: non_neg_integer().
%% 入院   入院外
%%    01 全体に係る識別コード
%%    11   初診
%%   12   再診
%%   13 医学管理
%%    14   在宅
%%   21    投薬        内服
%%     22 屯服
%%    23    外用
%%    24  調剤
%%    25    処方
%%    26   麻毒
%%     27  調基
%%    28 その他
%%    31 注 射     皮下筋肉内
%%      32  静脈内
%%     33 その他
%%   39 薬剤料減点
%%    40  処置
%%     50 手術
%%    54   麻酔
%%    60    検査・病理
%%     70 画像診断
%%    80   その他
%%   90  入 院  入院基本料
%%          92 特定入院料・その他
%%   97 食事療養・生活療養・標準負担額
%%   99 全体に係る識別コード

%% 別表20 負担区分コード
%%    負担区分コード
%%   医保
%% 1者   1     5    6   B   C
%% 2者   2    3   E   G 7   H   I J   K L
%% 3者   4   M   N O   P Q R   S T U
%% 4者   V  W X Y Z
%% 5者  9

%% 別表21 特定器材単位コード
%%   001
%%    002
%%    003
%%    004
%%    005
%%    006
%%    007
%%    008
%%    009
%%    010
%%    011
%%    012
%%    013
%%    014
%%    015
%%    016
%%    017
%%    018
%%    019
%%    020
%%    021
%%    022
%%    023
%%    024
%%    025
%%    026
%%    027
%%    028
%%    029
%%    030
%%    031
%%    032
%%    033
%%    034
%%    035
%%    036
%%    037
%%    038
%%    039
%%    040
%%    041
%%    042
%%    043
%%                                                   特定器材単位コード
%% 分 回 種 箱 巻 枚 本 組 セット 個
%% 裂 方向 トローチ アンプル カプセル 錠 丸 包 瓶 袋
%% 瓶(袋) 管 シリンジ 回分 テスト分  ガラス筒 桿錠 単位 万単位 フィート
%% 滴 mg g kg cc mL L mLV バイアル cm cm2 m μCi
%%                                - 49 -
%%                   044
%%     mCi
%%     045
%%  μg
%%    046
%%     管(瓶)
%%     047
%%   筒
%%     048
%%  GBq
%%    049
%%    MBq
%%    050
%%     KBq
%%     051
%%  キット
%%    052
%%     国際単位
%%     053
%%   患者当り
%%     054
%%  気圧
%%    055
%%    缶
%%    056
%%     手術当り
%%     057
%%  容器
%%    058
%%    mL(g)
%%    059
%%     ブリスター
%%     060
%%   シート

%%   別表22 症状詳記区分コード
%%    コード名
%%   コード
%%   内容
%%                                   療養の給付及び公費負担医療 に関する費用の請求に関する 省令第1条第2項の規定に基 づく診療報酬明細書の場合
%%   01 患者の主たる疾患(合併症を含む。)の診断根拠とな った臨床症状
%%   02 患者の主たる疾患(合併症を含む。)の診断根拠とな った臨床症状の診察・検査所見
%%   03 主な治療行為(手術、処置、薬物治療等)の必要性
%%   04 主な治療行為(手術、処置、薬物治療等)の経過
%%   05 診療報酬明細書の合計点数が100万点以上の場合に おける薬剤に係る症状等
%%   06 診療報酬明細書の合計点数が100万点以上の場合に おける処置に係る症状等
%%   07 その他  治験概要の添付が必要な診療 報酬明細書の場合
%%   50 厚生労働大臣の定める評価療養及び選定療養第1条第 2号及び第3号の規定に基づく薬事法に規定する治験 に係る治験概要 疾患別リハビリテーションに 係る治療継続の理由等の記載 の必要な診療報酬明細書の場 合
%%   51 疾患別リハビリテーション(心大血管疾患、脳血管疾 患等、運動器及び呼吸器)に係る治療継続の理由等の 記載  廃用症候群に係る評価表
%%   52 廃用症候群に該当するものとして脳血管疾患等リハビ リテーション料を算定する場合の、廃用をもたらすに 至った要因等の記載  上記以外の診療報酬明細書の 場合
%%    90  療養の給付及び公費負担医療に関する費用の請求に関 する省令第1条第2項の規定に基づく診療報酬明細書 以外の診療報酬明細書の症状詳記

%% 別表23 臓器提供区分コード
%%    コード名
%%   コード
%%   内容
%%      臓器提供区分コード
%%       1 腎提供者
%%   2 造血幹細胞提供者
%%   3 皮膚提供者
%%   4 肝提供者
%%  5 肺提供者

%%       別表24 臓器提供医療機関区分コード
%%     1 添付先レセプトと同一の医療機関
%%  2 添付先レセプトと異なる医療機関

%% 別表25 臓器提供者レセプト種別コード
%%       1991 臓器提供者の入院(一般)
%%   1992 臓器提供者の入院外(一般)
%%   1997 臓器提供者の入院(後期高齢者)
%%  1998 臓器提供者の入院外(後期高齢者)
 

%% 別表5 返戻区分コード
%%   1 事務上の返戻
%%   2 審査上の返戻
%%   3 特別審査上の返戻
%%   4 再審査等請求における資格関係等の返戻
%%   5 再審査等請求における診療内容の返戻
%%   6 再審査等請求における事務上の返戻
%%   7 再審査等請求における突合再審査の返戻
%%   8 再審査等請求における特別審査上の返戻
%%   9 再審査等請求における保険医療機関の取下げ

%%    別表7 データ識別コード
%%    1   保険医療機関からの請求(請求データ)
%%    2   審査支払機関での補正等(支払決定データ)
%%    3   保険者等からの再審査等請求(再審査等データ)
%%    4   審査支払機関での再審査等結果(再審査等決定データ)
%%    8   保険医療機関への一次請求及び再請求の返戻(返戻データ)
%%   11   保険者等に請求されたレセプトで再請求前の保険医療機関からの請求(再請求前の請求データ)
%%   12   保険者等に請求されたレセプトで再請求前の審査支払機関での補正等
%% (再請求前の支払決定データ)
%%   13   保険者等に請求されたレセプトで再請求前の保険者等からの再審査等請求
%% (再請求前の再審査等データ)
%%   14   保険者等に請求されたレセプトで再請求前の審査支払機関での再審査等結果 (再請求前の再審査等決定データ)

%% 別表8 事由コード 社会保険診療報酬支払基金
-type jy_code() :: string().
%% A  療養担当規則等に照らし、医学的に適応と認められないもの
%% B  療養担当規則等に照らし、医学的に過剰・重複と認められるもの
%% C  療養担当規則等に照らし、A・B以外の医学的理由により適当と認められないもの
%% D  告示・通知の算定要件に合致していないと認められるもの
%% F  固定点数誤り
%% G  請求点数誤り
%% H  縦計計算誤り
%% K  その他

%% 国民健康保険団体連合会
%% A  不適応
%% B  過剰
%% C  重複
%% D   不適当、不必要
%% F 固定点数誤り
%% G    請求点数誤り
%% H  縦計計算誤り
%% K   その他

%% 別表9 理由番号コード 社会保険診療報酬支払基金
-type reason_type() :: non_neg_integer().
%%     コード名
%% コード
%%   原票種別
%% 内容
%%                                  理由番号 コード
%%                             100011
%% 資格関係 等
%%  記号・番号の誤り
%%       ○
%%     100012
%%  患者名・性別・生年月日の誤り
%%       ○
%%     100013
%%   認定外家族
%%       ○
%%    100014
%%  該当者なし
%%       ○
%%     100016
%%   旧証によるもの
%%       ○
%%    100017
%%   本人・家族等の種別誤り
%%       ○
%%    100018
%%  資格喪失後の受診
%%    ◎ ※3
%% ○ ※3
%%    ○
%%     100019
%%  重複請求
%%       ○
%%     100020
%%  給付対象外診療(労災等)
%%       ◎
%%     100022
%%   後期高齢者・国保該当
%%       ○
%%    100023
%%  給付期間満了
%%    ◎ ※4
%%    ○
%%     100024
%%   その他
%%   ◎ ※1
%%     ○
%%    100025
%%  医療機関等及び実施機関からの取
%% 下げ依頼による
%%       ○
%%  ◎
%%    100026
%%  特記事項の誤り
%%       ○
%%    100030
%% 診療内容 ・ 事務上
%%   固定点数誤り
%%       ○
%%     100041
%%  必要事項の記録もれ
%%       ○
%%     100042
%%  区分、診療開始日の誤り
%%       ○
%%     100043
%%  実日数の誤り
%%       ○
%%     100045
%%   一部負担金の誤り
%%       ○
%%    100048
%%   請求先変更(新設・合併等)
%%   ◎ ※2
%%     ○
%%    100049
%%  突合再審査の再審査(調剤レセプ
%% ト)
%%      ◎
%%  ○
%%     100050
%%   その他
%%       ◎
%%    100052
%%  医療機関等及び実施機関からの再
%% 審査請求による
%%       ○
%%  ◎
%%    100060
%%   診療内容に関するもの
%%      ◎
%%  ○
%%    100069
%%   突合再審査の再審査(医科・歯科
%% レセプト)
%%      ◎
%%  ○
%%    100070
%%   参照 レセプト
%%  参照されるレセプト
%%          ○

%% 返付依頼 整理番号
%% 補足
%% 理由内容
%% 理由年月日2
%% 理由年月日1
%% 理由番号補足
%%     コード名
%% コード
%%   原票種別
%% 内容
%%          理由番号 コード
%%     100080
%%   突合再審査
%%   突合再審査(調剤レセプト)
%%      ◎
%%  ○
%%    100090
%% 突合再審査(医科・歯科レセプト)
%%         ◎
%%  ○
%%       注1 「◎」は必須、「○」は任意の記録とする。
%%    ※1 理由番号補足に「理由」を記録する。
%%    ※2 理由番号補足に「変更先保険者番号」を8桁以内の全角数字(漢字モード)で記録する。
%%    ※3 理由年月日1に「喪失年月日」、理由年月日2に「証回収年月日」を記録する。
%%    ※4 理由年月日1に「満了年月日」を記録する。
%%   2 1レセプトに2以上の再審査等申し出レコードが記録される場合、それぞれが異なる原票種別の理由番号コードは
%%    記録できない。
%% 国民健康保険団体連合会
%% 別表10 理由内容コード 社会保険診療報酬支払基金
%%     コード名
%%  コード
%% 内容
%%           理由番号 コード
%%  200000 番台
%%  (国民健康保険団体連合会使用コードは別に定め
%% る。)
%%                      コード 名
%%    コード
%% 内容
%%  『対象』
%%    「参照」
%%               理由内容 コード
%%             100001
%% 『診療行為・医薬品・特定器材』の適応外
%%   ○
%%  ○
%%  ○
%%  △
%%   100002
%% 『診療行為・医薬品・特定器材』の過剰
%%   ○
%%  ○
%%  ○
%%  △
%%   100003
%% 『診療行為・医薬品・特定器材』の重複
%%   ○
%%  ○
%%  ○
%%  △
%%   100004
%% 『診療行為・医薬品・特定器材』の併用・併施
%%   ○
%%  ○
%%  ○
%%  △
%%   100005
%% 『診療行為・医薬品・特定器材』の一連
%%   ○
%%  ○
%%  ○
%%  △
%%   100006
%% 『診療行為・医薬品・特定器材』の包括
%%   ○
%%  ○
%%  ○
%%  △
%%   100007
%% 『医薬品』の長期投与
%%    ○
%%   △
%%   100008
%% 『医薬品』の禁忌
%%    ○
%%   △
%%   190001
%% (相手レセプトの申し出内容による審査)
%%        199999
%% (上記以外の理由内容)
%%    △
%%  △
%%   △
%%               注1 「○」は何れかを必ず指定し、「△」は任意での指定とする。
%%  2 『 』は申し出た再審査等の対象となる診療行為等(以下『対象』という。)を表す。
%%  3 『対象』については、「○」のレコードのみ指定することとする。
%%  4 再審査等に当たって参照すべき傷病名等(以下「参照」という。)がある場合、傷病名(傷病名レコード)、診療
%%   行為(診療行為レコード)、医薬品(医薬品レコード)、特定器材(特定器材レコード)及びコメント(コメントレ
%% コード)を指定することができる。
%% 5 「参照」が記録された場合については、内容の前に文言(「参照」に)を付加し表す。
%% 6 『対象』及び「参照」については、複数のレコードを指定することができる。
%% 7 当該コード(“190001”及び“199999”は除く。)で示した内容の先頭には、「理由内容フリー入力」
%%   で文言を追記することができる。
%%  8 “199999(上記以外の理由内容)”は未コード化理由内容コードであり、「理由内容フリー入力」で文言を
%% 59
%% 返付依頼 返付依頼 整理番号 整理番号
%% 傷病名等
%% 補足 補足 理由内容 理由内容 理由年月日2 理由年月日2 理由年月日1 理由年月日1 理由番号補足 理由番号補足
%% 特定器材 医薬品 診療行為
%%    記録する。なお、別に『対象』を指定することができる。
%%  国民健康保険団体連合会
%%         コード 名
%%    コード
%% 内容
%%  『対象』
%%    「参照」
%%        理由内容 コード
%%  200000 番台
%%  (国民健康保険団体連合会使用コードは別に定める。)
%%               コード名
%%   コード
%%   内容

%% 別表11 医療機関等連絡コード
%%   1 保険医療機関と連絡調整済み

%% 別表12 理由対象区分コード
%%  理由対象区分コード
%%   1 指定するレコードが『対象』の場合
%%   2 指定するレコードが「参照」の場合

%% 別表13 縦覧区分コード
%%   1 相手が電子レセプトの場合
%%   2 相手が紙レセプトの場合
%%   3 相手が紙の参考の場合

%% 別表14 再審査等申し出機関コード 社会保険診療報酬支払基金
%%      再審査等申し出機関 コード
%%           101
%%  医療保険
%%   102
%%  第1公費負担医療
%%   103
%%  第2公費負担医療
%%   104
%%  第3公費負担医療
%%   105
%%  第4公費負担医療
%%   108
%%  保険医療機関
%%   109
%%  社会保険診療報酬支払基金
%%         注 公費負担医療単独の場合は“102”を記録する。
%%  国民健康保険団体連合会
%%    コード名
%%   コード
%%   内容
%%  再審査等申し出機関 コード
%%   200番台
%%  (国民健康保険団体連合会使用コードは別に定める。)

%% 別表15 審査結果コード 社会保険診療報酬支払基金
-type exam_result_type() :: non_neg_integer().
%% 傷病名等
%% 特定器材 医薬品 診療行為
%%    コード名
%%   コード
%% 内容
%%  連絡
%%    原審(請求) どおり理由
%%                  審査結果コード
%%                   101
%% 資格関係等返戻
%%  ○
%%     102
%%  診療内容 ・ 事務上
%%   原審どおり
%%    ○
%%   ◎
%%   103
%%  査定
%%  ○
%%      104
%%    返戻(診療内容)
%%  ○
%%      105
%%     返戻(事務上)
%%    ○
%%     106
%%  請求先変更
%%  ○
%%     107
%% 突合再審査
%%   請求どおり
%%  ○
%%   ◎
%%    108
%%    査定
%%  ○
%%      109
%%    返戻
%%  ○
%%     110
%% 医療機関等から
%% の再審査等請求
%%   原審どおり
%%  ○
%%      111
%%     復活
%%    ○
%%     112
%%  返戻
%%   ○
%%     113
%% 他の申し出理由により査定
%%  ○
%%     114
%% 他の申し出理由により返戻
%%  ○
%%     115
%% 他レセプトで処理済み
%%  ○
%%     116
%% 再審査等請求の取り下げ
%%  ○
%%     199
%%  上記以外の処理
%%   ◎
%%                        注 「◎」は必須、「○」は任意の記録とする。 国民健康保険団体連合会
%%    コード名
%%   コード
%% 内容
%%  連絡
%%    原審(請求) どおり理由
%%  審査結果コード
%%   200番台
%%  (国民健康保険団体連合会使用コードは別
%% に定める。)

%% 別表16 原審(請求)どおり理由コード(医科) 社会保険診療報酬支払基金
-type reason_type2() :: non_neg_integer().
%%    コード名
%%  コード
%%   区分
%%   内容
%%                          原審(請求) どおり理由
%% コード(医科)
%%                         100010
%%      基本診療料
%%       算定 ルール
%%   本症例の時間外・休日・深夜加算は、診療内容を通
%% 覧し、急患等やむを得ない事情による診療であり妥
%% 当と認めます。
%%    100011
%%     診療内容を通覧して、初診料の算定は妥当と認めま
%% す。
%%    100012
%%   本症例の一般症状又は診療内容から、やむを得ない
%% 受診であり妥当と認めます。
%%    100013
%%    当該指導料又は管理料の算定要件に照らして妥当と
%% 認めます。
%%    100014
%%     本症例の特定疾患処方管理加算は、厚生労働大臣の
%% 定める対象疾患が主病であり妥当と認めます。
%%    100015
%%   当該入院基本料は新たな入院であり、今回入院日を
%% 起算日とします。
%%   100020
%% 薬剤
%%    適応
%%       当該薬剤は、本症例に効能・効果(医学的有用性を
%% 含む。)を有する薬剤であり妥当と認めます。
%%    100021
%%     当該薬剤は、本症例の一般症状及び病態を勘案して
%% 妥当と認めます。
%%    100022
%%   症状が重篤症例であるので内服・注射投与は妥当と
%% 認めます。
%%    100023
%%    速効性を必要とする症例であるので注射投与は妥当
%% と認めます。
%%    100024
%%    過剰 (過量)
%%     当該薬剤は、適宜増減の薬剤であり、本症例に対し
%% 許容量の範囲です。
%%    100025
%%   当該薬剤は、本症例の症状と一般的経過からみて、
%% 投与期間が過剰とは認めません。
%%   100026
%%   同種、同効薬 剤の併用
%%     本症例に対する当該薬剤の同一薬効複数剤投与は、
%% 作用機序がそれぞれ異なるため、適正な使用であり
%% 妥当と認めます。
%%    100027
%%    本症例に対する当該薬剤の投薬と注射(内服と外用) の併用投与は、症状の記載等からみて、重症度が考 慮され、適正な使用であり妥当と認めます。
%%   100028
%%   禁忌
%%  本症例に対する当該薬剤は、禁忌となっているが、
%% 同一月の診療内容と症状を考えて必要性があり、慎
%% 重投与されたものであることから妥当と認めます。
%%   100040
%%  処置・手術・ 麻酔
%%    処置の 適応
%%  本症例の処置は、傷病名、部位等の診療内容からみ
%% て妥当と認めます。
%%   100041
%%   複数の 処置
%%  本症例の複数の処置は、同一疾病又はこれに起因す
%% る病変に対して行われた行為ではないため、それぞ
%% れの処置点数で妥当と認めます。
%%    100050
%%   手術の 適応
%%  本症例の手術は、傷病名、部位等の診療内容からみ
%% て妥当と認めます。
%%    100051
%%       複数手術
%%  本症例の複数の手術は、別日又は異なる部位に対し
%% 行われているため妥当と認めます。
%%    100052
%%  本症例の複数の手術は、複数手術に係る費用の特例
%% に関する告示・通知に該当するため主たる手術のみ
%% の算定ではありません。
%%    100053
%%      麻酔
%%     麻酔は、治療上不可欠な診療行為であり妥当と認め
%% ます。
%%    100054
%%   本症例の神経ブロックは、傷病名の一般症状及び病
%% 態を勘案し妥当と認めます。
%%    100055
%%    診療内容を通覧して回数の算定について妥当と認め
%% ます。
%%   100056
%%    薬剤の 使用量
%%   本症例の傷病名、部位等の一般症状及び病態を勘案
%% し、当該薬剤の使用は適応、用法及び用量とも妥当
%% と認めます。
%%             62
%%    コード名
%%  コード
%%   区分
%%   内容
%%                      原審(請求) どおり理由
%% コード(医科)
%%                         100061
%%  検査
%%   適応
%%     本検査は、本症例の診断確定(鑑別診断を含む。)
%% 及び治療経過の確認のため妥当と認めます。
%%    100062
%%   本検査は、入院時、手術前及び観血検査時等の一般
%% 的検査として妥当と認めます。
%%   100063
%%   過剰
%%     本症例に対する複数回の検査は、経過観察のため又
%% は傷病名の病態からみて必要であり過剰とは認めま
%% せん。
%%    100064
%%   本症例に対する同種の関連検査複数項目の施行は、
%% 診断確定のため過剰とは認めません。
%%   100070
%% 画像診断
%%   適応
%%     本画像診断は、初診時、入院時及び手術前等の一般
%% 的診断として妥当と認めます。
%%    100071
%%   本症例に対する画像診断時の造影剤使用は、本画像 診断を確実にするうえで必要であり妥当と認めます。
%%    100072
%%    過剰
%%      本症例に対する造影剤使用量は、本画像診断を確実
%% にするうえで必要であり過剰とは認めません。
%%    100073
%%     診療内容を通覧して過剰とは認めません。
%%    100074
%%  本症例に対する複数回の画像診断は、診断確定及び
%% 治療経過の確認のために必要であり過剰とは認めま
%% せん。
%%    100075
%%   一連
%%  本症例に対する複数のレントゲン撮影は、傷病名、
%% 部位及び撮影条件等から一連ではありません。
%%   100080
%%  リハビリテー ション
%%   適応
%%     本症例に対する理学療法と作業療法の併施は、傷病
%% 名と診療内容よりみて妥当と認めます。
%%    100081
%%  本症例の理学療法は、傷病名に対する一般症状及び
%% 病態を勘案し妥当と認めます。
%%    100082
%%   過剰
%%  本症例の理学療法は、診療内容からみて過剰とは認
%% めません。
%%  100083
%%   精神科 専門療法
%%  精神科専門療 法の全項目
%%  本症例の精神科専門療法は、診療内容からみて妥当
%% と認めます。
%%  100090
%%   入院時 食事療養費
%%  適応
%%  本症例の特別食加算は、入院時食事療養の基準等に
%% 示された特別食であり妥当と認めます。
%%   100092
%% その他
%%    特定保険医療 材料
%%     特定保険医療材料は、特定保険医療材料に関する告
%% 示・通知の算定要件を満たすため妥当と認めます。
%%    100093
%%   特定保険医療材料は、本症例の傷病名、部位及び手
%% 術等を勘案し過剰とは認めません。
%%    100094
%%      全診療項目共 通の原審
%%       医学的にみて妥当とされる事項です。
%%    100095
%%  本症例は、希少疾患、重症例であり、他に有効な治
%% 療法がないためご指摘の診療は医学的にみて妥当と
%% 認めます。
%%    100096
%%    傷病名に対する一般症状及び病態を勘案して妥当と
%% 認めます。
%%    100097
%%     点数表の告示・通知に照らし、算定ルール上妥当と
%% 認めます。
%%   100098
%%   連絡項目記載
%%   連絡項目により原審どおりとします。
%%              注 事務上分については、「100099」とする。
%% 国民健康保険団体連合会
%%    コード名
%%   コード
%%    内容
%%    原審(請求) どおり理由
%% コード(医科)
%%   200000 番台
%%   (国民健康保険団体連合会使用コードは別に定める。)


%% 別表17 再審査等返戻事由コード 社会保険診療報酬支払基金
%%    コード名
%%   コード
%%  原票種別
%%   返戻理由
%%                        再審査等返戻事由 コード
%%    S1011 資格関係 等  記号・番号の誤り
%%    S1012    患者名・性別・生年月日の誤り
%%    S1013  認定外家族
%%    S1014   該当者なし
%%    S1016   旧証によるもの
%%    S1017    本人・家族等の種別誤り
%%    S1018   資格喪失後の受診
%%    S1019  重複請求
%%    S1020   給付対象外診療(労災等)
%%    S1022   後期高齢者・国保該当
%%    S1023   給付期間満了
%%    S1024    その他
%%    S1025   医療機関等からの取下げ依頼による
%%    S1026  特記事項の誤り
%%   S1030 診療内容 ・ 事務上  固定点数誤り
%%    S1041   必要事項の記録もれ
%%    S1042    区分、診療開始日の誤り
%%    S1043  実日数の誤り
%%    S1045    一部負担金の誤り
%%    S1048  請求先変更(新設・合併等)
%%    S1049   突合再審査の再審査
%%    S1050    その他
%%    S1052  医療機関等からの再審査請求による
%%    S1060   診療内容に関するもの
%%   S1080  突合再審査  突合再審査
%%     国民健康保険団体連合会
%%   S2000 番台
%%   (国民健康保険団体連合会使用コードは別に定める。)


%% 別表18 補正情報コード
%%       コード名
%%   コード
%%   内容
%%    補正情報コード
%%   1 一次請求及び再請求で補正等があり、再審査等請求では補正等がない場合
%%   2 一次請求及び再請求で補正等があり、再審査等請求でも補正等がある場合
%%   3 一次請求及び再請求で補正等はなく、再審査等請求で補正等がある場合

%% -- rezept01.pdf


