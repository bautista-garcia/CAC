.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
bienv: .asciiz "Bienvenido"
err: .asciiz "ERROR"
clave: .asciiz "hola"
ingreso: .asciiz 0

.text
lwu $s0, CONTROL($0)
lwu $s1, DATA($0)

daddi $s2, $0, 0 ;Desplazamiento para ingreso de cadena
daddi $s3, $0, 4 ;Limite superior de LOOP


loop: jal char
sb $v0, ingreso($s2) ;Guardo caracter en INGRESO + desp
daddi $s2, $s2, 1
bne $s2, $s3, loop

daddi $a0, $0, ingreso
daddi $a1, $0, clave
jal respuesta
halt

char: daddi $t0, $0, 9 ;CONTROL = 9 para leer un caracter
sd $t0, 0($s0)
lbu $t1, 0($s1) ;t1 = [DATA] = CARACTER LEIDO
dadd $v0, $0, $t1
jr $ra

respuesta: lw $t0, 0($a0) ;Como son cadenas de 4 bytes = 32 bits el load word me deberia tomar todos los elems de la tabla
lw $t1, 0($a1)
beq $t0, $t1, bien
;$t2 = "Mensaje correspondiente"
daddi $t2, $0, err
j mostrar_msg
bien: daddi $t2, $0, bienv
;DATA = "Mensaje de $t2"
mostrar_msg: sd $t2, 0($s1)
;CONTROL = 4; Imprimir cadena de caracteres
daddi $t3, $0, 4
sd $t3, 0($s0)
jr $ra
