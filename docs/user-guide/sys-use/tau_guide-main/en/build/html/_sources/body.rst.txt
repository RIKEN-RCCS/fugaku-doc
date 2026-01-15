
Overview
========

TAU (Tuning and Analysis Utilities) is a performance analysis tool
for parallel programs written in C/C++, Fortran, Java, Python, and UPC [#tau]_.
Here we show how to run the program using TAU on \ |post-k|\.

For more information on TAU, please refer to http://www.cs.uoregon.edu/research/tau/.


Notification
============

As of March 2024, TAU has version 2.32.1 installed. The installation location is as follows:

.. code-block:: bash

  /vol0004/apps/oss/tau

To use TAU, invoke the installed TAU environment and run tau_exec by mpiexec.
By passing runtime options at that time, you can have TAU analyze the performance of the executable program.
For example, the following options allow output of profile results:

.. list-table::
  :header-rows: 1
  :widths: 2 7

  * - Options
    - Outputs
  * - \-ebs
    - Enable event-based sampling
  * - \-io
    - Track I/O
  * - \-memory
    - Track memory (\*)

.. attention::
 
  In version 2.32.1, we have confirmed that the executable program hangs when the -memory option is used in \ |post-k|\.
  If you wish to perform memory tracking, do not use this runtime option,
  but enable the environment variable TAU_TRACK_MEMORY_FOOTPRINT, which has the same effect.

  .. code-block:: bash

    export TAU_TRACK_MEMORY_FOOTPRINT=1

To easily view profile results, use pprof.
Since the results are displayed on standard output on a text basis,
it is convenient to redirect to a log file to describe the results.


How to execute
==============

Here we show how to execute in \ |post-k|\  with a test program using TAU.

The job is described as follows:

[Example]

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
  

An example of the results of the execution is the text output by pprof command.
This is part of the I/O tracking results.

[Results]

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
