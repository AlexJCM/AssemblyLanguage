;Ejercicio09:
;Dada las longuitudes de los 3 lados de un triángulo, 
;determinar si es equilátero o  no.

section .data

    msj1 db 'Ingrese lado A:  '
    len_msj1 equ $-msj1

    msj2 db 'Ingrese lado B:  '
    len_msj2 equ $-msj2

    msj3 db 'Ingrese lado C:  '
    len_msj3 equ $-msj3

    msj4 db 'Es un triangulo equilatero',10
    len_msj4 equ $-msj4

    msj5 db 'NO es triangulo equilatero',10
    len_msj5 equ $-msj5      

    SYS_EXIT  equ 1
	SYS_READ  equ 3
	SYS_WRITE equ 4
	STDIN     equ 0
	STDOUT    equ 1

section .bss

  ladoA resb 5
  ladoB resb 5
  ladoC resb 5  
   
section .text

global _start
_start:

obtener_numeros:
    ;Presentamos el mensaje 1
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj1
    mov edx, len_msj1
    int 80h

    ;Obtenemos por teclado el lado A
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, ladoA
    mov edx, 2
    int 80h 

    ;Presentamos el mensaje 2
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj1
    mov edx, len_msj1
    int 80h

    ;Obtenemos por teclado el lado B
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, ladoB
    mov edx, 2
    int 80h 

    ;Presentamos el mensaje 3
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj1
    mov edx, len_msj1
    int 80h

    ;Obtenemos por teclado el lado C
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, ladoC
    mov edx, 2
    int 80h   

comparar_A_B:
    mov al, [ladoA]
    mov bl, [ladoB]
    sub al, '0'
    sub bl, '0'

    cmp al, bl
    je comparar_B_C
    jmp no_es_equilatero

comparar_B_C:
    mov al, [ladoC]
    sub al, '0'

    cmp al, bl
    jz si_es_equilatero
    jmp no_es_equilatero

si_es_equilatero:
    ;Presentamos el mensaje 4
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj4
    mov edx, len_msj4
    int 80h
    jmp salir

no_es_equilatero:
    ;Presentamos el mensaje 5
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj5
    mov edx, len_msj5
    int 80h

salir:
    mov eax, SYS_EXIT
    int 80h