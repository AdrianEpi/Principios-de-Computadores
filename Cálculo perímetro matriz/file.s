#/*=========================================================================
#===========================================================================
#    =            Nombre Archivo:    Practica4.s                       =
#    =            Autor:         Adrián Epifanio R.H                   =
#    =            Fecha:         2018                                  =
#    =            Asignatura:    Principios de Computadores            =
#    =            Lenguaje:      MIPS                                  = 
#===========================================================================          
#=========================================================================*/

# PRACTICA 4. PRINCIPIO DE COMPUTADORES.
# programa que imprime el perimetro de la mariz
# La matriz tiene dimension mxn

m = 2		# numero de filas de m1
n = 2		# numero de columnas de  m1
size = 4	# tamano de cada elemento


# HAY QUE PONER UN ESPACIO DETRAS DE CADA COMA EN LA DEF DE VECTORES Y MATRICES
			.data

titulo:		.asciiz		"Practica 4. Principios de computadores\n"
perimetro:	.asciiz		"El perimetro de la matriz es: "
space:		.asciiz		", "



m1:		.word	1, 2 # 3, 4, 5
		.word	1, 2 # 3, 4, 5
        #.word	1, 2, 3, 4, 5
        #.word	1, 2, 3, 2, 5
            



		.text

main:

	# las siguientes lineas sirven para imprimir una cadena por la consola
	li 		$v0,4			# el registro $v0 debe tener el valor 4 para imprimir cadenas
	la 		$a0,titulo		# el registro $a0 debe tener la direccion de la cadena a imprimir
	syscall

	la 		$s1,m1				#$s1 contendra la direccion base de la matriz
	move 	$t0,$zero			#$t0=indice de la fila inicio 0
	move 	$t1,$zero			#$t1=indice de columna inicio 0
	li 		$t2,size			#tamaño de cada elemento
	li 		$t3,n				#$t3=n(5)
	li 		$t6,m				#$t6=m(4)
	addi 	$t6,-1				#le resto una unidad a t6 para proximamente hacer un calculo 



	# las siguientes lineas sirven para imprimir una cadena por la consola
	li 		$v0,4				# el registro $v0 debe tener el valor 4 para imprimir cadenas
	la 		$a0,perimetro		# el registro $a0 debe tener la direccion de la cadena a imprimir
	syscall



bucle1:
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

	blt 	$t1,n,bucle1		#comparo si el indice es menor que el numero de columnas

	add 	$t1,$t1,-1			#resto una unidad a t1 para que se reduzca su indice y vuelva al rango



bucle2:
	addi 	$t0,$t0,1			#calculo la siguiente fila
	mul 	$t5,$t0,$t3			#$t5=i*n
	addu 	$t5,$t5,$t1			#$t5 = i*n+j
	mul		$t5,$t5,$t2			#$t5=(i*n+j)*size
	addu 	$t5,$t5,$s1			#$t5 direccion de m1[i,j]
	lw 		$t5,0($t5)			#$t5 elemento m1[i,j]

	li 		$v0,1
	move 	$a0,$t5				#imprimo el valor de un elemento
	syscall
	# las siguientes lineas sirven para imprimir una cadena por la consola
	li 		$v0,4				# el registro $v0 debe tener el valor 4 para imprimir cadenas
	la 		$a0,space			# el registro $a0 debe tener la direccion de la cadena a imprimir
	syscall

	blt 	$t0,$t6,bucle2		#comparo si el indice es menor que el numero de filas
	


bucle3:
	addi 	$t1,$t1,-1			#calculo la siguiente fila disminuyendo su indice
	mul 	$t5,$t0,$t3			#$t5=i*n
	addu 	$t5,$t5,$t1			#$t5 = i*n+j
	mul 	$t5,$t5,$t2			#$t5=(i*n+j)*size
	addu 	$t5,$t5,$s1			#$t5 direccion de m1[i,j]
	lw 		$t5,0($t5)			#$t5 elemento m1[i,j]

	li 		$v0,1
	move 	$a0,$t5				#imprimo el valor de un elemento
	syscall
	# las siguientes lineas sirven para imprimir una cadena por la consola
	li 		$v0,4				# el registro $v0 debe tener el valor 4 para imprimir cadenas
	la 		$a0,space			# el registro $a0 debe tener la direccion de la cadena a imprimir
	syscall

	bgt 	$t1,$zero,bucle3	#comparo si el indice es mayor que el numero de columna



#bucle4:
#	addi 	$t0,$t0,-1			#calculo la siguiente fila
#	mul		$t5,$t0,$t3			#$t5=i*n
#	addu 	$t5,$t5,$t1			#$t5 = i*n+j
#	mul 	$t5,$t5,$t2			#$t5=(i*n+j)*size
#	addu	$t5,$t5,$s1			#$t5 direccion de m1[i,j]
#	lw 		$t5,0($t5)			#$t5 elemento m1[i,j]
#
#	li 		$v0,1
#	move 	$a0,$t5				#imprimo el valor de un elemento
#	syscall
#	# las siguientes lineas sirven para imprimir una cadena por la consola
#	li 		$v0,4				# el registro $v0 debe tener el valor 4 para imprimir cadenas
#	la 		$a0,space			# el registro $a0 debe tener la direccion de la cadena a imprimir
#	syscall

	#bgt 	$t0,1,bucle4		#comparo si el indice es mayor que 1	

	

	# salida del sistema
    li		$v0,10
    syscall






# INTRODUCIR COMENTADO EL ALGORITMO PROPUESTO EN LENGUAJE DE ALTO NIVEL
#define n 4;
#define m 4;
#
#int main (void){
#	int i, j;
#	int matrix[n][m];
#	cout << "Introduce los numeros de la matriz" << endl;
#
#	for (int i=0; i<=n; i++){
#		for (int j=0; j<=m; j++){
#			cin >> matrix[i][j];
#		}//for j
#
#	}//for i
#
#	//Imprimir la matriz por pantalla
#	for (int i=0; i<=n; i++){
#		for (int j=0; j<=m; j++){
#			cout << "\t" << matrix[i][j];
#		}//for j
#		cout << endl;
#
#
#	}//for i
#
#
#	//Imprimir el perímetro
#	j=0;
#	for (i=0; i<n; i++){
#		cout << matrix[i][j];
#	}
#
#	i= n;
#	for (j=0; j<m; j++){
#		cout << matrix[i][j];
#	}
#
#	j=m;
#	for (i=n; i>0; i--){
#		cout << matrix[i][j];
#	}
#
#	i= n;
#	for (j=m; j>0; j--){
#		cout << matrix[i][j];
#	}
#
#
#}





#Cuestiones:
#En la resolucion de mi practica no he calculado directamente el desplazamiento sino que he creado una variable que voy moviendo por la matriz en el orden del perimetro.

