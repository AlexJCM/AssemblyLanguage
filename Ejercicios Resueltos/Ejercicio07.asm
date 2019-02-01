;Ejercicio07:
;Dado dos numeros A y B,  si A es menor a B sumarlos caso 
;contrario restarlos y presentar el resultado.

section .data

    msj1 db 'Ingrese numero A: '
    len_msj1 equ $-msj1

    msj2 db 'Ingrese numero B: '
    len_msj2 equ $-msj2  

    msj3 db 'El resultado es: '
    len_msj3 equ $-msj3

    msj4 db 'Son iguales',10
    len_msj4 equ $-msj4

    SYS_EXIT  equ 1
	SYS_READ  equ 3
	SYS_WRITE equ 4
	STDIN     equ 0
	STDOUT    equ 1

section .bss

    numeroA resb 4
    numeroB resb 4
    resultado resb 4

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

    ;Obtenemos por teclado el numero A
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, numeroA
    mov edx, 2
    int 80h  

    ;Presentamos el mensaje 1
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj2
    mov edx, len_msj2
    int 80h

    ;Obtenemos por teclado el numero A
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, numeroB
    mov edx, 2
    int 80h   

calcular_mayor:
    mov eax, [numeroA]
    mov ebx, [numeroB]
    cmp eax, ebx
    ja sumar
    jb restar
    je iguales

sumar:
    mov eax, [numeroA]
    mov ebx, [numeroB]
    sub eax, '0'
    sub ebx, '0'

    add eax, ebx
    add eax, '0'    
    mov [resultado], eax

    jmp presentar_resultado

restar:
    mov ax, [numeroA]
    mov bx, [numeroB]
    sub ax, '0'
    sub bx, '0'

    sub ax, bx
    add ax, '0'
    mov [resultado], ax
    
    jmp presentar_resultado

iguales:
    ;Presentamos el mensaje: Son iguales
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj4
    mov edx, len_msj4
    int 80h
    jmp salir

presentar_resultado:
    ;Presentamos el mensaje 
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj3
    mov edx, len_msj3
    int 80h

    ;Presentamos el resultado 
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, resultado
    mov edx, 1
    int 80h

salir:
    mov eax, SYS_EXIT
    int 80h