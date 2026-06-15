はじめに
====================

- 「富岳」では、パッケージ管理ツール Spack を用いてオープンソースソフトウェア (OSS) を管理、提供します。

- Spack は、米国の Exascale Computing Project (ECP) で採用されるパッケージ管理ツールです。Spack の詳細については、以下の URL を参照してください。

  https://spack.readthedocs.io

  なお、「富岳」における Spack の現在のバージョンは 1.0.1 です (以前のバージョン 0.21, 0.19 もこれまで通りお使い頂けます)。

- Spack を使って富岳においてビルドできる OSS のリストを、以下の URL で参照できます。

  https://spack-mirror.r-ccs.riken.jp/oss/public/

  ただし、富岳の現在の環境における最新の状況を反映するものではありません。

- 以下で説明する利用方法は変更になる可能性があります。

- OSS のバージョンアップ等により置き換えが発生する可能性があります。

- OSS はサポート対象外となります。利用方法、不具合などへの対応は原則としてできませんので、予めご了承願います。また、所定のライセンス条件をご確認のうえ、利用者の責任において利用をお願いします。


利用方法
====================

ログインノード上で OSS を使用する場合には、以下の各コマンドをログインノードのコマンドラインで実行します。計算ノード上で OSS を使用する場合には、以下の各コマンドをジョブスクリプト中に記述するか、会話型ジョブのコマンドラインにおいて実行します。

「富岳」におけるさらに詳しい Spack の使い方については、「富岳 Spack 利用ガイド」を参照してください。

- 環境設定 (Spack の有効化)

  ::

     $ . /vol0004/apps/oss/spack/share/spack/setup-env.sh

- インストール済み OSS を確認

  ``spack find`` コマンドを使用します。以下の実行例で、
  ``linux-rhel8-a64fx`` が計算ノード向け、
  ``linux-rhel8-cascadelake`` または ``linux-rhel8-skylake_avx512`` がログインノード向けの OSS を示します。

  ::

     $ spack find
     ...
     -- linux-rhel8-a64fx / %c,cxx,fortran=fj@4.12.0 -----------------
     adios2@2.9.2   adios2@2.10.2  cp2k@2025.2       
     fugaku-frontistr@master  lammps@20230802.4  libint@2.6.0
     ...
     -- linux-rhel8-cascadelake / %c,cxx,fortran=gcc@15.1.0 ----------
     adios2@2.9.2  darshan-util@3.4.0-pre1  openmpi@5.0.8
     ...
     ==> 1046 installed packages

- OSS のロード

  ``spack load`` コマンドを使用して、指定した OSS を利用するための設定を有効化します。

  (例) openblas をロードする場合::

     $ spack load openblas

- OSS のアンロード

  ``spack unload`` コマンドを使用して、指定した OSS を利用するための設定を無効化します。

  (例) openblas をアンロードする場合::

     $ spack unload openblas


現況
====================

利用可能な OSS は順次に拡充する予定です。2025年10月17日の時点でインストール済みの OSS は以下の通りです。以前のバージョン0.21(0.19)の状況については :doc:`list_0.21` (:doc:`list_0.19`) をご覧ください。

※ 実際には、これらの OSS が依存する多数の OSS もインストールされています。

ログインノードにインストール済みOSS一覧表
-----------------------------------------

.. csv-table::
   :file: oss_list_ln_1.0.1.csv

計算ノードにインストール済みOSS一覧表
-----------------------------------------

.. csv-table::
   :file: oss_list_cn_1.0.1.csv


