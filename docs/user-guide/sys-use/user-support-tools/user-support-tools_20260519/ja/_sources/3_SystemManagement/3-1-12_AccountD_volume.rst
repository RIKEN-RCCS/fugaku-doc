ディスク情報表示
==============================

| 　**[名前]**
| 　accountd_volume - 利用者のディスクに関する情報を表示する

| 　**[書式]**
| 　accountd_volume  [オプション]
| 　※-u, -gの複合指定はAND検索になる。

| 　**[説明]**
| 　accountd_volume コマンドは、利用者／課題単位に各VOLUEMディスクの利用状況を表示する。
| 　利用者はグループに属するメンバのディスク情報を表示可能である。システム管理者はシステムに登録されている全メンバのディスク情報を表示可能である。ただし、 システム管理機能 に記載されている管理者権限が付与されている必要がある。なお、オプション指定なしの場合は、システム管理者であっても自身のディスク情報のみ表示可能である。また、システム管理者ではなくても、設定により他ユーザのディスク情報を参照可能にすることができる。設定方法については 設定によるアクセス認可 を参照すること。

| 　**[オプション]**
| 　-u  ユーザ名
| 　ユーザ名を指定する。スペースに続けての複数指定、アスタリスクを使用した前方／中間／後方一致指定はできない。単一、完全一致指定のみ可能である。

| 　-g  グループ名 　
| 　グループ名を指定する。スペースに続けての複数指定、アスタリスクを使用した前方／中間／後方一致指定はできない。単一、完全一致指定のみ可能である。

| 　-a 　
| 　すべてのグループのディスク情報を表示する。-aオプション指定時は、-u, -gオプションは無効になる。

| 　-s
| 　ディスク使用量の表示単位がデフォルトのギビバイト[GiB]からキビバイト[KiB]になる。
 　
| 　-c
| 　検索結果をCSV形式で標準出力する。リダイレクション機能を使用することでファイルに保存することもできる。
 　
| 　-f  ファイルシステム名
| 　ファイルシステム名を指定する。表示対象にしたいマウントポイントを指定する。
| 　　完全一致指定	/vol0001


| 　-h
| 　課題作成時に割り当てたファイルシステムに絞り込んで表示する。

| 　-i
| 　inode使用量を表示する。

| 　--help
| 　コマンドのヘルプ内容を表示する。

| 　**[復帰値]**
| 　正常時: 0
| 　異常時: 1

| 　**[備考]**
| 　なし。

| 　**[使用例]**
| 　【例1】	利用者が課題のディスク情報を表示する

.. code-block:: console

   [login]$ accountd_volume -g group1
   COLLECTDATE : 2022/06/10 13:23:27    unit[GiB]
   *--------------------------------------------------[GROUP]-----------------------------------------------------*
   GROUP           FILESYSTEM                   LIMIT             USAGE         AVAILABLE           FILES  USE_RATE
   group1          /vol0001                     5,120                 1             5,119             770      0.0%
   group1          /vol0003                 unlimited                 1         unlimited           5,197       ---
   group1          /vol0004                 unlimited            47,529         unlimited      31,646,353       ---
   group1          /vol0005                 unlimited                 1         unlimited             143       ---
   group1          /vol0006                 unlimited                 1         unlimited              11       ---
   *--------------------------------------------------[USER]------------------------------------------------------*
   USER            FILESYSTEM                   LIMIT             USAGE         AVAILABLE           FILES  USE_RATE
   u10001          /vol0001                 unlimited                 0         unlimited               0       ---
   u10001          /vol0003                 unlimited                 1         unlimited               1       ---
   u10001          /vol0004                 unlimited                 2         unlimited             146       ---
   u10001          /vol0005                 unlimited                 0         unlimited               0       ---
   u10001          /vol0006                 unlimited                 0         unlimited               0       ---
   u10002          /vol0001                 unlimited                 0         unlimited               0       ---
   u10002          /vol0003                 unlimited                 0         unlimited               0       ---
   u10002          /vol0004                 unlimited                 1         unlimited               1       ---
   u10002          /vol0005                 unlimited                 0         unlimited               0       ---
   u10002          /vol0006                 unlimited                 0         unlimited               0       ---
   u10003          /vol0001                 unlimited                 0         unlimited               0       ---
   u10003          /vol0003                 unlimited                 0         unlimited               0       ---
   u10003          /vol0004                 unlimited                 4         unlimited          86,426       ---
   u10003          /vol0005                 unlimited                 0         unlimited               0       ---
   u10003          /vol0006                 unlimited                 0         unlimited               0       ---
   [login]$

| 　-gで指定した課題及びこれに所属しているすべての利用者のディスクの使用状況が確認できる。
| 　ディスク使用量の表示単位はデフォルトでギビバイト[GiB]になる。表示単位をキビバイト[KiB]に変更したい場合には -sオプションを指定する。なお、単位の切り替えは1KiB(1,024B)で計算される。単位切り替えによる端数は制限値(LIMIT)が小数点以下切り捨て、使用量(USAGE)が小数点以下切り上げて表示される。使用可能残量(AVAILABLE)は、制限値(LIMIT)から使用量(USAGE)を差し引いた値としている。
| 　なお、課題・利用者に割り当てられていないvolumeは、使用不可の意味合いでLIMITおよびAVAILABLEが-（ハイフン）で表示される。また、課題・利用者に割り当てられているvolumeでも、課題実施期間終了に伴う終了課題は、LIMITおよびAVAILABLEが-（ハイフン）で表示されることがある。



| 　【例2】	自分自身のディスクに関する情報を表示する


.. code-block:: console

   [login]$ accountd_volume -u u10001
   COLLECTDATE : 2022/06/08 15:14:21    unit[GiB]
   USER : u10001
   *--------------------------------------------------[GROUP]-----------------------------------------------------*
   GROUP           FILESYSTEM                   LIMIT             USAGE         AVAILABLE           FILES  USE_RATE
   group1          /vol0001                     5,120                 1             5,119             770      0.0%
   group1          /vol0003                 unlimited                 1         unlimited           5,197       ---
   group1          /vol0004                 unlimited            47,529         unlimited      31,649,071       ---
   group1          /vol0005                 unlimited                 1         unlimited             143       ---
   group1          /vol0006                 unlimited                 1         unlimited              11       ---
   *--------------------------------------------------[USER]------------------------------------------------------*
   USER            FILESYSTEM                   LIMIT             USAGE         AVAILABLE           FILES  USE_RATE
   u10001          /vol0001                 unlimited                 0         unlimited               0       ---
   u10001          /vol0003                 unlimited                 1         unlimited               1       ---
   u10001          /vol0004                 unlimited                 1         unlimited             323       ---
   u10001          /vol0005                 unlimited                 1         unlimited               8       ---
   u10001          /vol0006                 unlimited                 0         unlimited               0       ---
   
   *--------------------------------------------------[GROUP]-----------------------------------------------------*
   GROUP           FILESYSTEM                   LIMIT             USAGE         AVAILABLE           FILES  USE_RATE
   *fugaku         /vol0001                 unlimited                88         unlimited         583,517       ---
   *fugaku         /vol0003                 unlimited             6,495         unlimited       3,916,642       ---
   *fugaku         /vol0004                 unlimited             7,901         unlimited       1,973,899       ---
   *fugaku         /vol0005                 unlimited            79,976         unlimited       5,438,315       ---
   *fugaku         /vol0006                 unlimited            18,223         unlimited       1,229,654       ---

   *--------------------------------------------------[USER]------------------------------------------------------*
   USER            FILESYSTEM                   LIMIT             USAGE         AVAILABLE           FILES  USE_RATE
   u10001          /vol0001                 unlimited                 0         unlimited               0       ---
   u10001          /vol0003                 unlimited                 1         unlimited               1       ---
   u10001          /vol0004                 unlimited                 1         unlimited             323       ---
   u10001          /vol0005                 unlimited                 1         unlimited               8       ---
   u10001          /vol0006                 unlimited                 0         unlimited               0       ---
   [login]$

| 　①グループ名の先頭の \*（アスタリスク）は、ユーザのプライマリグループを示している。

| 　指定したユーザの所属するすべてのグループに関するディスク情報が表示される。
 　


| 　【例3】	システム管理者がすべての課題のディスクに関する情報を表示する

.. code-block:: console

   [login]$ accountd_volume -a
   COLLECTDATE : 2022/06/08 15:01:22    unit[GiB]
   *--------------------------------------------------[GROUP]-----------------------------------------------------*
   GROUP           FILESYSTEM                   LIMIT             USAGE         AVAILABLE           FILES  USE_RATE
   group1          /vol0001                     5,120                 1             5,119          12,889      0.0%
   group1          /vol0003                 unlimited                 1         unlimited               8       ---
   group1          /vol0004                 unlimited            15,845         unlimited      41,742,218       ---
   group1          /vol0005                 unlimited                 1         unlimited               8       ---
   group1          /vol0006                 unlimited                 1         unlimited               8       ---
   group2          /vol0001                     5,120                 1             5,119             770      0.0%
   group2          /vol0003                 unlimited                 1         unlimited           5,197       ---
   group2          /vol0004                 unlimited            47,529         unlimited      31,649,065       ---
   group2          /vol0005                 unlimited                 1         unlimited             143       ---
   group2          /vol0006                 unlimited                 1         unlimited              11       ---
   [login]$

| 　すべての課題の課題に割り当てられているディスクの使用状況が確認できる。グループ名をキーとして昇順に表示される。


| 　【例4】	システム管理者がすべての課題のディスクに関する情報をCSV形式で表示する

.. code-block:: console

   [login]$ accountd_volume -a -c
   INFO_H,COLLECT_DATE
   "INFO","2022/06/08 15:10:28"
   GROUP_H,GROUP,FILESYSTEM,LIMIT,USAGE,AVAILABLE,FILES,USAGE_RATE
   "GROUP","group1","/vol0001","5120","1","5119","12889","0.000"
   "GROUP","group1","/vol0003","unlimited","1","unlimited","8","---"
   "GROUP","group1","/vol0004","unlimited","15845","unlimited","41742218","---"
   "GROUP","group1","/vol0005","unlimited","1","unlimited","8","---"
   "GROUP","group1","/vol0006","unlimited","1","unlimited","8","---"
   "GROUP","group2","/vol0001","5120","1","5119","770","0.000"
   "GROUP","group2","/vol0003","unlimited","1","unlimited","5197","---"
   "GROUP","group2","/vol0004","unlimited","47529","unlimited","31649067","---"
   "GROUP","group2","/vol0005","unlimited","1","unlimited","143","---"
   "GROUP","group2","/vol0006","unlimited","1","unlimited","11","---"
   [login]$

| 　USAGE_RATEの表示は、ディスクに関する制限が設定されている、もしくは設定されていない（LIMITがunlimitedになっている）のであれば-（ハイフン）で表示される。CSV形式ではない【例1】の場合も同様である。


| 　表示項目の説明を示する。

.. list-table:: 
  :header-rows: 1
  :widths: 10 20 70

  * - No
    - 項目名
    - 説明

  * - 1
    - COLLECT DATE
    - データ収集日時

  * - 2
    - USER
    - ユーザ名

  * - 3
    - GROUP
    - グループ名

  * - 4
    - FILESYSTEM
    - ファイルシステム名

  * - 5
    - LIMIT
    - | 制限値
      | 　情報の単位は表示単位に従う。
      | unit[表示単位]
      | 
      | 　　＜表示単位＞
      | 　　　unit[GiB]　デフォルトはギビバイト表示
      | 　　　unit[KiB]　 -sオプション指定時はキビバイト表示

  * - 6
    - USAGE
    - | ディスクの使用量
      | 　情報の単位は表示単位に従う。
      | unit[表示単位]
      | 
      | 　　＜表示単位＞
      | 　　　unit[GiB]　デフォルトはギビバイト表示
      | 　　　unit[KiB]　 -sオプション指定時はキビバイト表示

  * - 7
    - AVAILABLE
    - | ディスクの使用可能残量
      | 　情報の単位は表示単位に従う。
      | unit[表示単位]
      | 
      | 　　＜表示単位＞
      | 　　　unit[GiB]　デフォルトはギビバイト表示
      | 　　　unit[KiB]　 -sオプション指定時はキビバイト表示

  * - 8
    - FILES
    - | ファイルシステムに作成されているファイル数
      | 　1 ファイルを 1 個とカウントする

  * - 9
    - USAGE RATE
    - | 制限値に対するディスクの使用率

  * - 10
    - [GROUP]
    - グループに関する情報表示

  * - 11
    - [USER]
    - ユーザに関する情報表示

