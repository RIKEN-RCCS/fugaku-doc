Spack v0.19
====================

ログインノードにインストール済みOSS一覧表
-----------------------------------------

.. csv-table::
   :file: oss_list_ln_0.19.csv

計算ノードにインストール済みOSS一覧表
-----------------------------------------

.. csv-table::
   :file: oss_list_cn_0.19.csv

\*1 以下の4つのアプリケーションソフトウェア (アプリソフト) は、高度情報科学技術研究機構 (RIST) によって提供されています。

- Quantum ESPRESSO
- LAMMPS
- GROMACS
- OpenFOAM

これら4つのアプリソフトのさらに詳しい利用方法 (実行スクリプト例など) については、下記の URL をご参照ください。

    https://www.hpci-office.jp/pages/appli_software
	  
\*2 環境設定の読み込み時や実行時に以下の警告が出力されますが、動作に影響はありません。

::
   
   ==> Warning: Quotes in command arguments can confuse scripts like configure.
   The following arguments may cause problems when executed:
   source /dev/null &> /dev/null && python3 -c "import os, json; print(json.dumps(dict(os.environ)))"
   Quotes aren't needed because spack doesn't use a shell.
   Consider removing them

