C     *** VPST2#DLAX *************************************************
C     *                                                              *
C     *  SSL2-RUNNER COPYRIGHT FUJITSU LTD. 1982,1984,1986,1990,1999 *
C     *                                                              *
C     *   THIS PROGRAM TESTS                                         *
C     *       DLAX (A22-11-0101),                                    *
C     *       DALU (A22-11-0202),                                    *
C     *       DLUX (A22-11-0302)                                     *
C     *   WHICH WORK TOGETHER TO SOLVE A SYSTEM OF LINEAR EQUATIONS  *
C     *   WITH A REAL MATRIX.                                        *
C     *   THIS PROGRAM ALSO NEEDS THE FOLLOWINGS:                    *
C     *       DMACH,                                                 *
C     *       MGSSL,                                                 *
C     *       DMAV.                                                  *
C     *   THIS PROGRAM WAS INITIALLY CODED ON FEB. 3,1982,           *
C     *   AND MODIFIED ON SEP.5 ,1999 TO TEST THREAD-SAFE SUBROUTINES*
C     *                                                              *
C     ****************************************************************
      IMPLICIT REAL*8 (A-H,O-Z)
C     MAXIMUM ARRAY SIZE IS 200. 
      REAL*8 A(201,200),X(200),VW(200),BW(200),B(200),
     *       BWW(200),AW(201,200)
      REAL*8 EPSZ,DMACH
      INTEGER*4 ITA,ITB,ITC
      INTEGER IP(200),NI(6)
      CHARACTER*2 KO,KQ,IOK
      CHARACTER*2 I_IOK
      CHARACTER*8 YYMMDD
      DATA KO,KQ/2HOK,2H ?/
      DATA NI/50,64,100,128,150,200/
      DATA K/201/
      DATA EPSZ/0.0D0/
C
      DIMENSION A_TIME1(6),A_ERR1(6),A_TIME2(6),A_ERR2(6)
      DIMENSION I_LOOP1(6),I_ICON1(6),I_LOOP2(6),I_ICON2(6),I_IOK(6)
C
      M=6
      TMAX=1000.0D0
      CALL CLOCKM(ITA)
      U=10000.D0*DMACH(U)
C
      CALL DATE(YYMMDD)
      WRITE(6,600) YYMMDD
  600 FORMAT(
     *'****************************************',
     *'****************************************'/
     *'*                                       ',
     *'                                       *'/
     *'* --- VPST2#DLAX ---                    ',
     *'     DATE ',A8  ,'                     *'/
     *'*                                       ',
     *'                                       *'/
     *'*  THE SUBROUTINES ''DLAX'',''DALU'' AND ''DL',
     *'UX'' WHICH WORK                         *'/
     *'*  TOGETHER TO SOLVE A SYSTEM OF LINEAR ',
     *'EQUATIONS WITH                         *'/
     *'*  A REAL MATRIX WERE TESTED.           ',
     *'                                       *'/
     *'*  IF ''OK'' IS FOUND IN EVERY REMARK ENTR',
     *'Y, THE ABOVE                           *'/
     *'*  SUBROUTINES HAVE BEEN CERTIFIED AS CO',
     *'RRECT.                                 *'/
     *'*                                       ',
     *'                                       *'/
     *'****************************************',
     *'****************************************'/)
C
      WRITE(6,610)
  610 FORMAT(/,6X,1H*,12(1H-),7H ISW=1 ,12(1H-),1H*,
     *       12(1H-),7H ISW=2 ,12(1H-),1H*//
     *       2X,1HN,8X,4HTIME,2X,4HLOOP,2X,4HICON,5X,5HERROR,
     *       8X,4HTIME,2X,4HLOOP,2X,4HICON,5X,5HERROR,3X,6HREMARK/
     *       11X,4H(MS),17X,5H(X-X),8X,4H(MS),17X,5H(X-X))
C
!$OMP PARALLEL DEFAULT(PRIVATE),
!$OMP+  SHARED(KO,KQ,NI,K,EPSZ,M,TMAX,U,
!$OMP+         A_TIME1,A_ERR1,A_TIME2,A_ERR2,
!$OMP+         I_LOOP1,I_ICON1,I_LOOP2,I_ICON2,I_IOK)
!$OMP DO SCHEDULE(STATIC,1)
      DO 220 III=1,M
      N=NI(III)
C
C         SET A MATRIX IN A.
C
      CALL MATA(A,K,N)
C
C         SET A TRUE VALUE IN X.
C
      DO 10 I=1,N
   10 X(I)=1.0D0
C
C         SET A CONSTANT VALUE IN BW USING MAV.
C
      CALL DMAV(A,K,N,N,X,BW,ICOND)
      IF(ICOND.EQ.0) GO TO 20
      WRITE(6,620) ICOND
  620 FORMAT(1H ,   15H*** MAV ICON = ,I5,3H***)
      STOP
C
C         OBTAIN THE NORM
C
   20 ANOB=0.0D0
      DO 30 I=1,N
      IF(ANOB.LT.DABS(BW(I))) ANOB=DABS(BW(I))
   30 CONTINUE
      ANOX=1.0D0
      ANOA=0.0D0
      DO 50 J=1,N
      DO 40 I=1,N
      IF(ANOA.LT.DABS(A(I,J))) ANOA=DABS(A(I,J))
   40 CONTINUE
   50 CONTINUE
C
C        SOLVE THE EQUATIONS WHEN ISW=1.
C
      ISW=1
      DO 52 J=1,N
      DO 51 I=1,N
   51 AW(I,J)=A(I,J)
   52 B(J)=BW(J)
      CALL CLOCKM(ITA)
      CALL DLAX(AW,K,N,B,EPSZ,ISW,IS,VW,IP,ICON1)
      CALL CLOCKM(ITB)
      TIME1=ITB-ITA
      IF(TIME1.EQ.0.0D0) TIME1=1.0D0
      LOOP1=TMAX/TIME1+1
      IF(LOOP1.GT.1) GO TO 55
      DO 53 J=1,N
      DO 53 I=1,N
   53 A(I,J)=AW(I,J)
      GO TO 115
   55 CALL CLOCKM(ITA)
      DO 80 II=1,LOOP1
      DO 70 J=1,N
      DO 60 I=1,N
   60 AW(I,J)=A(I,J)
   70 B(J)=BW(J)
   80 CALL DLAX(AW,K,N,B,EPSZ,ISW,IS,VW,IP,ICON1)
      CALL CLOCKM(ITB)
      DO 110 II=1,LOOP1
      DO 100 J=1,N
      DO 90 I=1,N
   90 A(I,J)=AW(I,J)
  100 BWW(J)=B(J)
  110 CONTINUE
      CALL CLOCKM(ITC)
      TIME1=DFLOAT(2*ITB-ITA-ITC)/DFLOAT(LOOP1)
  115 IF(ICON1.EQ.0) GO TO 120
      WRITE(6,630)ICON1
  630 FORMAT(1H ,15H*** LAX ICON1= ,I5,3H***)
      STOP
C
C        ERROR ANALYSIS
C
  120 XB=0.0D0
      DO 130 I=1,N
      IF(XB.LT.DABS(X(I)-B(I))) XB=DABS(X(I)-B(I))
  130 CONTINUE
      ERR1=XB/(ANOB+ANOA*ANOX)
C
C        SOLVE THE EQUATIONS WHEN ISW=2.
C
      ISW=2
      DO 132 J=1,N
  132 B(J)=BW(J)
      CALL CLOCKM(ITA)
      CALL DLAX(AW,K,N,B,EPSZ,ISW,IS,VW,IP,ICON2)
      CALL CLOCKM(ITB)
      TIME2=ITB-ITA
      IF(TIME2.EQ.0.0D0) TIME2=1.0D0
      LOOP2=TMAX/TIME2+1
      IF(LOOP2.EQ.1) GO TO 195
      CALL CLOCKM(ITA)
      DO 160 II=1,LOOP2
      DO 150 J=1,N
  150 B(J)=BW(J)
  160 CALL DLAX(A,K,N,B,EPSZ,ISW,IS,VW,IP,ICON2)
      CALL CLOCKM(ITB)
      DO 190 II=1,LOOP2
      DO 180 J=1,N
  180 BWW(J)=B(J)
  190 CONTINUE
      CALL CLOCKM(ITC)
      TIME2=DFLOAT(2*ITB-ITA-ITC)/DFLOAT(LOOP2)
  195 IF(ICON2.EQ.0)GO TO 200
      WRITE(6,640)ICON2
  640 FORMAT(1H ,15H*** LAX ICON2= ,I5,3H***)
      STOP
C
C      ERROR ANALYSIS
C
  200 XB=0.0D0
      DO 210 I=1,N
      IF(XB.LT.DABS(X(I)-B(I))) XB=DABS(X(I)-B(I))
  210 CONTINUE
      ERR2=XB/(ANOB+ANOA*ANOX)
      IOK=KO
      IF(ERR1.GT.U  .AND. ERR2.GT.U) IOK=KQ
      A_TIME1(III)= TIME1
      A_ERR1(III) = ERR1
      A_TIME2(III)= TIME2
      A_ERR2(III) = ERR2
      I_LOOP1(III)= LOOP1
      I_ICON1(III)= ICON1
      I_LOOP2(III)= LOOP2
      I_ICON2(III)= ICON2
      I_IOK(III)  = IOK
  220 CONTINUE
!$OMP END DO 
!$OMP END PARALLEL
      DO I=1,M
      WRITE(6,650)NI(I),A_TIME1(I),I_LOOP1(I),I_ICON1(I),
     +   A_ERR1(I),A_TIME2(I),I_LOOP2(I),I_ICON2(I),A_ERR2(I),I_IOK(I)
      ENDDO
  650 FORMAT(I3,E12.4,I6,I6,E10.2,E12.4,I6,I6,E10.2,7X,A2)
C
      WRITE(6,660)
  660 FORMAT(/,46X,19H*** END OF TEST *** )
      STOP
      END
C
C     REAL MATRIX GENERATER FOR PERFORMANCE TEST
C     (GENERAL MODE)
C
      SUBROUTINE MATA(A,K,N)
      IMPLICIT REAL*8 (A-H,O-Z)
      DIMENSION  A(K,1)
      N1=N+1
      PAI=DATAN(1.0D0)*4.0D0/DFLOAT(N1)
      C=DSQRT(2.0D0/N1)
      DO 10 I=1,N
      DO 10 J=1,I
      A(I,J)=C*DSIN(DFLOAT(I*J)*PAI)
   10 A(J,I)=A(I,J)
      RETURN
      END

