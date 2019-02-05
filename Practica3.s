#/*=========================================================================
#===========================================================================
#    =            Nombre Archivo:    Practica3.s                       =
#    =            Autor:         Adrián Epifanio R.H                   =
#    =            Fecha:         2018                                  =
#    =            Asignatura:    Principios de Computadores            =
#    =            Lenguaje:      MIPS                                  = 
#===========================================================================          
#=========================================================================*/

# PRACTICA 3 DE PRINCIPIOS DE COMPUTADORES.

  .data

titulo:		 .asciiz  	"Practica 3. Principios de Computadores\n"
tolerancia:  .asciiz 	"Introduzca el error maximo permitido: "
nume:  		 .asciiz	"\nEl numero e es: "
ite:		 .asciiz	"\nEl numero de iteraciones de bucle utilizadas es: "


  .text

main:
	# las siguientes lineas sirven para imprimir una cadena por la consola
	li $v0,4	# el registro $v0 debe tener el valor 4 para imprimir cadenas
	la $a0, titulo	# el registro $a0 debe tener la direccion de la cadena a imprimir
	syscall

	# las siguientes lineas imprimen la cadena de peticion del operando 1 por consola
	li $v0,4
	la $a0, tolerancia
	syscall


	li $v0,6
	syscall
	mov.s $f20, $f0 # el flotante leido lo muevo a $f0 para posteriormente operarlo
	# las siguientes lineas leen un flotante por consola y dejan el flotante leido en $v0

 	li.s $f21, 1.0  #Inicializo el flotante f21 a 1.0
	li.s $f22, 1.0	#Inicializo el flotante f22 a 1.0
	li.s $f23, 0.0	#Inicializo el flotante f23 a 0.0
	li.s $f24, 1.0	#Inicializo el flotante f24 a 1.0


	div.s $f25, $f21, $f21  #Divido f21/f21 aparte para hacer el 1/0! antes de iniciar el bucle

	for: 	#creo un bucle for
		mov.s $f26, $f22	#muevo f22 a f26	
		if: 	#creo un bucle if 
			c.eq.s $f26, $f23	#hago una condicional si f23 == f26 
			bc1t end_if	#Si la condicion anterior se cumple se finaliza el bucle, si no sigue
			div.s $f27, $f21, $f26	#Divido f26/f21 y lo alaceno en f27
			mul.s $f24, $f24, $f27	#multiplico f27/f24 y lo alaceno en f24
			sub.s $f26, $f26, $f21  #resto f26-f21 y lo amaceno en f26
			j if  #salto a la etiqueta if
		end_if: #finalizo el bucle if

		add.s $f29, $f24, $f25	 #sumo f25 + f24 y lo alaceno en f29
		sub.s $f28, $f29, $f25	#resto f29 - f25 y la almaceno en f28

		c.le.s $f28, $f20 #c.le.s es una condicional "<=", es decir, si f28 <= f20
			bc1t end_for #Si la condicion anterior se cumple salto al end_for
			mov.s $f25, $f29	#muevo f29 a f25
			add.s $f22, $f22, $f21  #sumo f22 + f21 y lo almaceno en f22
			mov.s $f24, $f21  #muevo f21 a f24
			j for  #salto a la etiqueta for incial
	end_for: 	#finalizo el bucle for

	#Las siguientes lineas imprimen una cadena de caracteres
	li $v0,4
	la $a0, nume
	syscall

	#las siguientes lineas imprimen el numero almacenado en f25
	li $v0,2
	mov.s $f12, $f25
	syscall


#=======================EJERCICIO1========================
	#Las siguientes lineas imprimen una cadena de caracteres
	li $v0,4
	la $a0, ite
	syscall


	#las siguientes lineas imprimen el numero almacenado en f22 (numero de iteraciones)
	li $v0,2
	mov.s $f12, $f22
	syscall

	#las siguientes lineas finalizan el programa
	li $v0,10
	syscall	


#/* Programa para calcular el número e en C */
# 
##include <stdio.h>
##include <stdlib.h>
#int main( )
#{ 
#        float sumatorio,producto,num;
#        producto=1;
#        sumatorio=1;
# 
#        for (num=1;num<=10;num++)
#        {
#             producto=producto*num;
#             sumatorio=sumatorio+(1/producto);
#         }
#        printf("El numero e es: %fn",sumatorio);
#  system("pause");
#  return 0;
#}



##===========================EJERCICIO 2 ==========================
#Utilice el registro $f0	 para el valor de retorno en punto flotante.
#No utilice registros del $f4-$f10 que son son los registros temporales.
#He usado el registro $f12 para los 2 primeros parametros en punto flotante que no se preservan.
#Por ultimo tambien he empleado los registros de $f20-$f29 que son registros salvados para almacenar los datos de las variables.



#========================= EJERCICIO 3 ==========================
#Para pasar el programa de precision simple a doble precision bastaria con cambiar todas las funciones terminadas en .s a .d.
#En cuanto a los registros seria necesario emplear dos registros para cada variable por lo que seria necesario cambiar los registros para poder pasar el programa a doble precision.
#Por lo tanto, afectaria a mis registros ya que por ejemplo si quiero almacenar un numero de doble precision en $f20 se me guardaria en %f20-$f21 porque necesita el doble de memoria.
