c     Programa para derivar numéricamente la función f(x) en el intervalo [a,b] 

      program MAIN
      IMPLICIT DOUBLE PRECISION(a-h,o-z)
      parameter (N=200)		! número de celdas				
      DIMENSION f(-1:N+1) 	! función muestreada. porque en el bucle de avanzadas y derivadas vamos acceder a los extre
      
      a=0.0d0		! límite inferior
      b=10.0d0		! límite superior
      h=(b-a)/(N-1)	! espaciado

      do i=-1,N+1	! muestreamos la función
        x=a+i*h
        f(i)=cos(x) !es un lista. en posición i se almacena cos(a+i*h)
      end do

      open (1,file='derivadas.dat')
      open (2,file='errores.dat')      

      do i=0,N
        x=a+i*h
        fpa=(f(i+1)-f(i))/h				! f'(x) avanzada, I SON POSICIONES DE MEMORIA
        fpc=(f(i+1)-f(i-1))/(2.0d0*h)		! f'(x) centrada
        fpp=2.0d0*(f(i+1)-f(i)-h*fpc)/(h**2.0d0) !f''(x) usamos la centrada
	
        epa=abs((fpa-(-sin(x))))			! error absoluto en f'(x) avanzada
        epc=abs((fpc-(-sin(x))))			! error absoluto en f'(x) centrada
        epp=abs((fpp-(-sin(x))))			! error absoluto en f''(x)
	
        write(1,*) x,fpa,fpc,fpp			! escribimos las derivadas
        write(2,*) x,epa,epc,epp			! escribimos los errores absolutos en las derivadas
      end do

      close(1)
      close(2)      

      end program


