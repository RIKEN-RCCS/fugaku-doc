c     *** samps ******************************************************
c     *                                                              *
c     *   samps.f copyright FUJITSU LTD. 1997                        *
c     *                                                              *
c     *   This program tests                                         *
c     *        pdgesv                                                *
c     *                                                              *
c     *   which work together to solve a system of linear equations  *
c     *   with a real matrix.                                        *
c     *   This program also needs the followings:                    *
c     *        pdlange,                                              *
c     *        pdgecon,                                              *
c     *        pdgemv,                                               *
c     *        pdlamch.                                              *
c     *   This program was coded on July,10,1998.                     *
c     *                                                              *
c     ****************************************************************
      implicit real*8 (a-h,o-z)
c
c  Please modify nprow,npcol if your processer number is less than 4
c
      parameter(nprow=2,npcol=2)
      parameter(maxn=400,mb=20,nb=20,nrhs=40,nrhsb=10)
      parameter(ld=(maxn+(mb*nprow)-1)/(mb*nprow)*mb+1)
      parameter(lwork=maxn*5,iwork=maxn)
      integer dlen_
c      integer csrc_, ctxt_, dtype_,lld_,mb_, m_, nb_, n_, rsrc_
      parameter (dlen_=9)
c      parameter (dtype_=1,ctxt_=2,m_=3,n_=4,mb_=5,nb_= 6)
c      parameter (rsrc_=7,csrc_=8,lld_=9)
      real*8 a(ld,maxn),x(ld,nrhs),b(ld,nrhs)
      real*8 w(lwork)
      integer desca(dlen_),descb(dlen_),descx(dlen_)
      integer ictxt,npr,npc,myrow,mycol,info
      real*8 eps,pdlamch
      integer ip(maxn),iw(iwork)
      character*2 ko,kq
      data ko,kq/2hok,2h ?/
c
c         initialize the process grid
      npr=nprow
      npc=npcol
      call SL_init(ictxt,npr,npc)
      call blacs_gridinfo(ictxt,npr,npc,myrow,mycol)
c         initialize the array descriptors
      n=maxn
      call descinit(desca,n,n,   mb,nb,   0,0,ictxt,ld,info)
      call descinit(descb,n,nrhs,mb,nrhsb,0,0,ictxt,ld,info)
      call descinit(descx,n,nrhs,mb,nrhsb,0,0,ictxt,ld,info)
      eps=pdlamch(ictxt,'E')
c
      if (myrow.eq.0 .and. mycol.eq.0) write(6,600)
  600 format(
     -'**********************************************************'/
     -'*                                                        *'/
     -'*  --- pdgesv ---                                        *'/
     -'*                                                        *'/
     -'*  if sign of ''ok'' is found in every ''remark'' entry      *'/
     -'*  the above subroutine have been certified as correct   *'/
     -'*                                                        *'/
     -'**********************************************************'//)
c
      if (myrow.eq.0 .and. mycol.eq.0) write(6,620)
  620 format(t5,'dimension',t22,'No.',t35,'error',t48,'error bound',
     -       t63,'remark')
c
c         set a frank matrix in A and get the norm of A
c
       call pmata(ictxt,n,nrhs,a,desca,ld,x,descx,ld)
       anorm=pdlange('I',n,n,a,1,1,desca,w)
c
c         set constant value in b using dgemv.
c
       call pdgemm('N','N',n,nrhs,n,1.0d0,a,1,1,desca,
     -            x,1,1,descx,0.0d0,b,1,1,descb)
c
c         solve the equations
c
       call pdgesv(n,nrhs,a,1,1,desca,ip,b,1,1,descb,info)
       if(info.ne.0) then
        write(6,630) info
  630   format(1h ,17h*** pdgesv info = ,i5,3h***)
        stop
       endif
c
c         evaluate the solution.
c
       call pdgecon('I',n,a,1,1,desca,anorm,rcond,
     -              w,lwork,iw,iwork,info2)
       rcond=max(rcond,eps)
       errbd=eps/rcond   *2.0d0
       call ptstprt(ictxt,b,ld,descb,n,nrhs,errbd,ko,kq)

      if (myrow.eq.0 .and. mycol.eq.0) write(6,680)
  680 format(//50x,19h*** end of test *** )
      call blacs_exit(0)
      stop
      end
C===========================================================
      subroutine ptstprt(ictxt,b,ld,descb,n,nrhs,errbd,ko,kq)
      implicit real*8 (a-h,o-z)
      real*8 b(ld,*),bnmax
      real*8 err,errbd
      integer dlen_,mb_,nb_
c      integer csrc_,ctxt_,dtype_,lld_,m_,n_,rsrc_
      parameter (dlen_=9,mb_=5,nb_= 6)
c      parameter (dtype_=1,ctxt_=2,m_=3,n_=4)
c      parameter (rsrc_=7,csrc_=8,lld_=9)
      integer dummy,descb(dlen_)
      character*2 ko,kq,iok
C
      call blacs_gridinfo(ictxt,npr,npc,myrow,mycol)
      mb=descb(mb_)
      nb=descb(nb_)
C
      err=0.0d0
      imine=0
      is=1
      do i=1,nrhs
        ib=mod(((i-1)/nb),npc)
        bnmax=0.0d0
        iok=ko
        if(mycol.eq.ib) then
          imine=imine+1
          jlb=0
          do jgb=mb*myrow,n,npr*mb
            nj=min(mb,n-jgb)
            do j=1,nj
              w=abs(b(jlb+j,imine)-(jgb+j)*i)
              if(bnmax.lt.w) bnmax=w
            end do
            jlb=jlb+mb
          end do
        end if
        call dgamx2d(ictxt,'A',' ',1,1,bnmax,1,dummy,dummy,-1,0,0)
        err=max(err,bnmax/(n*i))
        if(mod(i,nb).eq.0 .and. myrow.eq.0 .and. mycol.eq.0) then
          if(err.gt.errbd) iok=kq
          write(6,600) n,is,i,err,errbd,iok
          is=i
          err=0.0d0
        end if
      end do
      if(is.ne.nrhs .and. myrow.eq.0 .and. mycol.eq.0) then
          if(err.gt.errbd) iok=kq
          write(6,600) n,is,nrhs,err,errbd,iok
          is=i
      end if
      return
  600 format(5x,i4,8x,i4,'-',i4,3x,2(d12.3,4x),3x,a2)
      end
C===========================================================
      subroutine pmata(ictxt,n,nrhs,a,desca,lda,x,descx,ldx)
      implicit real*8 (a-h,o-z)
      integer dlen_,mb_,nb_
c      integer csrc_,ctxt_,dtype_,lld_,m_,n_,rsrc_
      parameter (dlen_=9,mb_=5,nb_= 6)
c      parameter (dtype_=1,ctxt_=2,m_=3,n_=4)
c      parameter (rsrc_=7,csrc_=8,lld_=9)
      real*8  a(lda,*),x(ldx,*)
      integer desca(dlen_),descx(dlen_)
c
      n1=n+1
      pai=datan(1.0d0)*4.0d0/dfloat(n1)
      c=dsqrt(2.0d0/n1)
c
      call blacs_gridinfo(ictxt,npr,npc,myrow,mycol)
      mb=desca(mb_)
      nb=desca(nb_)
c
      ilb=0
      do igb=nb*mycol,n,npc*nb
        jlb=0
        do jgb=mb*myrow,n,npr*mb
          ni=min(nb,n-igb)
          nj=min(mb,n-jgb)
          do i=1,ni
            do j=1,nj
              a(jlb+j,ilb+i)=c*dsin(dfloat((jgb+j)*(igb+i))*pai)
            end do
          end do
          jlb=jlb+mb
        end do
        ilb=ilb+nb
      end do
C
      mb=descx(mb_)
      nb=descx(nb_)
      ilb=0
      do igb=nb*mycol,nrhs,npc*nb
        jlb=0
        do jgb=mb*myrow,n,npr*mb
          ni=min(nb,nrhs-igb)
          nj=min(mb,n-jgb)
          do i=1,ni
            do j=1,nj
              x(jlb+j,ilb+i)=(jgb+j)*(igb+i)
            end do
          end do
          jlb=jlb+mb
        end do
        ilb=ilb+nb
      end do
C
      return
      end
