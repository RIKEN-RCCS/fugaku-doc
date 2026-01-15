========================
整備ソフトウェア
========================

富岳では、理化学研究所 計算科学研究センター (R-CCS) または高度情報科学技術研究機構 (RIST) が整備する以下のソフトウェアを利用できます。

これらのソフトウェアに関するお問い合わせは、 `富岳サポートサイト <https://fugaku.zendesk.com/hc/ja/>`_ または各ソフトウェアの問い合わせ先へお願いします。

ABINIT-MP
=========

.. list-table::
   :widths: 1, 4

   * - 概要
     - フラグメント分子軌道 (FMO) 計算を高速に行えるソフトウェア
   * - バージョン
     - Ver. 1 Rev. 22 / Ver. 2 Rev. 4 / Ver. 2 Rev. 8 / dd1-2024
   * - 開発取りまとめ責任者
     - 望月 祐志 (立教大学)
   * - ライセンス
     - 独自形態
   * - サポート内容
     - 相談可
   * - 使い方
     - | ``spack load abinitmp@1-22`` / ``spack load abinitmp@2-4`` / ``spack load abinitmp@2-8`` / ``spack load abinitmp@dd1-2024``
   * - ウェブページ
     - | https://www.cenav.org/abinit-mp-open_ver-1-rev-22/
       | https://www.cenav.org/abinit-mp-open_ver-2-rev-4/
       | https://www.cenav.org/abinit-mp-open_ver-2-rev-8/
       | https://fmodd.jp/member_contents/manual_ABINIT-MP_V1DD_2024/
       | https://www.hpci-office.jp/for_users/appli_software/appli_abinit-mp (HPCIポータルサイト内)
   * - 問い合わせ先
     - fullmoon@rikkyo.ac.jp

Quantum ESPRESSO
=================

.. list-table::
   :widths: 1, 4
	    
   * - 概要
     - PWscfという平面波基底と擬ポテンシャルを用いた第一原理計算アプリケーションソフトウェアをベースとした統合パッケージ。
   * - バージョン
     - 7.3.1 / 7.4.1
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load quantum-espresso``
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - | https://www.hpci-office.jp/for_users/appli_software/appli_qe (HPCIポータルサイト内)
       | https://www.quantum-espresso.org/ (公式サイト)

LAMMPS
=================

.. list-table::
   :widths: 1, 4
	    
   * - 概要
     - 汎用古典分子動力学アプリケーションソフトウェア。
   * - バージョン
     - 20220623.2 / 20230802.3 / 20240829.2 / 20250722.1
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load lammps``
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - | https://www.hpci-office.jp/for_users/appli_software/appli_lammps (HPCIポータルサイト内)
       | https://www.lammps.org/#gsc.tab=0 (公式サイト)

GROMACS
=================

.. list-table::
   :widths: 1, 4
	    
   * - 概要
     - 古典分子動力学アプリケーションソフトウェア。
   * - バージョン
     - 2023.5 / 2024.5 / 2024.6 / 2025.3
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load gromacs``
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - | https://www.hpci-office.jp/for_users/appli_software/appli_gromacs (HPCIポータルサイト内)
       | https://www.gromacs.org/ (公式サイト)

OpenFOAM
=================

.. list-table::
   :widths: 1, 4
	    
   * - 概要
     - 有限体積法と非構造格子を特徴とする汎用流体解析プログラム。
   * - バージョン
     - 2412 (OpenCFD version) / 12 (OpenFOAM Foundation version)
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load openfoam`` (OpenCFD版) または
       | ``spack load openfoam-org`` (OpenFOAM Foundation版)
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - | https://www.hpci-office.jp/for_users/appli_software/appli_openfoam (HPCIポータルサイト内)
       | https://www.openfoam.com/ (OpenCFD公式サイト)
       | https://openfoam.org/ (OpenFOAM Foundation公式サイト)

Fire Dynamics Simulator (FDS)
===============================

.. list-table::
   :widths: 1, 4

   * - 概要
     - 火災シミュレーションアプリケーションソフトウェア
   * - バージョン
     - 6.9.1
   * - 整備担当者
     - 計算科学振興財団
   * - 使い方
     - | ``spack load fds``
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - | https://www.hpci-office.jp/for_users/appli_software/appli_fds (HPCIポータルサイト内)
       | https://pages.nist.gov/fds-smv/ (公式サイト)

HΦ
=========

.. list-table::
   :widths: 1, 4

   * - 概要
     - オープンソースの数値厳密対角化法による有効模型ソルバーパッケージ。
   * - バージョン
     -  3.5.1
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load hphi``
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - | https://www.hpci-office.jp/for_users/appli_software/appli_hphi (HPCIポータルサイト内)
       | http://issp-center-dev.github.io/HPhi/index.html (公式サイト)

MODYLAS
=========

.. list-table::
   :widths: 1, 4

   * - 概要
     - オープンソース（ライセンス許可制）の汎用古典分子動力学アプリケーションソフトウェア。
   * - バージョン
     - 1.1.0
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load modylas-new``
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - | https://www.hpci-office.jp/for_users/appli_software/appli_modylas (HPCIポータルサイト内)
       | http://www.modylas.org/ (公式サイト)

OpenMX
=========

.. list-table::
   :widths: 1, 4

   * - 概要
     - オープンソースの第一原理計算アプリケーションソフトウェア。
   * - バージョン
     - 3.9.9
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load openmx``
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - | https://www.hpci-office.jp/for_users/appli_software/appli_openmx (HPCIポータルサイト内)
       | http://www.openmx-square.org/ (公式サイト)

PHASE/0
=========

.. list-table::
   :widths: 1, 4

   * - 概要
     - 密度汎関数理論に基づく擬ポテンシャル法による平面波基底の第一原理電子状態計算プログラム。
   * - バージョン
     - 2024.01
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load phase0``
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - | https://www.hpci-office.jp/for_users/appli_software/appli_phase0 (HPCIポータルサイト内)
       | https://azuma.nims.go.jp/software/phase (公式サイト)

SALMON
=========

.. list-table::
   :widths: 1, 4

   * - 概要
     - オープンソースの光と物質の相互作用をターゲットにした第一原理計算アプリケーションソフトウェア。
   * - バージョン
     - 2.2.1
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load salmon-tddft``
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - | https://www.hpci-office.jp/for_users/appli_software/appli_salmon (HPCIポータルサイト内)
       | http://salmon-tddft.jp/ (公式サイト)

SMASH
=========

.. list-table::
   :widths: 1, 4

   * - 概要
     - オープンソースの量子化学計算アプリケーションソフトウェア。
   * - バージョン
     - 3.0.2
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load smash``
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - | https://www.hpci-office.jp/for_users/appli_software/appli_smash (HPCIポータルサイト内)
       | https://smash-qc.sourceforge.io/ (公式サイト)

mVMC
=========

.. list-table::
   :widths: 1, 4

   * - 概要
     - 広汎な多体量子系の有効模型の基底状態の高精度な波動関数を変分モンテカルロ法によって数値的に求める有効模型ソルバーパッケージ。
   * - バージョン
     - 1.3.0
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load mvmc``
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - | https://www.hpci-office.jp/for_users/appli_software/appli_mvmc (HPCIポータルサイト内)
       | https://www.pasums.issp.u-tokyo.ac.jp/mvmc/ (公式サイト)

AkaiKKR
=========

.. list-table::
   :widths: 1, 4

   * - 概要
     - グリーン関数法(KKR法)を用いた第一原理計算プログラムパッケージ。
   * - バージョン
     - 2021v02
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load akaikkr``
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - | https://www.hpci-office.jp/for_users/appli_software/appli_akaikkr (HPCIポータルサイト内)
       | http://kkr.issp.u-tokyo.ac.jp/ (公式サイト)

ALAMODE
=========

.. list-table::
   :widths: 1, 4

   * - 概要
     - 格子振動の非調和性を露わに考慮した原子間ポテンシャルを構築するプログラムパッケージ。
   * - バージョン
     - 1.5.0
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load alamode``
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - | https://www.hpci-office.jp/for_users/appli_software/appli_alamode (HPCIポータルサイト内)
       | https://alamode.readthedocs.io/en/latest/ (公式サイト)

Phonopy
=========

.. list-table::
   :widths: 1, 4

   * - 概要
     - 第一原理計算ソフトウェアの計算結果から固体のフォノンに関連する物理量を計算するソフトウェア。
   * - バージョン
     - 2.27.0
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load py-phonopy``
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - | https://www.hpci-office.jp/for_users/appli_software/appli_phonopy (HPCIポータルサイト内)
       | https://phonopy.github.io/phonopy/ (公式サイト)

FrontFlow/blue
===================

.. list-table::
   :widths: 1, 4

   * - 概要
     - 非圧縮流体の非定常流動を高精度に予測可能なLarge Eddy Simulation(LES)に基づいた汎用流体解析コード
   * - バージョン
     - 9.0
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load ffb@9.0``
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - | https://www.hpci-office.jp/for_users/appli_software/appli_frontflowblue (HPCIポータルサイト内)
       | http://www.ciss.iis.u-tokyo.ac.jp/project/rss/software/07_info.html (公式サイト)

FrontISTR
===================

.. list-table::
   :widths: 1, 4

   * - 概要
     - オープンソースの構造解析ソルバー
   * - バージョン
     - v5.4 / v5.0
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load fugaku-frontistr``
   * - ウェブページ
     - | https://www.hpci-office.jp/for_users/appli_software/appli_frontistr (HPCIポータルサイト内)
       | https://www.frontistr.com/ (公式サイト)

FFX
=====

.. list-table::
   :widths: 1, 4

   * - 概要
     - 格子ボルツマン法による流体解析ソフトウェア
   * - バージョン
     - master
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load ffx``
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - https://www.hpci-office.jp/for_users/appli_software/appli_ffx (HPCIポータルサイト内)

FFVHC-ACE
===========

.. list-table::
   :widths: 1, 4

   * - 概要
     - 圧縮性流体解析基盤ソルバー
   * - バージョン
     - 0.1
   * - 整備担当者
     - 高度情報科学技術研究機構 (RIST)
   * - 使い方
     - | ``spack load ffvhc-ace``
       | さらに詳しい使い方については、下に示すHPCIポータルサイトをご覧ください。
   * - ウェブページ
     - https://www.hpci-office.jp/for_users/appli_software/appli_ffvhc-ace (HPCIポータルサイト内)
