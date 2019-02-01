;Ejercicio 04:
;Verificar si un numero ingresado por teclado es positivo o negativo

section .data

    msj0 db 'Ingrese un numero: '
    len_msj0 equ $-msj0

    msj1 db 'Es positivo',10
    len_msj1 equ $-msj1  

    msj2 db  'Es negativo',10
    len_msj2 equ $-msj2

    SYS_EXIT  equ 1
	SYS_READ  equ 3
	SYS_WRITE equ 4
	STDIN     equ 0
	STDOUT    equ 1

section .bss

   numero resb 2

section .text

global _start
_start:
    ;Presentamos el mensaje
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj0
    mov edx, len_msj0
    int 80h

    ;Obtenemos por teclado el numero
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, numero
    mov edx, 1
    int 80h     

verificar_signo:
    mov eax, [numero]
    sub eax,'0'

    js es_negativo ;si el valor es negativo se ejecutara esta instruccion
    jmp es_positivo

es_positivo:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj1
    mov edx, len_msj1
    int 80h

jmp salir


es_negativo:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj2
    mov edx, len_msj2
    int 80h
    
salir:
    mov eax, SYS_EXIT
    int 80h
    
