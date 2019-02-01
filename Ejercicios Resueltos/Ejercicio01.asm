;Ejercicio 01: Obtener dos numeros enteros por teclado,
; calcule la suma, la resta, la division y la multiplicacion
; y presente los resultados de dichas operaciones por pantalla.

section .data

    msj1 db 'Ingrese valor A: '
    len_msj1 equ $-msj1

    msj2 db 'Ingrese valor B: '
    len_msj2 equ $-msj2

    msj_suma db 'SUMA: '
    len_suma equ $-msj_suma

    msj_resta db 10, 'RESTA: '
    len_resta equ $-msj_resta

    msj_multi db 10, 'MULTIPLICACION: '
    len_multi equ $-msj_multi

    msj_division db 10, 'DIVISION: '
    len_division equ $-msj_division

    SYS_EXIT  equ 1
	SYS_READ  equ 3
	SYS_WRITE equ 4
	STDIN     equ 0
	STDOUT    equ 1

section .bss
    ;Variables
    numA resb 2
    numB resb 2
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
    mov ecx, numA
    mov edx, 5
    int 80h
    
    ;Presentamos el mensaje 2
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj2
    mov edx, len_msj2
    int 80h

    ;Obtenemos por teclado el segundo numero
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, numB
    mov edx, 5
    int 80h

    ;Calcular las distitntas operaciones
sumar:
    mov eax, [numA]    
    mov ebx, [numB]
    sub eax, '0' ;Convierte a decimal
    sub ebx, '0' ;Convierte a decimal

    add eax, ebx
    add eax, '0' ;Convierte a cadena
    mov [resultado], eax ;Guarda el valor total de la suma en la variable resultado

    ;Presentar mensaje suma y su resultado
 presentar_resultado_suma: 
    ;Presentar mensaje suma  
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj_suma
    mov edx, len_suma
    int 80h

   ;Presentar resultado de la suma
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, resultado
    mov edx, 1
    int 80h

restar:
    mov eax, [numA]
    mov ebx, [numB]
    sub eax, '0'
    sub ebx, '0'

    sub eax, ebx
    add eax, '0'
    mov [resultado], eax
    
    ;Presentar mensaje resta
presentar_resultado_resta:  
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj_resta
    mov edx, len_resta
    int 80h

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, resultado
    mov edx, 1
    int 80h

multiplicar:
    mov eax, [numA]
    mov ebx, [numB]
    sub eax, '0'
    sub ebx, '0'

    mul ebx
    add ax, '0'
    mov [resultado], ax

presentar_resultado_multiplicacion:  
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj_multi
    mov edx, len_multi
    int 80h

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, resultado
    mov edx, 1
    int 80h

dividir:
    mov al, [numA]
    mov bl, [numB]

    mov dx, 0
    mov ah, 0

    sub al, '0'
    sub bl, '0'

    div bl
    add ax, '0'
    mov [resultado], ax

presentar_resultado_division:  
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj_division
    mov edx, len_division
    int 80h

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, resultado
    mov edx, 1
    int 80h

    
salir:
    mov eax, SYS_EXIT
    int 80h
    





