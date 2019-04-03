module Square_mod
contains
   
   pure real function square(x)
      real, intent(in) :: x
      square = x**2
   end function square
end module Square_mod
   
