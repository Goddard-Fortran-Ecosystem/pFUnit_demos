module working_sut_mod
   use throw_mod
   implicit none
   private

   public :: square
   public :: factorial
   public :: file_find
   
contains

   elemental real function square(x)
      real, intent(in) :: x

      square = x**2
   end function square


   recursive integer function factorial(n) result(n_factorial)
      integer, intent(in) :: n

      if (n < 0) then
         n_factorial = -1
         call throw_exception(__FILE__, __LINE__, message='Argument to factorial must be >= 0.')
         return
      end if

      if (n == 0) then
         n_factorial = 1
      else
         n_factorial = n * factorial(n-1)
      end if

   end function factorial


   integer function file_find(filename, key) result(idx)
      use, intrinsic :: iso_fortran_env, only: IOSTAT_END
      character(*), intent(in) :: filename
      character(1), intent(in) :: key

      integer :: unit
      character(3) :: buffer
      integer :: stat

      open(file=filename, newunit=unit, status='old', form='formatted', access='sequential')

      idx = -1 ! unless
      do
         read(unit,'(a3)', iostat=stat) buffer
         if (stat == IOSTAT_END) exit
         if (buffer(1:1) == key) then
            read(buffer(3:3),'(i1)') idx
            return
         end if
      end do
      close(unit)

   end function file_find
      
end module working_sut_mod
