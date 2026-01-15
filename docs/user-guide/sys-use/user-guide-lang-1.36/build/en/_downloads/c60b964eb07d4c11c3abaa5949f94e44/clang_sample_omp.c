#include <stdio.h>
#include <math.h>
#include <sys/time.h>

#define N 5888

double gettimeofday_sec(){
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return tv.tv_sec + (double)tv.tv_usec*1e-6;
}

int main(){
    double a[N][N+1];
    double b[N][N+1];
    double c[N][N+1];
    int i, j, k;
    double t1,t2;

//
//  print message
//
    printf ("\n");
    printf ("%d, %d\n", N, N);

//
//  initialize matrix
//
#pragma omp parallel for shared(a,b,c)
    for (j = 0; j < N; j++) {
       for (i = 0; i < N; i++) {
          a[j][i] = 0.1;
          b[j][i] = 0.3;
          c[j][i] = 0.0;
       }
    }

//
//  do matrix multiply
//
    t1 = gettimeofday_sec();
#pragma omp parallel for shared(a,b,c)
    for (j = 0; j < N; j++) {
       for (i = 0; i < N; i++) {
          for (k = 0; k < N; k++) {
             c[i][j] = c[i][j] + a[i][k] * b[k][j];
          }
       }
    }
    t2 = gettimeofday_sec();

//
//  print result
//
    printf("c[1][1] = %f\n", c[1][1]);
    printf("time : %f sec.\n", t2 - t1);
    return 0;
}
