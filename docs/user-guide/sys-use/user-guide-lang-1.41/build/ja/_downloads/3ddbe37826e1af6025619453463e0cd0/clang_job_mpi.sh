#!/bin/sh
#PJM -L "node=2"
#PJM -L "rscunit=rscunit_ft01"
#PJM -L "rscgrp=small"
#PJM -L "elapse=10:00"
#PJM --mpi max-proc-per-node=4
#PJM -s

# execute job
export OMP_NUM_THREADS=12
mpiexec -n 8 ./sample_mpi
