.data
tabla: .double 4,5,6,7,8,19
fin_tabla: 
resultado: 

.text
daddi $a0, $0, fin_tabla
daddi $a0, $0, 6
daddi $a1, $0, tabla
daddi $a2, $0, 6
jal greater_than
sd $v0, resultado($0)
halt
;a0 = Cant tabla
;a1 = offset tabla
;a2 = M
greater_than: daddi $v0, $0, 0 ;Inicializo valor de retorno en 0
ld $t0, 0($a1)  ;Equivalente a offset en MSX
daddi $t2, $0, 1 ;t2 = 1 para usar en bneq
slt $t1, $a2, $t0 ;if(tabla[i] >= M) t1 = 1 
bne $t1, $t2, sig ;Si es menor paso al siguiente sino aumento cant mayor
daddi $v0, $0, 1 ;CANT++
sig: daddi $a1, $0, 8 ;Nos paramos en el proximo elemento
daddi $a0, $0, -1
bnez $a0, greater_than
jr $ra


