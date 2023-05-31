.data
A: .word 1
B: .word 6
C: .word 0
table:
.code
ld r2, B(r0)
ld r1, A(r0) 
ld r3, C(r0)

loop: daddi r2, r2, -1
sd r1, table(r3)
daddi r3,r3, 8; 8 casilleros por 8 bytes
dsll r1, r1, 1
bnez r2, loop
halt



;a)Se presenta en la instruccion BNEZ, ya que no es posible un forwarding
;porque el ID (BNEZ) se hace al mismo tiempo que EX (daddi).

;BRANCH TAKEN: Se produce por una PENALIZACION POR SALTO. Esto significa
;que se predice que nunca se salta, avanza con HLT, pero luego identifica
;que BNEZ activa el salto por lo que se genera un atasco en HLT. 

;Forwarding: Adelantamiento de operandos. Se llevan los operandos a la
;etapa que lo necesita sin necesidad de esperar Mi o Wi

;b)Se generan RAW (Read after write) debido a que no esta disponible el 
;los datos en r1 y r2 (usados en lineas 6 y 7) hasta que no terminan
;las 5 etapas del cauce de ambos loads.

;Los branch taken stalls ahora duran 2 ciclos de reloj a diferencia del
;caso con forwarding activado donde duraba 1 ciclo de reloj. Esto se debe
; a que en el forwarding se identifica que va a saltar en EXE y ese valor
; se pasa directo a UC para avisar que cumple condicion de salto mientras 
; que con forwarding desactivado se espera a WB para saber si cumple condicion
; o no

;Una vez terminadas las 5 etapas del cauce r1 y r2 cuentan con los datos
;de A y B.

; c)Ahora el reordenamiento hace que BNEZ tenga disponible el dato de r2 en
; su etapa id

; d) Son las potencias de 2