.data 
CONTROL: .word32 0x10000
DATA: .word32 0x10008 
caracter: .byte 0
;DATA y CONTROL estan separadas por 8 celdas (8 bytes de memoria)


.text
lwu $s0, DATA($0)
lwu $s1, CONTROL($0)

;Limpio pantalla
daddi $t0, $0, 6
sd $t0, 0($s1)

daddi $s4, $0, 13 ;$s4 = (ASCII) ENTER

loop: 
;CONTROL = 9, leeme un caracter 
daddi $t0, $0, 9
sd $t0, 0($s1)  

;Guardo caracter en $t1
lbu $t1, 0($s0)

;Comparo con ASCII del enter
beq $t1, $s4, fin

;Guardo en variable para poder pasar direccion a DATA
sb $t1, caracter($0)

;Mando a DATA la direccion de caracter
daddi $t0, $0, caracter
sd $t0, 0($s0)

;Mando a CONTROL 4, para imprimir en pantalla
daddi $t1, $0, 4
sd $t1, 0($s1)

j loop


fin: halt