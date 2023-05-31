;Version con INTERRUPCIONES
pic equ 20h
imr equ 21h
int2 equ 26h
hand_datos equ 40h
hand_estado equ 41h
pos_hand equ 10
org 40
ip_hand dw rut_hand
org 1000h
caracteres db ?
org 2000h
;Lectura de caracteres
mov dl, 5 
mov bx, offset caracteres
input: nop
int 6
inc bx
dec dl
jnz input

;Configuracion de Handshake 
in al, hand_estado
or al, 10000000b
out hand_estado, al
mov bx, offset caracteres
mov dl, 10

;Configuracion del pic
cli
mov al, 11111011b
out imr, al
mov al, pos_hand
out int2, al
sti

mov dh, 0 ;Si esta en 0 inc bx, sino dec bx

lazo: cmp dl, 0
jnz lazo

;Desactivo HAND por interrupciones
in al, hand_estado
and al, 01111111b
out hand_estado, al

int 0
org 3000h
rut_hand:push ax
cmp dl, 5
jnz imp
mov dh, 1
imp: cmp dh, 1
jnz creciente
dec bx
mov al, [bx]

jmp continuar
creciente: mov al, [bx]
inc bx
continuar: out hand_datos, al
dec dl
mov al, 20h
out pic, al
pop ax
iret
end


















