========================
R-CCS ソフトウェア
========================

富岳では、理化学研究所 計算科学研究センター (R-CCS) が開発 (または移植) した「R-CCSソフトウェア」を利用できます。

これらのソフトウェアに関するお問い合わせは、 `富岳サポートサイト <https://fugaku.zendesk.com/hc/ja/>`_ または各ソフトウェアの問い合わせ先へお願いします。

.. McKernel

   
MPICH on Tofu
========================

.. list-table::
   :widths: 1, 4

   * - 概要
     - MPICH for Tofu
   * - バージョン
     - master
   * - 開発チーム
     - フラグシップ2020プロジェクト
   * - ライセンス
     - MPICH License
   * - サポート内容
     - 質問対応、バグ修正、機能強化など
   * - ウェブページ
     - https://github.com/yutaka-ishikawa/mpich-tofu/wiki
   * - 使い方
     - | ``spack load mpich-tofu%gcc ~mt`` (シングルスレッド) (Spack-v0.21/0.19で提供中)
       | ``spack load mpich-tofu%gcc +mt`` (マルチスレッド)  (Spack-v0.21/0.19で提供中)

..
      * - 問い合わせ先
	- mpich-tofu-info@googlegroups.com
       
  
IHK/McKernel
========================

.. list-table::
   :widths: 1, 4

   * - 概要
     - スーパーコンピュータ向けに開発された軽量マルチカーネルオペレーティングシステム
   * - バージョン
     - 1.7.0
   * - 開発チーム
     - フラグシップ2020プロジェクト
   * - ライセンス
     - GPL
   * - サポート内容
     - サポート停止
   * - ウェブページ
     - https://ihkmckernel.readthedocs.io/en/latest/
   * - 問い合わせ先
     - ihkmckernel@googlegroups.com


Omni XcalableMP
========================

.. list-table::
   :widths: 1, 4

   * - 概要
     - 分散メモリ環境を対象とした指示文ベースの並列言語XcalableMPのコンパイラ
   * - バージョン
     - 1.3.3
   * - 開発チーム
     - プログラミング環境研究チーム
   * - ライセンス
     - LGPL-3.0
   * - サポート内容
     - 質問対応、バグ修正、機能強化など
   * - ウェブページ
     - https://omni-compiler.org/
   * - 使い方
     - ``spack load omni-compiler`` (Spack-v0.21/0.19で提供中)
   * - 問い合わせ先
     - support@xcalablemp.org


EigenExa
========================

.. list-table::
   :widths: 1, 4

   * - 概要
     - 高性能固有値ソルバ
   * - バージョン
     - 2.6
   * - 開発チーム
     - 大規模並列数値計算技術研究チーム
   * - ライセンス
     - 2条項BSDライセンス
   * - サポート内容
     - 質問対応、バグ修正、機能強化など
   * - ウェブページ
     - https://www.r-ccs.riken.jp/labs/lpnctrt/projects/eigenexa/index.html
   * - 使い方
     - ``spack load eigenexa``
   * - 問い合わせ先
     - EigenExa@ml.riken.jp


SC-SUMMA-25D (Semi-ScaLAPACK-Compatible 2.5D-PxGEMM based on SUMMA)
=====================================================================

.. list-table::
   :widths: 1, 4

   * - 概要
     - ScaLAPACK PxGEMMと準互換な2.5次元アルゴリズムに基づく通信回避型密行列積ルーチン
   * - バージョン
     - 1.0 alpha
   * - 開発チーム
     - 大規模並列数値計算技術研究チーム
   * - ライセンス
     - MIT License
   * - サポート内容
     - 質問対応、バグ修正、機能強化など
   * - ウェブページ
     - https://www.r-ccs.riken.jp/labs/lpnctrt/projects/25dpdgemm/
   * - 使い方
     - ``spack load scsumma25d`` (Spack-v0.21/0.19で提供中)
   * - 問い合わせ先
     - daichi.mukunoki@riken.jp


Batched Blas Generator
========================

.. list-table::
   :widths: 1, 4

   * - 概要
     - 任意のシングルスレッドBLASからバッチBLASを自動生成するツール
   * - バージョン
     - 1.0
   * - 開発チーム
     - 大規模並列数値計算技術研究チーム
   * - ライセンス
     - 2条項BSDライセンス
   * - サポート内容
     - 質問対応、バグ修正、機能強化など
   * - ウェブページ
     - https://www.r-ccs.riken.jp/labs/lpnctrt/projects/batchedblas/
   * - 使い方
     - ``spack load batchedblas``
   * - 問い合わせ先
     - daichi.mukunoki@ml.riken.jp


GENESIS (GENeralized-Ensemble SImulation System)
==================================================

.. list-table::
   :widths: 1, 4

   * - 概要
     - タンパク質、核酸、脂質、糖鎖、またはそれらの複合体など生体内高分子を対象にした分子動力学計算を行うためのソフトウェア
   * - バージョン
     - 2.1.4
   * - 開発チーム
     - 粒子系生物物理研究チーム
   * - ライセンス
     - LGPL-3.0
   * - サポート内容
     - 質問対応、バグ修正
   * - ウェブページ
     - https://www.r-ccs.riken.jp/labs/cbrt/
   * - 使い方
     - ``spack load genesis`` (Spack-v0.21/0.19で提供中)
   * - 問い合わせ先
     - 問い合わせ先は現在閉鎖中となっています。（再開時にご連絡再度差し上げます）
..     - https://www.r-ccs.riken.jp/labs/cbrt/genesis-forum/


NTChem
======

.. list-table::
   :widths: 1, 4

   * - 概要
     - 大規模かつ複雑な分子系に対する第一原理量子化学計算のための統合分子科学計算ソフトウェア
   * - バージョン
     - 24.04
   * - 開発チーム
     - 量子系分子科学研究チーム
   * - ライセンス
     - 実行ファイル無償公開 (ソースコード非公開)
   * - サポート内容
     - 質問対応、バグ修正、機能強化など
   * - ウェブページ
     - | https://molsc.riken.jp/ntchem_j.html
       | https://www.r-ccs.riken.jp/software_center/jp/software/ntchem/overview/
   * - 使い方
     - ``spack load ntchem`` (Spack-v0.21/0.19で提供中)
   * - 問い合わせ先
     - nakajima@riken.jp


SCALE
=====

.. list-table::
   :widths: 1, 4

   * - 概要
     - スーパーコンピュータから汎用計算機に至るまで広く用いられる事を念頭において開発されている、次世代気象気候科学における基盤ライブラリー
   * - バージョン
     - 5.5.2
   * - 開発チーム
     - 複合系気候科学研究チーム
   * - ライセンス
     - | SCALE license
       | https://scale.riken.jp/license/
   * - サポート内容
     - 質問対応、バグ修正、機能強化など
   * - ウェブページ
     - https://scale.riken.jp/ja/
   * - 使い方
     - ``spack load scale`` (Spack-v0.21/0.19で提供中)
   * - 問い合わせ先
     - scale@ml.riken.jp

FrontFlow/red-HPC
=================

.. list-table::
   :widths: 1, 4

   * - 概要
     - 大規模かつ複雑な形状を有する流れ場(自動車空力、ガスタービン等)を解析するための汎用熱流体解析ソフトウェア
   * - バージョン
     - 3.1
   * - 開発チーム
     - 複雑現象統一的解法研究チーム
   * - ライセンス
     - 実行ファイル無償公開 (ソースコード非公開)
   * - サポート内容
     - 質問対応、バグ修正
   * - ウェブページ
     - | https://cfml.eng.hokudai.ac.jp/frontflow-red-ver-3-1.html
       | http://www.ciss.iis.u-tokyo.ac.jp/dl/
       | http://www.nufd.jp/product/nufd_frontflowred_2.html
   * - 使い方
     - FrontFlow/red-HPCの利用をご希望の方は以下へお問い合わせください。
   * - 問い合わせ先
     - mtsubo@riken.jp
     
