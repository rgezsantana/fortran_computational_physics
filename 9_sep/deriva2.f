c     Programa para derivar num�ricamente la funci�n f(x) en el punto x en funci�n de h

      PROGRAM main
      IMPLICIT DOUBLE PRECISION(a-h,o-z)
      parameter (N=200)		! n�mero de celdas
      parameter (x=1.0d0)		! punto en el que se eval�an las derivacas
      
      f0=cos(x)		! valor exacto de la funci�n en el punto x
      fp0=-sin(x)		!  valor exacto de la derivada primera en el punto x
      fpp0=-cos(x)	!  valor exacto de la derivada segunda en el punto x
       
      open (1,FILE='error.dat')

      do i=1,N
      
        h=(1.0/3.0)**i			! h disminuye en un factor 3 cada vez

        fpa=(cos(x+h)-f0)/h						! f'(x), expresi�n adelantada
        fpc=...								! f'(x), expresi�n centrada
        fpp=...								! f''(x)

        efpa=abs((fpa-fp0)/fp0)		! error relativo en f'(x), expresi�n adelantada
        efpb=...					! error relativo en f'(x), expresi�n centrada
        efpp=...					! error relativo en f''(x)

        write(1,*) h,efpa,efpb,efpp	! escribimos los errores para cada valor del espaciado

      end do

      close(1)

      END
