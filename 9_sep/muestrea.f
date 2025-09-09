C     Programa para muestrear una función en un intervalo
C     Red con nodos en los extremos de las celdas

      program MAIN
      IMPLICIT DOUBLE PRECISION(a-h,o-z) ! esto o implicit none y "integrer i,N ; real.8 a,b,h,f,x"
      parameter (N=100)	 !valor inicial N				
      DIMENSION f(0:N) !vector de 0 a N (dimensiones)

      a= 0			! límite inferior del intervalo a=0.d0
      b= 10			! límite superior del intervalo b=10.0d0
      h=(b-a)/N		! espaciado (paso de red)

      do i=0,N
        x=a+i*h		! relación entre la variable continua y el contador
        f(i)= Cos(x)            !i son las posiciones de memoria
      end do

      open (1,file='funcion.dat')		! representamos la función
      do i=0,N
        x=a+i*h
        write(1,*) i,x,f(i)			!fichero de salida. i sos las etiquetas de las posiciones de f
      end do
      close(1)

      end program
