#/*=========================================================================
#===========================================================================
#    =            Nombre Archivo:    Practica5a.s                      =
#    =            Autor:         Adrián Epifanio R.H                   =
#    =            Fecha:         2018                                  =
#    =            Asignatura:    Principios de Computadores            =
#    =            Lenguaje:      MIPS                                  = 
#===========================================================================          
#=========================================================================*/

# PRACTICA 5 DE PRINCIPIOS DE COMPUTADORES. POTENCIA

        .data
titulo:         .asciiz     "Practica 5. Principios de Computadores\n"
cadnum:         .asciiz     "Introduzca un numero flotante para la base: "
cadexp:         .asciiz     "Introduce un numero entero para el exponente: "
cadresultado:   .asciiz     "El resultado de la potencia introducida es: "
base:           .word       0
exp:            .word       0
result:         .word       0

        .text

main:
    # las siguientes lineas sirven para imprimir una cadena por la consola
    li      $v0,4           # el registro $v0 debe tener el valor 4 para imprimir cadenas
    la      $a0,titulo      # el registro $a0 debe tener la direccion de la cadena a imprimir
    syscall

    # las siguientes lineas sirven para imprimir una cadena por la consola
    li      $v0,4           # el registro $v0 debe tener el valor 4 para imprimir cadenas
    la      $a0,cadnum      # el registro $a0 debe tener la direccion de la cadena a imprimir
    syscall

    # las siguientes lineas imprimen la cadena de peticion del operando 1 por consola
    li      $v0,7           # el registro $v0 debe tener el valor 7 para leer flotantes en doble precision
    syscall
    mov.d   $f20,$f0        #muevo el valor de f0 a f20


    # las siguientes lineas sirven para imprimir una cadena por la consola
    li      $v0,4           # el registro $v0 debe tener el valor 4 para imprimir cadenas
    la      $a0,cadexp      # el registro $a0 debe tener la direccion de la cadena a imprimir
    syscall

    # las siguientes lineas imprimen la cadena de peticion del operando 1 por consola
    li      $v0,5           # el registro $v0 debe tener el valor 7 para leer flotantes en doble precision
    syscall
    move   $t1,$v0          #guardo el valor de $v0 en $t1

    mtc1    $t1,$f4         #Copia cruda del entero en complemento a 2
    cvt.d.w $f2,$f4         #Convierto la copia cruda a flotante
    mov.d   $f22,$f2        #muevo el valor de f0 a f22



    li.d    $f24,1.0        #sentinela para restar mas adelante inicialmente a 1.0
    li.d    $f26,1.0        #almaceno el resultado de las operaciones, inicialmente a 1.0
    li.d    $f28,0.0        # variable usada para comparar en los bucles inicialmente a 0.0


bucle0:
    c.le.d  $f22,$f28       #c.le.d es una condicional "<=", es decir, si f22 <= f28
    bc1f    bucle1          #si la condicion no se cumple salto a bucle1
    bc1t    bucle3          #si la condicion si se cumple salto a bucle3



bucle1:
    li.d    $f28,0.0        # variable usada para comparar en los bucles
    c.eq.d  $f22,$f28       #c.eq.d es una condicional "==", es decir, si f22 = f28
    bc1t    end             #si la condicion si se cumple salto a end
    bc1f    bucle2          #si la condicion no se cumple salto a bucle2



bucle2:
    mul.d   $f26,$f26,$f20  #$f26 = $f26 * $f20
    sub.d   $f22,$f22,$f24  #$f22 = $f22 - $f24
    j       bucle1          #salto a bucle1



bucle3:
    li.d    $f28,-1.0      #inicializo $f28 a -1.0 para pasar el exponente negativo a positivo 
    mul.d   $f22,$f22,$f28 #$f22 = $f22 * $f28
    li.d    $f28,0.0       # variable usada para comparar en los bucles

    bucle31:
        c.eq.d      $f22,$f28           #c.eq.d es una condicional "==", es decir, si f22 = f28
        bc1f        bucle32             #si la condicion no se cumple salto a bucle32
        div.d       $f26,$f24,$f26      #$f26 = $f24 / $f26
        bc1t        end                 #si la condicion no se cumple salto a end

    bucle32:
        mul.d       $f26,$f26,$f20      #$f26 = $f26 * $f20
        sub.d       $f22,$f22,$f24      #$f22 = $f22 - $f24
        j           bucle31             #salto a bucle31


end:
    # las siguientes lineas sirven para imprimir una cadena por la consola
    li      $v0,4              # el registro $v0 debe tener el valor 4 para imprimir cadenas
    la      $a0,cadresultado   # el registro $a0 debe tener la direccion de la cadena a imprimir
    syscall

    li      $v0,3              #el registro $v0 debe tener el valor 3 para imprimir flotante de doble precision
    mov.d   $f12,$f26          #muevo el valor de f26 a f12
    syscall

    # las siguiente lineas terminan el programa.
    li      $v0,10
    syscall






    

#/*=========================================================================
#===========================================================================
#    =            Nombre Archivo:    Practica5b.s                      =
#    =            Autor:         Adrián Epifanio R.H                   =
#    =            Fecha:         2018                                  =
#    =            Asignatura:    Principios de Computadores            =
#    =            Lenguaje:      MIPS                                  = 
#===========================================================================          
#=========================================================================*/

# PRACTICA 5 DE PRINCIPIOS DE COMPUTADORES. POTENCIA

        .data
titulo:         .asciiz     "Practica 5. Principios de Computadores\n"
cadnum:         .asciiz     "Introduzca un numero flotante para la base: "
cadexp:         .asciiz     "Introduce un numero entero para el exponente: "
cadresultado:   .asciiz     "El resultado de la potencia introducida es: "
base:           .word       0
exp:            .word       0
result:         .word       0

        .text

main:
    # las siguientes lineas sirven para imprimir una cadena por la consola
    li      $v0,4           # el registro $v0 debe tener el valor 4 para imprimir cadenas
    la      $a0,titulo      # el registro $a0 debe tener la direccion de la cadena a imprimir
    syscall

    # las siguientes lineas sirven para imprimir una cadena por la consola
    li      $v0,4           # el registro $v0 debe tener el valor 4 para imprimir cadenas
    la      $a0,cadnum      # el registro $a0 debe tener la direccion de la cadena a imprimir
    syscall

    # las siguientes lineas imprimen la cadena de peticion del operando 1 por consola
    li      $v0,7           # el registro $v0 debe tener el valor 7 para leer flotantes en doble precision
    syscall
    mov.d   $f20,$f0        #muevo el valor de f0 a f20
    mov.d   $f12,$f20


    # las siguientes lineas sirven para imprimir una cadena por la consola
    li      $v0,4           # el registro $v0 debe tener el valor 4 para imprimir cadenas
    la      $a0,cadexp      # el registro $a0 debe tener la direccion de la cadena a imprimir
    syscall

    # las siguientes lineas imprimen la cadena de peticion del operando 1 por consola
    li      $v0,5           # el registro $v0 debe tener el valor 7 para leer flotantes en doble precision
    syscall

    move   	$t0,$v0         #guardo el valor de $v0 en $t1
    move  	$a1,$t0			#guardo el valor de $t0 en $a1


    li 		$t1,1			#inicializo $t1 a 1 para operaciones posteriores
    li 		$t3,-1			#inicializo $t3 a -1 para operaciones posteriores
    li.d 	$f14,1.0		#inicializo $f14 a 1.0 para operaciones posteriores
    move 	$a3,$t3			#guardo el valor de $t3 en $a3
    move 	$a2,$t1			#guardo el valor de $t1 en $a2
	mov.d 	$f0,$f12		#guardo el valor de $f12 en $f0


	#segun el convenio el llamador de la funcion reserva espacio para $a0,$a1,$a2,$a3
	#por si la funcion llamada requiere salvarlos
	addi $sp, -16

	jal elevar

	#tras la llamada debe restaurar la pila
	addi $sp,16


    # las siguientes lineas sirven para imprimir una cadena por la consola
    li      $v0,4              # el registro $v0 debe tener el valor 4 para imprimir cadenas
    la      $a0,cadresultado   # el registro $a0 debe tener la direccion de la cadena a imprimir
    syscall

    li      $v0,3              #el registro $v0 debe tener el valor 3 para imprimir flotante de doble precision
    mov.d   $f12,$f12          #muevo el valor de f26 a f12
    syscall

    # las siguiente lineas terminan el programa.
    li      $v0,10
    syscall
#FIN PROGRAMA PRINCIPAL



#FUNCION ELEVAR
elevar: #$v0 tendra al final de la funcion el valor del factorial calculado. $a0 contiene el numero a calcular
    
    blt 			$t0,$zero,bucle2		#si t0<=0 entro en bucle2

  	bucle1:
    	bgt 		$a1,$a2,masquecero 		#si a1>=a2 repito el bucle1
    	li 			$v0,1
    	jr 			$ra 					#return adress

    	masquecero:
        	addi 	$sp,-24 				#para $a0...$a1, $ra y 4 de padding para que sea multiplo de 8
        	sw 		$ra,16($sp)				# en 0$(sp) esta el padding y
        	sw 		$a2,24($sp) 			#guardo $a0 en el frame de la funcion llamante


        	lw 		$a2,24($sp) 			#recupero $a0 en el mismo orden
        	lw 		$ra,16($sp) 			#recupero el $ra em el mismo orden
        	addi 	$sp,$sp,24 				#dejo el puntero de pila como estaba


        	mul.d 	$f12,$f12,$f0 			#multiplico n*fact(n-1) que es $a0*$v0
        	addi 	$a1,$a1,-1 				#decremento el contador $a1 del exponente
        	bgt 	$a1,$a2,masquecero 		#si a1>=0 repito el bucle masquecero
        
        	jr 		$ra 					#return adress



    bucle2:
    	mult 		$a1,$a3
    	mflo 		$a1
        bgt 		$a1,$a2,masquecero2
    	li 			$v0,1
    	jr 			$ra 					#return adress

    	masquecero2:
        	addi 	$sp,-24					#para $a0...$a1, $ra y 4 de padding para que sea multiplo de 8
        	sw 		$ra,16($sp)				# en 0$(sp) esta el padding y
        	sw 		$a2,24($sp) 			#guardo $a0 en el frame de la funcion llamante


        	lw 		$a2,24($sp) 			#recupero $a0 en el mismo orden
        	lw 		$ra,16($sp) 			#recupero el $ra em el mismo orden
        	addi 	$sp,$sp,24 				#dejo el puntero de pila como estaba


        	mul.d 	$f12,$f12,$f0 			#multiplico n*fact(n-1) que es $a0*$v0
        	addi 	$a1,$a1,-1  			#decremento el contador $a1 del exponente
        	bgt 	$a1,$a2,masquecero2 	#si a1>=a2 repito el bucle masquecero2
        	div.d 	$f12,$f14,$f12 			# $f12 = $f14 / $f12
        	jr 		$ra   					#return adress
#fin funcion elevar
