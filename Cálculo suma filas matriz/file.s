#/*=========================================================================
#===========================================================================
#    =            Nombre Archivo:    Practica6.s                       =
#    =            Autor:         Adrián Epifanio R.H                   =
#    =            Fecha:         2018                                  =
#    =            Asignatura:    Principios de Computadores            =
#    =            Lenguaje:      MIPS                                  = 
#===========================================================================          
#=========================================================================*/

# PRACTICA 6. PRINCIPIO DE COMPUTADORES.
# programa que calcula la suma de las filas de la matriz e imprime la de mayor valor
# La matriz tiene dimension mxn

m = 4		# numero de filas de m1
n = 5		# numero de columnas de  m1
size = 4	# tamano de cada elemento


# HAY QUE PONER UN ESPACIO DETRAS DE CADA COMA EN LA DEF DE VECTORES Y MATRICES
			.data

titulo:		.asciiz		"Practica 6. Principios de computadores\n"
datos:		.asciiz		"\nLos datos de la fila son:"
filamayor:	.asciiz		"\nLa fila de la matriz con mayor suma es: "
space:		.asciiz		", "
matriz:		.asciiz 	"La matriz es: \n"
barrita:	.asciiz 	" | "
endl:		.asciiz 	"\n"
sumafila:	.asciiz 	"\nLa suma de la fila es: "



m1:		.word	1, 2, 3, 4, 5
		.word	3, 3, 3, 3, 3
        .word	4, 4, 4, 4, 4
        .word	5, 5, 5, 5, 5
            



		.text

main:

	# las siguientes lineas sirven para imprimir una cadena por la consola
	li 		$v0,4			# el registro $v0 debe tener el valor 4 para imprimir cadenas
	la 		$a0,titulo		# el registro $a0 debe tener la direccion de la cadena a imprimir
	syscall



	la $s1,m1				#$s1 contendra la direccion base de la matriz
	move $t0, $zero			#$t0=indice de la fila. inicio 0
	li $t2, size			#tamaño de cada elemento
	li $t3, n				#$t3=n
	li $t6, m				#$t6=m
	addi $t6,-1				#le resto una unidad a t6 para proximamente hacer un calculo 
	li $t7,1				#Registro aleatorio que me ayuda en los recorridos de la matriz



	move $t1,$zero			#pongo a cero el numero de la columna
	move $t0,$zero			#pongo a cero el numero de filas
	li $v0,4
	la $a0,matriz			#imprimo una cadena
	syscall
	
	mostrar1:
	move $t1,$zero

	mostrar2:
	mul $t4,$t0,$t3			#$t4=i*n
	addu $t4,$t4,$t1		#$t4 = i*n+j
	mul $t4,$t4,$t2			#$t4=(i*n+j)*size
	addu $t4,$t4,$s1		#$t4 direccion de m1[i,j]
	lw $t4,0($t4)			#$t4 elemento matriz[i,j]

	addi $t1,$t1,1			#calculo la siguiente columna

	li $v0,1
	move $a0,$t4			#imprimo el valor de un elemento
	syscall

	li $v0,4
	la $a0,barrita			#imprimo una cadena
	syscall

	blt $t1,n,mostrar2		#comparo si el registro es menor que el numero de columnas
	li $v0,4
	la $a0,endl
	syscall

	addi $t0,$t0,1
	blt $t0,m,mostrar1		#comparo si el registro es menor que el numero de filas


#Vuelvo a inicializar los datos para calcular la suma
	move 	$t0,$zero			#$t0=indice de la fila inicio 0
	move 	$t1,$zero			#$t1=indice de columna inicio 0
	li 		$t2,size			#tamaño de cada elemento
	li 		$t3,n				#$t3=n(5)
	li 		$t6,m				#$t6=m(4)
	li 		$t4,0				#inicializo t4 a 0
	li 		$t7,0 				#inicializo t7 a 0


	# las siguientes lineas sirven para imprimir una cadena por la consola
	li 		$v0,4				# el registro $v0 debe tener el valor 4 para imprimir cadenas
	la 		$a0,datos		# el registro $a0 debe tener la direccion de la cadena a imprimir
	syscall


bucle0: 
	move 	$t1,$zero			#pongo a cero el numero de la columna
	move 	$t7,$zero 			#pongo a cero el contador de suma


bucle1:
	mul 	$t5,$t0,$t3			#$t5=i*n
	addu 	$t5,$t5,$t1			#$t5 = i*n+j
	mul 	$t5,$t5,$t2			#$t5=(i*n+j)*size
	addu 	$t5,$t5,$s1			#$t5 direccion de m1[i,j]
	lw 		$t5,0($t5)			#$t5 elemento m1[i,j]

	add 	$t7,$t7,$t5 		#$t7 = $t7 + $t5
	addi 	$t1,$t1,1			#calculo la siguiente columna
	blt 	$t1,$t3,bucle1 		#si t3 es mayor que t1 entonces repito el bucle

	addi 	$t0,$t0,1 			#le sumo uno al numero de fila
	bgt 	$t7,$t4,bucle2 		#si t4 es menor que t7 salto a bucle2
	blt 	$t0,$t6,bucle0 		#si t0 es menor que t6 salto a bucle0
	addi 	$t8,-1
	move	$t0,$t8
	move 	$t1,$zero			#pongo a cero el numero de la columna
	j 		bucle3	


bucle2:
	move 	$t4,$t7
	move	$t8,$t0
	j 		bucle0

bucle3:
	mul 	$t5,$t0,$t3			#$t5=i*n
	addu 	$t5,$t5,$t1			#$t5 = i*n+j
	mul 	$t5,$t5,$t2			#$t5=(i*n+j)*size
	addu 	$t5,$t5,$s1			#$t5 direccion de m1[i,j]
	lw 		$t5,0($t5)			#$t5 elemento m1[i,j]

	addi 	$t1,$t1,1			#calculo la siguiente columna

	li 		$v0,1
	move 	$a0,$t5				#imprimo el valor de un elemento
	syscall
	# las siguientes lineas sirven para imprimir una cadena por la consola
	li 		$v0,4				# el registro $v0 debe tener el valor 4 para imprimir cadenas
	la 		$a0,space			# el registro $a0 debe tener la direccion de la cadena a imprimir
	syscall

	blt 	$t1,n,bucle3		#comparo si el indice es menor que el numero de columnas



	# las siguientes lineas sirven para imprimir una cadena por la consola
	li 		$v0,4				# el registro $v0 debe tener el valor 4 para imprimir cadenas
	la 		$a0,filamayor		# el registro $a0 debe tener la direccion de la cadena a imprimir
	syscall

	addi 	$t8,1
	# las siguientes lineas sirven para imprimir una cadena por la consola
	li 		$v0,1				# el registro $v0 debe tener el valor 4 para imprimir cadenas
	move 	$a0,$t8		# el registro $a0 debe tener la direccion de la cadena a imprimir
	syscall
	
	# las siguientes lineas sirven para imprimir una cadena por la consola
	li 		$v0,4				# el registro $v0 debe tener el valor 4 para imprimir cadenas
	la 		$a0,sumafila		# el registro $a0 debe tener la direccion de la cadena a imprimir
	syscall

	addi 	$t8,1
	# las siguientes lineas sirven para imprimir una cadena por la consola
	li 		$v0,1				# el registro $v0 debe tener el valor 4 para imprimir cadenas
	move 	$a0,$t4		# el registro $a0 debe tener la direccion de la cadena a imprimir
	syscall


	# salida del sistema
    li		$v0,10
    syscall





