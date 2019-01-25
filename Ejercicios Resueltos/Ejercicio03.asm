;Ejercicio 03:
;Calcule la nota final de dos exámenes de una asignatura
;ingresado desde el teclado. Las dos notas deben ser 
;ingresadas entre un rango de 0 a 9.  

section .data

    msj1 db 'Ingrese nota del examen 1: '
    len_msj1 equ $-msj1  

    msj2 db 10, 'Ingrese nota del examen 2: '
    len_msj2 equ $-msj2

    msj3 db 10, 'La nota final es: '
    len_msj3 equ $-msj3

    SYS_EXIT  equ 1
	SYS_READ  equ 3
	SYS_WRITE equ 4
	STDIN     equ 0
	STDOUT    equ 1

section .bss

    notaA resb 2
    notaB resb 2  
    resultado resb 2

section .text

global _start
_start:
    ;Presentamos el mensaje 1
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj1
    mov edx, len_msj1
    int 80h

    ;Obtenemos por teclado la primera nota
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, notaA
    mov edx, 2
    int 80h   

     ;Presentamos el mensaje 2
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj2
    mov edx, len_msj2
    int 80h

    ;Obtenemos por teclado la segunda nota
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, notaB
    mov edx, 2
    int 80h       

sumar_notas:
    mov ax, [notaA]
    mov bx, [notaB]
    sub ax, '0'
    sub bx, '0'

    add ax, bx 
    add ax, '0'
    mov [resultado], ax

calcular_promedio:
    mov al, [resultado]
    mov bl, 2

    mov dx, 0
    mov ah, 0

    sub al, '0'
    ;sub bl, '0' ; no se convierte a decimal porque no ha sido ingresado por teclado

    div bl
    add ax, '0'    
    mov [resultado], ax 

presentar_resultado:  
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj3
    mov edx, len_msj3
    int 80h

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, resultado
    mov edx, 1
    int 80h
    
salir:
    mov eax, SYS_EXIT
    int 80h
    

