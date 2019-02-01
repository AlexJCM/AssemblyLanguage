;Ejercicio 02:
;Calcular el area de un cuadrado ingresando
;el valor de su lado por teclado.

section .data

    msj1 db 'Ingrese el valor del lado: '
    len_msj1 equ $-msj1  

    msj2 db  'El área del cuadrado es: '
    len_msj2 equ $-msj2

    SYS_EXIT  equ 1
	SYS_READ  equ 3
	SYS_WRITE equ 4
	STDIN     equ 0
	STDOUT    equ 1

section .bss
    ;Variables
    lado resb 2   
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

    ;Obtenemos por teclado el primer numero
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, lado
    mov edx, 1
    int 80h     

calcular_area:
    mov eax, [lado]
    mov ebx, [lado]
    sub eax, '0'
    sub ebx, '0'

    mul ebx
    add ax, '0'
    mov [resultado], ax

presentar_resultado:  
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj2
    mov edx, len_msj2
    int 80h

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, resultado
    mov edx, 1
    int 80h
    
salir:
    mov eax, SYS_EXIT
    int 80h
    





