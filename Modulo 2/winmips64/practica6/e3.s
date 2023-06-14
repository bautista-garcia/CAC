.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
.text
lwu $s0, CONTROL($0)
lwu $s1, DATA($0)

;Ingreso 1er num
jal ingreso
beq $v1, $0, fin
dadd $a0, $0, $v0

;Ingreso 2do num
jal ingreso
beq $v1, $0, fin
dadd $a1, $0, $v0

jal resultado
fin: halt



ingreso: daddi $t0, $0, 8 ;CONTROL = 8, lectura de teclado
sd $t0, 0($s0)

;Guardo numero en $v0, RETURN VALUE
ld $v0, 0($s1)


;V1 = 1 si es numero, V1 = 0 si no es un numero
bne $t1, $0, num
daddi $v1, $0, 0
num: 
daddi $v1, $0, 1
jr $ra

resultado: dadd $t0, $a0, $a1
sd $t0, 0($s1) ;Recordar que para imprimir numeros se manda el numero a dato, no la direccion

daddi $t2, $0, 1
sd $t2, 0($s0)

jr $ra
