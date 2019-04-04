module broken_sut_mod
   use throw_mod
   implicit none
   private

   public :: square
   public :: factorial
   
contains

   elemental real function square(x)
      real, intent(in) :: x

      square = x**2.0001

   end function square


   recursive integer function factorial(n) result(n_factorial)
      integer, intent(in) :: n

      if (n < 0) then
         n_factorial = -1
         call throw_exception('Argument to factorial must be >= 0', __LINE__, __FILE__)
         return
      end if

      if (n == 0) then
         n_factorial = 0
      else
         n_factorial = n * factorial(n-1)
      end if

   end function factorial
   
end module broken_sut_mod
