;Ejercicio11:
;Ingresar un numero entre 1 y 7 y presentar
;el dia de la semana correspondiente a ese numero

section .data

    msj1 db 'Ingrese un numero entre 1-7:  '
    len_msj1 equ $-msj1

    lunes db 'LUNES', 10
    len_lunes equ $-lunes

    martes db 'MARTES', 10
    len_martes equ $-martes

    miercoles db 'MIERCOLES', 10
    len_miercoles equ $-miercoles

    jueves db 'JUEVES', 10
    len_jueves equ $-jueves

    viernes db 'VIERNES', 10
    len_viernes equ $-viernes

    sabado db 'SABADO', 10
    len_sabado equ $-sabado

    domingo db 'DOMINGO', 10
    len_domingo equ $-domingo

    invalido db 'Opcion incorrecta , intente de nuevo',10
    len_invalido equ $-invalido

    SYS_EXIT  equ 1
	SYS_READ  equ 3
	SYS_WRITE equ 4
	STDIN     equ 0
	STDOUT    equ 1

section .bss
    ;Variables
    numero resb 5    
   
section .text

global _start
_start:

obtener_numero:
    ;Presentamos el mensaje 1
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msj1
    mov edx, len_msj1
    int 80h

    ;Obtenemos por teclado el numero
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, numero
    mov edx, 2
    int 80h 

leer_opcion:
    mov al, [numero] ;Guarda en AL el numero ingresado
    sub al, '0' ;Convierte a decimal

    cmp al, 1
    je presentar_lunes

    cmp al, 2
    je presentar_martes

    cmp al, 3
    je presentar_miercoles

    cmp al, 4
    je presentar_jueves

    cmp al, 5
    je presentar_viernes

    cmp al, 6
    je presentar_sabado

    cmp al, 7
    je presentar_domingo
    
    jmp opcion_invalida ;Se ejecuta cuando el numero ingresado no está dentro del rango

presentar_lunes:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, lunes
    mov edx, len_lunes
    int 80h
    jmp salir

presentar_martes:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, martes
    mov edx, len_martes
    int 80h
    jmp salir

presentar_miercoles:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, miercoles
    mov edx, len_miercoles
    int 80h
    jmp salir

presentar_jueves:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, jueves
    mov edx, len_jueves
    int 80h
    jmp salir

presentar_viernes:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, viernes
    mov edx, len_viernes
    int 80h
    jmp salir
presentar_sabado:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, sabado
    mov edx, len_sabado
    int 80h
    jmp salir

presentar_domingo:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, domingo
    mov edx, len_domingo
    int 80h
    jmp salir

opcion_invalida:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, invalido
    mov edx, len_invalido
    int 80h
    jmp obtener_numero ;Vuelve a repetir la rutina hasta ingresar ua opcion valida

salir:
    mov eax, SYS_EXIT
    int 80h
