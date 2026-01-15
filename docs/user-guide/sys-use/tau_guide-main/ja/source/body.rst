
概要
====

TAU (Tuning and Analysis Utilities) は、C/C++, Fortran, Java, Python, UPCで書かれた並列プログラムの性能解析ツールです [#tau]_。
ここでは\ |post-k|\ で、TAUを利用したプログラムの実行方法を示します。

TAUに関する詳細な情報は、http://www.cs.uoregon.edu/research/tau/ 等を参考にしてください。


バージョンと注意
================

2024年3月現在、TAUはバージョン2.32.1がインストールされています。インストール先は以下の通りです。

.. code-block:: bash

  /vol0004/apps/oss/tau

TAUを使用するには、インストールされたTAUの環境を呼び出し、mpiexecによりtau_execを実行します。
その時に実行時オプションを渡すことで、TAUに実行プログラムのパフォーマンスを解析させることができます。
例えば以下のオプションにより、プロファイル結果の出力を可能です。

.. list-table::
  :header-rows: 1
  :widths: 2 7

  * - オプション
    - 効果
  * - \-ebs
    - イベントベースサンプリングを有効にする
  * - \-io
    - I/Oをトラッキングする
  * - \-memory
    - メモリをトラッキングする(\*)

.. attention::
 
  バージョン2.32.1では、\ |post-k|\ で-memoryオプションを使用すると実行プログラムがハングすることを確認しています。
  メモリトラッキングを行いたい場合はこの実行時オプションを使用せず、
  同様の効果を持つ環境変数TAU_TRACK_MEMORY_FOOTPRINTを有効にしてください。

  .. code-block:: bash

    export TAU_TRACK_MEMORY_FOOTPRINT=1

簡単にプロファイル結果を表示するには、pprofを使用します。
テキストベースで標準出力に結果が表示されるので、リダイレクトでログファイルに記述するようにすると便利です。


実行方法
========

ここではTAUを利用したテストプログラムによる\ |post-k|\ での実行方法を示します。

ジョブは以下のような形で記述します。

[実行例]

.. code-block:: bash

  #! /bin/bash -x
  #PJM -L node=1
  #PJM -L elapse=00:10:00
  #PJM -x PJM_LLIO_GFSCACHE=/vol0004
  #PJM --mpi max-proc-per-node=48
  #PJM -g groupname
  #PJM -s
  #
  export PARALLEL=1
  export OMP_NUM_THREADS=1
  
  # TAU
  . /vol0004/apps/oss/tau/setup-env.sh

  # run
  mpiexec tau_exec -ebs ./test.exe
  pprof -a > tau_profile.log
  

実行結果の一例として、pprofで出力されたテキストを示します。
これはI/Oのトラッキング結果の一部です。

[結果例]

.. code-block:: bash

  USER EVENTS Profile :NODE 6, CONTEXT 0, THREAD 0
  ---------------------------------------------------------------------------------------
  NumSamples   MaxValue   MinValue  MeanValue  Std. Dev.  Event Name
  ---------------------------------------------------------------------------------------
         948  1.024E+07          2  1.892E+04  3.474E+05  Bytes Read
         393  1.366E+06          8  1.286E+04  9.108E+04  Bytes Read : taupreload_main => MPI_Finalize() => read()
           4         21          6      17.25      6.495  Bytes Read : taupreload_main => MPI_Init() => fscanf()
         307       8192          2      114.5      707.9  Bytes Read : taupreload_main => MPI_Init() => read()
           3          4          4          4          0  Bytes Read : taupreload_main => MPI_Init() => recv()
         235  1.024E+07          2  5.465E+04  6.864E+05  Bytes Read : taupreload_main => read()
           6        107          4      50.67      41.43  Bytes Read : taupreload_main => recvfrom()
           1       2902       2902       2902          0  Bytes Read <file=//etc/opt/FJSVtcs/ple/pmix-mca-params.conf>
           1       2902       2902       2902          0  Bytes Read <file=//etc/opt/FJSVtcs/ple/pmix-mca-params.conf> : taupreload_main => MPI_Init() => read()
           1        353        353        353          0  Bytes Read <file=/etc/opt/FJSVtcs/krm/libpxkrm.conf>
           1        353        353        353          0  Bytes Read <file=/etc/opt/FJSVtcs/krm/libpxkrm.conf> : taupreload_main => read()

.. rubric:: Footnote

.. [#tau] S. Shende and A. D. Malony, "The TAU Parallel Performance System," International Journal of High Performance Computing Applications, SAGE Publications, 20(2):287-331, Summer 2006.


