section .data
    msg_titulo db  '****** MINI CALCULADORA ******',10
    len_titulo equ $-msg_titulo

    msg_numero1 db '> Ingrese el numero A: '
    len_numero1 equ $-msg_numero1

    msg_numero2 db '> Ingrese el numero B: '
    len_numero2 equ $-msg_numero2

    msg_all_operations dd '(S)uma',10,'(R)esta', 10, '(M)ultiplicacion', 10, '(D)ivision', 10, '(E)xit', 10
    len_all_operations equ $-msg_all_operations

    msg_opcion db '> Escoja una opcion => '
    len_opcion equ $-msg_opcion

    msg_invalid db '--ERROR --ESCOJA UNA OPCION VALIDA (La letra que esta en el parentesis)--',10, 10
    len_invalid equ $-msg_invalid
    
    msg_result db 'EL RESULTADO DE LA OPERACION ES: '
    len_result equ $-msg_result

    msg_repetir dd 10, 10, '¿Que desea hacer?',10, '(V)olver al menu', 10, '(E)xit',10, '> Escoja una opcion => ', 10
    len_repetir equ $-msg_repetir
   

    SYS_EXIT  equ 1
	SYS_READ  equ 3
	SYS_WRITE equ 4
	STDIN     equ 0
	STDOUT    equ 1

section .bss
    numA resb 2
    numB resb 2
    resultado resb 2
    opcion resb 2

section .text
    global _start
_start:
   
    leer_numeros:
    ;Mensaje 1
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg_titulo
    mov edx, len_titulo
    int 80h

    ;Mensaje ingrese  numero A
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg_numero1
    mov edx, len_numero1
    int 80h

    ;Leer numero 1
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, numA
    mov edx, 2
    int 80h

    ;Mensjae ingrese numero B
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg_numero2
    mov edx, len_numero2
    int 80h

    ;Leer numero 2
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, numB
    mov edx, 2
    int 80h    

presentar_menu:
    ;menu operaciones
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg_all_operations
    mov edx, len_all_operations
    int 80h

    ;Mensaje escoja una opcion
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg_opcion
    mov edx, len_opcion
    int 80h

    ;Leer opcion
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, opcion
    mov edx, 2
    int 80h  

buscar_opcion:
    mov al, [opcion] 
    
    cmp al, 's'
    je sumar    

    cmp al, 'r'
    je restar   

    cmp al, 'm'
    je multiplicar    

    cmp al, 'd'
    je dividir
    
    cmp al, 'e'
    je salir

    jmp opcion_invalida

opcion_invalida:
     ;Mensjae prueba
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg_invalid
    mov edx, len_invalid
    int 80h
    jmp presentar_menu

    
sumar:
    mov al, [numA]
    mov bl, [numB]
    sub al, '0'
    sub bl, '0'

    add al, bl
    add al, '0'

    mov [resultado], al
    jmp presentar_resultado
    

restar:
    mov al, [numA]
    mov bl, [numB]
    sub al, '0'
    sub bl, '0'

    sub al, bl
    add al, '0'

    mov [resultado], al
    jmp presentar_resultado

multiplicar:
    mov al, [numA]
    mov bl, [numB]
    sub al, '0'
    sub bl, '0'

    mul bl
    add al, '0' ;El producto total se guarda en al

    mov [resultado], al
    jmp presentar_resultado

dividir:
    mov al, [numA]
    mov bl, [numB]
    sub al, '0'
    sub bl, '0'

    mov dx, 0
    mov ah, 0

    div bl
    add al ,'0'

    mov [resultado], al
    jmp presentar_resultado

presentar_resultado:
    ;Mensaje resultado
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg_result
    mov edx, len_result
    int 80h

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, resultado
    mov edx, 1
    int 80h
    jmp desea_repetir

desea_repetir:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg_repetir
    mov edx, len_repetir
    int 80h

    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, opcion
    mov edx, 2
    int 80h

    mov ah, [opcion]

    cmp ah, 'v'
    je leer_numeros

    cmp ah, 'e'
    je salir

    jmp opcion_invalida_two

opcion_invalida_two:
     ;Mensjae 
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg_invalid
    mov edx, len_invalid
    int 80h
    jmp desea_repetir



salir:
    mov eax, SYS_EXIT 
    int 80h




