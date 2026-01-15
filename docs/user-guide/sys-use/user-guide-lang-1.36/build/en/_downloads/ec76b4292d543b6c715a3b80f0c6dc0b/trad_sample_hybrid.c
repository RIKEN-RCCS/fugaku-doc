#include <stdio.h>
#include "mpi.h"
#define SIZE 9000

int
main(int argc, char *argv[])
{
        int     rank, size, root;
        int     data, result;
        int     i,j;
        double  a[SIZE][SIZE],b[SIZE][SIZE],c[SIZE][SIZE];

        result = 0;

        MPI_Init(&argc, &argv);
        MPI_Comm_rank(MPI_COMM_WORLD, &rank);
        MPI_Comm_size(MPI_COMM_WORLD, &size);

        for(i=0; i < SIZE; i++){
                for(j=0; j < SIZE; j++){
                        a[i][j] = (double)(i+j*0.5);
                        b[i][j] = (double)(i+j/(rank+1));
                        c[i][j] = a[i][j] + b[i][j];
                }
        }

        data = c[1][1]/(rank+1);

        if (rank == 0) {
                fprintf(stdout, "MPI communication start. size=%d\n", size);
                fflush(stdout);
        }

        root = 0;
        MPI_Reduce(&data, &result, 1, MPI_INT, MPI_SUM, root, MPI_COMM_WORLD);

        if (rank == 0) {
                fprintf(stdout, "MPI communication end\n");
                fprintf(stdout, "result(%d)\n",result);
                fflush(stdout);
        }

        MPI_Finalize();
        return 0;
}
