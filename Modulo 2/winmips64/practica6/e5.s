.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
.text
lwu $s0, CONTROL($0)
lwu $s1, DATA($0)

;CONTROL = 8 para leer un numero
daddi $t0, $0, 8
sd $t0, 0($s0) 

;$t0 = BASE flotante leida
l.d f1, 0($s1)
;cvt.d.l f1, f1

;CONTROL = 8 para leer un numero
daddi $t0, $0, 8
sd $t0, 0($s0)
;$t0 = NUMERO Leido
ld $a0, 0($s1)

;Paso como parametros a $a0 y f1
jal a_la_potencia

halt

a_la_potencia: daddi $t2, $0, 1
mtc1 $t2, f2
cvt.d.l f2, f2

beq $a0, $0, imprimir 

loop: mul.d f2, f2, f1 
daddi $a0, $a0, -1
bne $a0, $0, loop

imprimir: s.d f2, 0($s1)
daddi $t0, $0, 3
sd $t0, 0($s0)
jr $ra
