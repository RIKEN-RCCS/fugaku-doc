      parameter(n=5888)
      real*8 a(n+1,n),b(n+1,n),c(n+1,n)
      real*8 t0,t1,second
!
!  print message
!
      write(6,500)
      write(6,510) n,n
  500 format(" *** matrix multiply *** ")
  510 format(' (NPROW,NPCOL) : (',I6,',',I6,')')

!
!  initialize matrix
!
      do j=1,n
        do i=1,n
          a(i,j)=0.1d0
          b(j,i)=0.3d0
          c(i,j)=0.0d0
        end do
      end do
!
!  do matrix multiply
!
      t0 = second()
        do j=1,n
          do i=1,n
            do k=1,n
              c(i,j) = c(i,j) + a(i,k) * b(k,j)
            end do
          end do
      end do
      t1 = second()
!
!  print result
!
      write(6,520) c(1,1)
      write(6,530) t1-t0
  520 format(" c(1,1)=",g10.4)
  530 format(" time :",f10.2," sec")
      end
!----
      function second()
      real*8 second,t
      call gettod(t)
      second=t*1.e-6
      end
