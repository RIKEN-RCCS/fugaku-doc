#!/bin/sh
#PJM -L "node=1"
#PJM -L "rscunit=rscunit_ft01"
#PJM -L "rscgrp=small"
#PJM -L "elapse=10:00"
#PJM -s

# execute job
export OMP_NUM_THREADS=12
./sample_omp
