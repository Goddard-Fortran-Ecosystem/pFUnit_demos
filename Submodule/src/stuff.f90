module stuff
implicit none
public :: add

contains

subroutine add(a, b, res)
    real, intent(in) :: a
    real, intent(in) :: b
    real, intent(out) :: res

    res = a + b
end subroutine add

end module stuff