      PROGRAM sample_mpi
      INCLUDE 'mpif.h'
      INTEGER,parameter :: RANGE=9000

      INTEGER :: rank, size, root, ierror
      INTEGER :: i, j, data, result
      REAL(8), DIMENSION(RANGE, RANGE) :: a,b,c

      result = 0
      c(:,:) = 0.0d0

      CALL MPI_INIT( ierror )
      CALL MPI_COMM_RANK( MPI_COMM_WORLD, rank, ierror )
      CALL MPI_COMM_SIZE( MPI_COMM_WORLD, size, ierror )

      IF ( rank .EQ. 0 ) THEN
         WRITE(*,*) 'MPI communication start. size=',size
      ENDIF

      DO j=1 ,RANGE
        DO i=1, RANGE
          a(i,j) = i+j*0.5
          b(i,j) = i+j/(rank+1)
          c(i,j) = a(i,j)+b(i,j)
        ENDDO
      ENDDO

      data = c(1,1)/(rank+1)
      root = 0
      CALL MPI_REDUCE( data, result, 1, MPI_INTEGER, MPI_SUM,
     & root,MPI_COMM_WORLD, ierror )

      IF (rank .EQ. 0) THEN
         WRITE(*,*) 'MPI communication end'
         WRITE(*,*) 'result(',result,')'
      ENDIF

      CALL MPI_FINALIZE( ierror )
      STOP
      END PROGRAM sample_mpi
