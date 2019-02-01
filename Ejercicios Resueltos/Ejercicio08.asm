;Ejercicio08:
;Dado dos números A y B, encontrar el cociente entre
;A y B. Recordar que la division entre cero no es posible, de darse el caso
; presentar un mensaje indicando que no es posible.

section .data


    msj1 db 'Ingrese dividendo: '
    len_msj1 equ $-msj1

    msj2 db 'Ingrese divisor: '
    len_msj2 equ $-msj2

    msj3 db 'El cociente de la division es: '
    len_msj3 equ $-msj3   

    msj4 db 'No es posible dividir para cero'
    len_msj4 equ $-msj4    

    SYS_EXIT  equ 1
	SYS_READ  equ 3
	SYS_WRITE equ 4
	STDIN     equ 0
	STDOUT    equ 1

section .bss

    dividendo resb 5
    divisor resb 5
    cociente resb 5
   
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

    ;Obtenemos por teclado el dividendo
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, dividendo
    mov edx, 2
    int 80h   

    ;Presentamos el mensaje 2
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj2
    mov edx, len_msj2
    int 80h

    ;Obtenemos por teclado el divisor
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, divisor
    mov edx, 2
    int 80h    

comprobar_zero:
    mov al, [divisor] 
    sub al, '0'  
    
    cmp al, 0 ;verifica si el divisor es igual a 0
    je infinito
    jmp dividir

dividir:
    mov al, [dividendo]
    mov bl, [divisor]
    sub al, '0'
    sub bl, '0'

    mov dx, 0
    mov ah, 0 

    div bl
    add ax, '0'
    mov [cociente], ax

presentar_resultado:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj3
    mov edx, len_msj3
    int 80h    

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, cociente
    mov edx, 1
    int 80h
    jmp salir

infinito:
    ;Presentar mensaje 4
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj4
    mov edx, len_msj4
    int 80h

salir:
    mov eax, SYS_EXIT
    int 80h