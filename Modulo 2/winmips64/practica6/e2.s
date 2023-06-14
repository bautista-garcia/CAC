.data
uno: .asciiz "Uno"
dos: .asciiz "Dos"
tres: .asciiz "Tres"
cuatro: .asciiz "Cuatro"
cinco: .asciiz "Cinco"
seis: .asciiz "Seis"
siete: .asciiz "Siete"
ocho: .asciiz "Ocho"
nueve: .asciiz "Nueve"
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.text
;Configuramos $s0 = Control, $s1 = Data
lwu $s0, CONTROL($0)
lwu $s1, DATA($0)

jal ingreso
beq $v1, $0, fin
dadd $a0, $0, $v0
jal muestra

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


muestra: daddi $t3, $0, 1
beq $a0, $t3, caso_uno
daddi $t3, $t3, 1
beq $a0, $t3, caso_dos
daddi $t3, $t3, 1
beq $a0, $t3, caso_tres
daddi $t3, $t3, 1
beq $a0, $t3, caso_cuatro
daddi $t3, $t3, 1
beq $a0, $t3, caso_cinco
daddi $t3, $t3, 1
beq $a0, $t3, caso_seis
daddi $t3, $t3, 1
beq $a0, $t3, caso_siete
daddi $t3, $t3, 1
beq $a0, $t3, caso_ocho
daddi $t3, $t3, 1
j caso_nueve

;SWITCH donde cargo DATA con string respectivo
caso_uno: daddi $t0, $0, uno
j imprimir
caso_dos: daddi $t0, $0, dos
j imprimir
caso_tres: daddi $t0, $0, tres
j imprimir
caso_cuatro: daddi $t0, $0, cuatro
j imprimir
caso_cinco: daddi $t0, $0, cinco
j imprimir
caso_seis: daddi $t0, $0, seis
j imprimir
caso_siete: daddi $t0, $0, siete
j imprimir
caso_ocho: daddi $t0, $0, ocho
j imprimir
caso_nueve: daddi $t0, $0, nueve
j imprimir

imprimir: sd $t0, 0($s1)
daddi $t1, $0, 4
sd $t1, 0($s0)

jr $ra





