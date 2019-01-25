;Ejercicio06:
;Leer tres numeros desde teclado e indicar cual 
;es el mayor y cual es el menor de todos ellos
section .data

    msj1 db 'Ingrese numero A: '
    len_msj1 equ $-msj1

    msj2 db 'Ingrese numero B: '
    len_msj2 equ $-msj2  

    msj3 db 'Ingrese numero C: '
    len_msj3 equ $-msj3 

    msj4 db 'El numero mayor es el '
    len_msj4 equ $-msj4

    msj5 db 'El numero menor es el '
    len_msj5 equ $-msj5

    SYS_EXIT  equ 1
	SYS_READ  equ 3
	SYS_WRITE equ 4
	STDIN     equ 0
	STDOUT    equ 1

section .bss

   numeroA resb 4
   numeroB resb 4
   numeroC resb 4

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

    ;Presentamos el mensaje 2
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj2
    mov edx, len_msj2
    int 80h

    ;Obtenemos por teclado el numero B
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, numeroB
    mov edx, 2
    int 80h   

    ;Presentamos el mensaje 3
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj3
    mov edx, len_msj3
    int 80h

    ;Obtenemos por teclado el numero C
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, numeroC
    mov edx, 2
    int 80h   

verificar_mayor:
    ;Presentamos el mensaje 4
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj4
    mov edx, len_msj4
    int 80h

    mov eax, [numeroA]
    mov ebx, [numeroB]   
    cmp eax, ebx
    ja es_mayor_A  ;ja es similar a jg
    ;jb es_mayor_B
    jmp es_mayor_B

es_mayor_A:
   mov ecx, [numeroC]
   cmp eax, ecx
   ja mayor_all_A
   jmp mayor_all_C

es_mayor_B:
    mov ecx, [numeroC]
    cmp ebx, ecx
    ja mayor_all_B
    jmp mayor_all_C


;----- PRESENTAR EL NUMERO A COMO EL MAYOR DE TODOS ---- 
mayor_all_A:
    ;Presentamos el numero mayor
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, numeroA
    mov edx, 2
    int 80h  
    jmp menor_de_todos1

menor_de_todos1:
  ;Presentamos el mensaje 5
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj5
    mov edx, len_msj5
    int 80h
    ;calculamos el menor
    mov eax, [numeroB]
    mov ebx, [numeroC]
    cmp eax, ebx
    jb presentar_menor1   

    ;Presentamos el numero menor
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, numeroC
    mov edx, 2
    int 80h  

    jmp salir

    presentar_menor1:    
    ;Presentamos el numero menor
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, numeroB
    mov edx, 2
    int 80h  

    jmp salir


;----- PRESENTAR EL NUMERO B COMO EL MAYOR DE TODOS ----
mayor_all_B: 
    ;Presentamos el numero mayor
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, numeroB
    mov edx, 2
    int 80h 
    jmp menor_de_todos2

menor_de_todos2:
    ;Presentamos el mensaje 5
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj5
    mov edx, len_msj5
    int 80h
    ;Calculamos el menor de los dos
    mov eax, [numeroA]
    mov ebx, [numeroC]
    cmp eax, ebx
    jb presentar_menor2
     
    ;Presentamos el numero menor
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, numeroC
    mov edx, 2
    int 80h  

    jmp salir

    presentar_menor2:    
    ;Presentamos el numero menor
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, numeroA
    mov edx, 2
    int 80h   

    jmp salir


;----- PRESENTAR EL NUMERO C COMO EL MAYOR DE TODOS ----
mayor_all_C: 
    ;Presentamos el numero mayor
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, numeroC
    mov edx, 2
    int 80h  

    jmp menor_de_todos3

menor_de_todos3:
    ;Presentamos el mensaje 5
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj5
    mov edx, len_msj5
    int 80h
    ;calculamos el menor entre A y B
    mov eax, [numeroA]
    mov ebx, [numeroB]
    cmp eax, ebx
    jb presentar_menor3     

    ;Presentamos el numero menor
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, numeroB
    mov edx, 2
    int 80h  

    jmp salir

    presentar_menor3:   
    ;Presentamos el numero menor
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, numeroA
    mov edx, 2
    int 80h  

    jmp salir



salir:
    mov eax, SYS_EXIT
    int 80h