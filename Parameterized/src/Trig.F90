module Trig_mod
   implicit none
   private

   public :: compute_hypotenuse

contains

   ! Simple implementation of function that computes the hypotenuse of
   ! a right triangle given legs a and b.
   pure function compute_hypotenuse(a, b) result(c)
      real :: c
      real, intent(in) :: a, b

      c = sqrt(a**2 + b**2)
   end function compute_hypotenuse
      
end module Trig_mod
