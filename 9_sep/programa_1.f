      program programa_1
      implicit none
      integer i
c Esto es otro comentario     
      !Esto es un comentario. abajo se abre un archivo de nombre cubes, puede ser .dat o .txt
      open(20, file='cubes.dat')
      do i=1,100
         write(20,*)i,i**3,i*i !escribir en la unidad 20, asterisco significa sin formato.
      end do
      
      close(20) !cerramos fichero de texto
      end program programa_1
