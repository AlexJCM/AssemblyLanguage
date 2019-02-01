;Ejercicio10:
;Dados 2 numeros A y B, si al menos uno de ellos
;es negativo se multiplicaran caso contrario se dividiran.


section .data

    msj1 db 'Ingrese numero A:  '
    len_msj1 equ $-msj1

    msj2 db 'Ingrese numero B:  '
    len_msj2 equ $-msj2   

    msj3 db 'La multiplicacion es: '
    len_msj3 equ $-msj3

    msj4 db 'La division es: '
    len_msj4 equ $-msj4    

   	SYS_EXIT  equ 1
	SYS_READ  equ 3
	SYS_WRITE equ 4
	STDIN     equ 0
	STDOUT    equ 1


section .bss


  numeroA resb 5

  numeroB resb 5

  resultado resb 5  

   

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

 

 verificar_signo:

    mov eax, [numeroA]

    sub eax, '0'

    js multiplicar ; si es negativo se multiplicará

    mov ebx, [numeroB]

    sub ebx, '0'

    js multiplicar



    jmp dividir  ;si ambos son positivos se dividirá



multiplicar:

    mov al, [numeroA]

    mov bl, [numeroB]

    sub al, '0'

    sub bl, '0'



    mul bl

    add ax, '0'

    mov [resultado], ax

    

presentar_resultado_mul:

    mov eax, SYS_WRITE

    mov ebx, STDOUT

    mov ecx, msj3

    mov edx, len_msj3

    int 80h  



    mov eax, SYS_WRITE

    mov ebx, STDOUT

    mov ecx, resultado

    mov edx, 1

    int 80h  



    jmp salir



dividir:

    mov al, [numeroA]

    mov bl, [numeroB]

    sub al, '0'

    sub bl, '0'



    mov dx, 0

    mov ah, 0



    div bl

    add ax, '0'

    mov [resultado], ax



presentar_resultado_div:

    mov eax, SYS_WRITE

    mov ebx, STDOUT

    mov ecx, msj4

    mov edx, len_msj4

    int 80h  



    mov eax, SYS_WRITE

    mov ebx, STDOUT

    mov ecx, resultado

    mov edx, 1

    int 80h    



salir:

    mov eax, SYS_EXIT

    int 80h