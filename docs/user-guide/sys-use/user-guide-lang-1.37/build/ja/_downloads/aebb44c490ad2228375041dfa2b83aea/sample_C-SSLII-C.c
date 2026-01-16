/*** vpst2#c_dvlax **********************************************/
/*                                                              */
/*   c_ssl2 test program   copyright fujitsu ltd. 1997          */
/*                                                              */
/*   this program tests                                         */
/*       c_dvlax ,                                              */
/*   which work together to solve a system of linear equations  */
/*   with a real matrix.                                        */
/*   this program also needs the following:                     */
/*       c_dmav.                                                */
/*   this program was coded on Nov.10,1997.                     */
/*                                                              */
/****************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include "cssl.h"

#define MAXN 501
#define NTESTS 5

void mata(double a[][MAXN],int n);
void tstprt(double b[],int n,double errbd,double dtime);

int MAIN__()
{
        static double a[MAXN][MAXN],x[MAXN],b[MAXN];
        static double vw[MAXN];
        static int ip[MAXN];
        double epsz,errbd,dtime;
        int i,j,n,is;
        clock_t ita,itb;
        int ni[NTESTS]={100,200,300,400,500};
        int isw,ie,icon;
        printf("****************************************");
        printf("**************************\n");
        printf("*                                       ");
        printf("                         *\n");
        printf("*  --- c_dvlax ---                      ");
        printf("                         *\n");
        printf("*                                       ");
        printf("                         *\n");
        printf("*  if sign of 'ok' is found in every 're");
        printf("mark' entry              *\n");
        printf("*  the above subroutine have been certif");
        printf("ied as correct           *\n");
        printf("*                                       ");
        printf("                         *\n");
        printf("****************************************");
        printf("**************************\n");
        printf("      dimension      error        time(s)   remark\n");
        for(i=0;i<NTESTS;i++) {
                n=ni[i];
                epsz=0.0;
                isw=1;
                mata(a,n);
                for(j=0;j<n;j++) x[j]=j+1;
                ie=c_dmav((double*)a,MAXN,n,n,x,b,&icon);
                if(icon!=0) {
                        printf("WARNING:c_dmav failed with icon = %d\n",icon);
                        exit(1);
                }
                ita=clock();
                ie=c_dvlax((double *)a,MAXN,n,b,epsz,isw,&is,vw,ip,&icon);
                itb=clock();
                if(icon!=0) {
                        printf("WARNING:c_dvlax failed with icon = %d\n",icon);
                        exit(1);
                }
                errbd=1e-12;
                dtime=(double)(itb-ita)/(double)CLOCKS_PER_SEC;
                tstprt(b,n,errbd,dtime);
        }
        printf("\n                                    *** end of test ***\n");
        return 0;
}

void mata(double a[][MAXN],int n)
{
        int n1,i,j;
        double pai,c;
        n1=n+1;
        pai=atan(1.0)*4.0/(double)n1;
        c=sqrt(2.0/(double)n1);
        for(i=0;i<n;i++) {
                for(j=0;j<=i;j++) {
                        a[j][i]=a[i][j]=c*sin((double)((i+1)*(j+1))*pai);
                }
        }
}

void tstprt(double b[],int n,double errbd,double dtime)
{
        double bnmax,err;
        int i;
        bnmax=0.0;
        for(i=0;i<n;i++) {
                if(bnmax<=fabs(b[i]-(i+1))) bnmax=fabs(b[i]-(i+1));
        }
        err=bnmax/n;
        if(err<=errbd) {
                printf("       %5d    %12.3g    %8.3f      OK\n",
                                n,err,dtime);
        } else {
                printf("       %5d    %12.3g    %8.3f      ?\n",
                                n,err,dtime);
        }
}
