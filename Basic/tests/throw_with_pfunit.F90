module throw_with_pfunit_mod
   use throw_mod, only: set_throw_method
   implicit none
   private

   public :: throw
   public :: initialize_throw

contains

   subroutine throw(file_name, line_number, message)
      use funit, only: SourceLocation
      use funit, only: pFUnit_throw => throw
      character(len=*), intent(in) :: file_name
      integer, intent(in) :: line_number
      character(len=*), optional, intent(in) :: message

      character(len=:), allocatable :: message_

      if (present(message)) then
         message_ = message
      else
         message_ = '<no message>'
      end if
      call pFUnit_throw(message_, SourceLocation(file_name, line_number))

   end subroutine throw

   subroutine initialize_throw()
      call set_throw_method(throw)
   end subroutine initialize_throw

   
end module throw_with_pfunit_mod
