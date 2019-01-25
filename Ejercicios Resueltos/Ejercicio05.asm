;Ejercicio05:
;Leer dos numeros desde teclado e indicar cual 
;es el mayor y cual es el menor
section .data

    msj0 db 'Ingrese numero A: '
    len_msj0 equ $-msj0

    msj1 db 'Ingrese numero B: '
    len_msj1 equ $-msj1  

    msj2 db 'El numero mayor es el '
    len_msj2 equ $-msj2

    msj3 db 'El numero menor es el '
    len_msj3 equ $-msj3

    SYS_EXIT  equ 1
	SYS_READ  equ 3
	SYS_WRITE equ 4
	STDIN     equ 0
	STDOUT    equ 1

section .bss

   numeroA resb 4
   numeroB resb 4

section .text

global _start
_start:
    ;Presentamos el mensaje 1
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj0
    mov edx, len_msj0
    int 80h

    ;Obtenemos por teclado el numero A
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, numeroA
    mov edx, 2
    int 80h   

    ;Presentamos el mensaje 2
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj1
    mov edx, len_msj1
    int 80h

    ;Obtenemos por teclado el numero B
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, numeroB
    mov edx, 2
    int 80h   

verificar_mayor:
    mov eax, [numeroA]
    mov ebx, [numeroB]   
    cmp eax, ebx
    ja es_mayor_A  ;ja es similar a jg
    ;jb es_mayor_B
    jmp es_mayor_B

es_mayor_A:
    ;Presenta el numero mayor
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj2
    mov edx, len_msj2
    int 80h

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, numeroA
    mov edx, 2
    int 80h

    ;Presenta el numero menor
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj3
    mov edx, len_msj3
    int 80h

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, numeroB
    mov edx, 2
    int 80h    

    jmp salir

es_mayor_B:
    ;Presenta el numero mayor
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj2
    mov edx, len_msj2
    int 80h

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, numeroB
    mov edx, 2
    int 80h
    
    ;Presenta el numero menor
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj3
    mov edx, len_msj3
    int 80h

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, numeroA
    mov edx, 2
    int 80h


salir:
    mov eax, SYS_EXIT
    int 80h
    
