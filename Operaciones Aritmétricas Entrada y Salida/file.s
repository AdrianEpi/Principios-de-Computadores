#/*=========================================================================
#===========================================================================
#    =            Nombre Archivo:    Practica2.s                       =
#    =            Autor:         Adrián Epifanio R.H                   =
#    =            Fecha:         2018                                  =
#    =            Asignatura:    Principios de Computadores            =
#    =            Lenguaje:      MIPS                                  = 
#===========================================================================          
#=========================================================================*/



# PRACTICA 2 DE PRINCIPIOS DE COMPUTADORES. OPERACIONES ARITMETICAS Y ENTRADA SALIDA

		.data
titulo:	    .asciiz 	"Practica 2. Principios de Computadores\n"
petop1:	    .asciiz		"Introduzca primer operando: "
petop2:	    .asciiz		"Introduzca segundo operando: "
cadsum:	    .asciiz		"\nEl resultado de la suma es: "
cadres:     .asciiz     "\nEl resultado de la resta es: "
cadmult:    .asciiz     "\nEl resultado de la multiplicacion es: "
caddiv:     .asciiz     "\nLa parte entera de la division es: "
cadresto:   .asciiz     "\nEl resto de la division es: "
division0:  .asciiz     "\nNo se puede realizar la division porque se trata de una division por cero. "
control:    .asciiz     "\nIntroduzca 0 para acabar o cualquier numero para seguir: "

		.text

main:

	# las siguientes lineas sirven para imprimir una cadena por la consola
    li $v0,4   # el registro $v0 debe tener el valor 4 para imprimir cadenas
	la $a0, titulo # el registro $a0 debe tener la direccion de la cadena a imprimir
	syscall

	# las siguientes lineas imprimen la cadena de peticion del operando 1 por consola
	li $v0,4
	la $a0, petop1
	syscall
	# las siguientes lineas leen un entero por consola y dejan el entero leido en $v0
	li $v0,5 # $v0 debe tener un 5 para que se lea un entero 
	syscall
	move $t0,$v0 # el entero leido lo muevo a $t0 para posteriormente operarlo

	# repetimos lo mismo pero para el segundo operando
	# las siguientes lineas imprimen la cadena de peticion del operando 1 por consola
	li $v0,4
	la $a0, petop2
	syscall
	# las siguientes lineas leen un entero por consola y dejan el entero leido en $v0
	li $v0,5 # $v0 debe tener un 5 para que se lea un entero 
	syscall
	move $t1,$v0 # el entero leido lo muevo a $t1 para posteriormente operarlo

    # calculo la suma de ambos enteros y almaceno el resultado en $t2
    add $t2,$t0,$t1   # $t2 = $t0 + $t1
    # imprimo el resultado por la consola
    # primero imprimo una cadena que sirva de titulo
    li $v0,4
    la $a0,cadsum
    syscall
    # las siguiente lineas
    li $v0,1 # $v0 debe tener un 1 para que se escriba un entero
    move $a0,$t2  # $a0 debe tener el entero que tiene que imprimir
    syscall


	# calculo la resta de ambos enteros y almaceno el resultado en $t3
	sub $t3,$t0,$t1   # $t3 = $t0 - $t1
	# imprimo el resultado por la consola
	# primero imprimo una cadena que sirva de titulo
	li $v0,4
	la $a0,cadres
	syscall
	# las siguientes lineas leen un entero por consola y dejan el entero leido en $v0
	li $v0,1 # $v0 debe tener un 1 para que se escriba un entero
	move $a0,$t3  # $a0 debe tener el entero que tiene que imprimir
	syscall


    #calculo la multipicacion de ambos enteros y almaceno el resultado en $t4
    mult $t0,$t1   # $t0 * $t1
    mflo $t4
    # imprimo el resultado por la consola
    # primero imprimo una cadena que sirva de titulo
    li $v0,4
    la $a0,cadmult
    syscall
    # las siguientes lineas leen un entero por consola y dejan el entero leido en $v0
    li $v0,1 # $v0 debe tener un 1 para que se escriba un entero
    move $a0,$t4  # $a0 debe tener el entero que tiene que imprimir
    syscall

    # implemento un if para ver si el segundo operando es un 0 y si lo es no realizar al division
if: beqz $t1,el
    j fi

el: li $v0,4
	la $a0,division0
	syscall

#calculo la division de ambos enteros y almaceno el resultado en $t5 y $t6
fi: div $t0,$t1   # $t0 / $t1
    mflo $t5
    mfhi $t6

    # imprimo el resultado por la consola
    # primero imprimo una cadena que sirva de titulo
    li $v0,4
    la $a0,caddiv
    syscall
    # las siguiente lineas
    li $v0,1 # $v0 debe tener un 1 para que se escriba un entero
    move $a0,$t5  # $a0 debe tener el entero que tiene que imprimir
    syscall
    # imprimo el resto por la consola
    # primero imprimo una cadena que sirva de titulo
    li $v0,4
    la $a0,cadresto
    syscall
    # las siguiente lineas
    li $v0,1 # $v0 debe tener un 1 para que se escriba un entero
    move $a0,$t6  # $a0 debe tener el entero que tiene que imprimir
    syscall

# implementamos un if para que continue el programa o se finalice.
if2: li $v0,4
    la $a0,control
    syscall
    li $v0,5 # $v0 debe tener un 5 para que se lea un entero
    syscall
    move $t9,$v0
    beqz $t9,fn
    # En caso de que el la condicion del if se cumnpla saltamos al principio del programa par repetirlo de nuevo.
    j main

	# las siguiente lineas terminan el programa.
fn: li $v0,10
	syscall
