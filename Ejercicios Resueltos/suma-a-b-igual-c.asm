;Leer 3 numeros por teclado y sumar el primero con el segundo
y comparar si dicho resultado es igual al tercer numero ingresado.

section .data
    msj1 db 'Suma de a b  es igual a c', 10
    len_msj1 equ $-msj1

    msj2 db 'Suma de a c es igual a b', 10
    len_msj2 equ $-msj2

    msj3 db 'Suma de b c es a', 10
    len_msj3 equ $-msj3

    msj_no_iguales db 'No es igual la suma',10
    len_msj4 equ $-msj_no_iguales

    msj5 db 'La suma es: '
    len_msj5 equ $-msj5

section .bss
    numA resb 5
    numB resb 5
    numC resb 5
    resultado resb 2

section .text
global _start:
_start:

    leer_numeros:
    mov eax, 3
    mov ebx, 2
    mov ecx, numA
    mov edx, 5
    int 80h
    
    mov eax, 3
    mov ebx, 2
    mov ecx, numB
    mov edx, 5
    int 80h

    mov eax, 3
    mov ebx, 2
    mov ecx, numC
    mov edx, 5
    int 80h
;-------------------------
    convertir_numeros:
    mov al, [numA]
    sub al, '0' ; convierte de ascii a decimal
    mov bl, [numB]
    sub bl, '0'
    mov cl, [numC]
    sub cl, '0'

    comparaciones:
    add al, bl
    add al, '0' ; converte decimal a ascii para poder guardarlo en resultado
    
    mov [resultado], al    
    ;mov al, [resultado]
    sub al, '0' ; lo volvemos a convertir a decimal para poder comparar

    cmp al, cl   
    je mensaje_iguales1
    jmp comparar_AC_igual_B   

    mensaje_iguales1:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj1
    mov edx, len_msj1
    int 80h
    jmp presentar_resultado

    comparar_AC_igual_B:
    mov al, [numA]
    sub al, '0'
    add al, cl
    add al, '0'

    mov [resultado], al

    sub al, '0'

    cmp al, bl
    jz mensaje_iguales2
    jmp comparar_BC_igual_A  
    
    mensaje_iguales2:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj2
    mov edx, len_msj2
    int 80h
    jmp presentar_resultado

    comparar_BC_igual_A:
    mov al, [numA]
    sub al, '0'
    add bl, cl
    add bl, '0'

    mov [resultado], bl
    sub bl, '0'

    cmp bl, al
    jz mensaje_iguales3
    jmp mensaje_no_iguales

    mensaje_iguales3:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj3
    mov edx, len_msj3
    int 80h
    jmp presentar_resultado

    mensaje_no_iguales:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_no_iguales
    mov edx, len_msj4
    int 80h
    jmp salir

    presentar_resultado:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj5
    mov edx, len_msj5
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 2
    int 80h
    jmp salir

    salir:
    mov eax, 1
    int 80h


