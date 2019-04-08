!------------------------------------------------------------------------------
! This file demonstrates how to have a throw() method in the source
! code that does not have an explicit dependency on the testing
! framework.
!
! Background: code that stops/aborts is unfriendly to testing
! frameworks that ideally want to attempt running later tests.  At the
! same time, an explicit dependency on pFUnit forces users of your
! application to install pFUnit even if they don't care about testing
! your code
!
! Solution:
!
!   During initialization the testing framework can override the
!   default behavior with a call to set_throw_method().  This logic
!   can comfortably live in your test code, and thus does not
!   introduce any undesirable dependencies.  (Just a bit of
!   obscurity.)
!
!------------------------------------------------------------------------------

module throw_mod
   implicit none
   private

   public :: throw_exception
   public :: set_throw_method

   abstract interface
      subroutine throw(filename, line_number, message)
         character(len=*), intent(in) :: filename
         integer, intent(in) :: line_number
         character(len=*), optional, intent(in) :: message
      end subroutine throw
   end interface

   procedure (throw), pointer :: throw_method => null()
   logical, save :: initialized = .false.

contains

   subroutine set_throw_method(method)
      procedure (throw) :: method
      if (.not. initialized) call initialize()
      throw_method => method
   end subroutine set_throw_method

   subroutine initialize()
      throw_method => Fail
      initialized = .true.
   end subroutine initialize

   
   subroutine throw_exception(filename, line_number, message)
      character(len=*), intent(in) :: filename
      integer, intent(in) :: line_number
      character(len=*), optional, intent(in) :: message

      if (.not. initialized) then
         call initialize()
      end if

      call throw_method(filename, line_number, message=message)
      
   end subroutine throw_exception


   subroutine Fail(filename, line, message)
      use, intrinsic :: iso_fortran_env, only: ERROR_UNIT
      character(*), intent(in) :: filename
      integer, intent(in) :: line
      character(*), optional, intent(in) :: message

      integer, parameter :: FIELD_WIDTH=40
      character(FIELD_WIDTH) :: use_name
      character(3) :: prefix
      character(:), allocatable :: base_name
      
      base_name = get_base_name(filename)
      if (len(base_name) > FIELD_WIDTH) then
         prefix = '...'
         use_name = base_name(2:)
      else
         prefix = '   '
         use_name = base_name
      end if

      write(ERROR_UNIT,'(a,i5.5,1x,1x,a3,a80,1x,a)') &
           & 'FAIL at line=', line, prefix, use_name, &
           & '<'//adjustl(trim(message))//'>'

   end subroutine Fail



   ! TODO: Rather than taking the last N characters, it might make
   ! more sense for the following procedure to omit just the middle
   ! characters in a long string.  The trick is to intelligently split on
   ! directories.    Maybe specify a max depth at both ends?
   function get_short_name(filename, maxlen) result(short_name)
      character(:), allocatable :: short_name
      character(*), intent(in) :: filename
      integer, optional, intent(in) :: maxlen
      integer, parameter :: MAX_LEN_SHORT_NAME = 60

      integer :: maxlen_
      integer :: n

      maxlen_ = MAX_LEN_SHORT_NAME
      if (present(maxlen)) maxlen_ = maxlen
      
      n = len_trim(filename)
      short_name = filename(max(1,n+1-maxlen_):)

   end function get_short_name


   function get_base_name(filename) result(base_name)
      character(:), allocatable :: base_name
      character(*), intent(in) :: filename

      integer :: idx

      idx = scan(filename, '/', back=.true.)

      base_name = filename(idx+1:)

   end function get_base_name



end module throw_mod
