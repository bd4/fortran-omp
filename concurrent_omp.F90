program main
    real, dimension(1:8, 1:10) :: res
    real, dimension(1:10, 1:10) :: x
		real, dimension(3) :: sten
		sten(1) = -1.0/2.0
		sten(2) = 1.0
		sten(3) = 1.0/2.0

	  do concurrent (i=1:10, j=1:10)
       x(i, j) = i + 100 * j
    end do
    
    call array_conv(res, x, sten)
		print *, "1, 1 ", x(1, 1), " ", res(1, 1)
		print *, "1, 8 ", x(1, 8), " ", res(1, 8)
		print *, "8, 1 ", x(8, 1), " ", res(8, 1)
		print *, "8, 8 ", x(8, 8), " ", res(8, 8)
contains

subroutine array_conv(res, x, sten)
    implicit none
    real, dimension(1:8, 1:10), intent(out) :: res
    real, dimension(1:10, 1:10), intent(in) :: x
		real, dimension(3), intent(in) :: sten
    integer :: i, j, k
    associate (sten0 => sten(1), sten1 => sten(2), sten2 => sten(3))
    do concurrent (i=1:8, j=1:10)
       res(i, j) = x(i + 0, j) * sten0 &
                 + x(i + 1, j) * sten1 &
                 + x(i + 2, j) * sten2
    end do
    end associate
end subroutine array_conv

end program main

