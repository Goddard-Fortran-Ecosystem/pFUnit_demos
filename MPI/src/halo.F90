! This module uses MPI to implement a 2D distributed array with a 1D
! decomposition in the North-South direction (2nd dimension).  The
! domain is not periodic, so the extrema subdomains only have 1
! neighbor.
!
! The halo_width is 1.
!

module halo_mod
   use MPI
   implicit none
   private

   public :: fill_halo
   public :: get_pe_south
   public :: get_pe_north


contains


   subroutine fill_halo(array, comm)
      real, intent(in) :: array(:,0:)
      integer, intent(in) :: comm ! mpi communicator

      integer :: rank, npes, ier
      integer :: status(MPI_STATUS_SIZE)
      integer, parameter :: SOUTH_TAG = 10 ! arbitrary
      integer, parameter :: NORTH_TAG = 11 ! arbitrary
      integer :: peSouth, peNorth

      integer :: nx, ny

      nx = size(array,1)
      ny = ubound(array,2) - 1

      call mpi_comm_rank(comm, rank, ier)
      call mpi_comm_size(comm, npes, ier)

      peSouth = get_pe_south(rank, npes)
      peNorth = get_pe_north(rank, npes)

      ! Southern halo
      call mpi_sendrecv(array(:, ny), nx, MPI_REAL, peNorth, SOUTH_TAG, &
           & array(:,0), nx, MPI_REAL, peSouth, SOUTH_TAG, &
           & comm, status, ier)

      ! Northern halo
      call mpi_sendrecv(array(:, 1), nx, MPI_REAL, peSouth, NORTH_TAG, &
           & array(:,ny+1), nx, MPI_REAL, peNorth, NORTH_TAG, &
           & comm, status, ier)

   end subroutine fill_halo


   integer function get_pe_south(rank, npes) result(PEsouth)
      integer, intent(in) :: rank
      integer, intent(in) :: npes

      if (rank > 0) then
         PEsouth = rank - 1
      else
         PEsouth = MPI_PROC_NULL
      end if

   end function get_pe_south

   integer function get_pe_north(rank, npes) result(PEnorth)
      integer, intent(in) :: rank
      integer, intent(in) :: npes

      if (rank < npes - 1) then
         PEnorth = rank + 1
      else
         PEnorth = MPI_PROC_NULL
      end if

   end function get_pe_north

end module Halo_mod
