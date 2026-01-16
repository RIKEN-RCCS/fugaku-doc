#!/bin/sh
#PJM -L "node=1"
#PJM -L "rscunit=rscunit_ft01"
#PJM -L "rscgrp=dvsmall"
#PJM -L "elapse=10:00"
#PJM --mpi max-proc-per-node=4
#PJM -s

# execute job
mpiexec ./sample_ScaLAPACK
