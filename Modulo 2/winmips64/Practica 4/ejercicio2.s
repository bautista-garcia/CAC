.data
A: .word 1
B: .word 2
.code
ld r1, A(r0)
ld r2, B(r0)
sd r2, A(r0) ;Dos Stalls porque quiere lo que hay en r2 antes de que se haga el WB de la linea 6
sd r1, B(r0)
halt

;a)
;Es un STALL del tipo RAW
;el CPI es de 2.2 ya que hay 11 ciclos para 5 instrucciones. 11 / 5 = 2.2 CPI

;b)
;No se producen atascos ya que luego de la etapa MEM de ambos loads el dato se guarda
;en un buffer (el valor a almacenar en los registros) al que pueden acceder 
;ambos stores antes de la etapa de WB de ambos loads.

;El color verde indica que se hizo el WB de los loads

;1.8 CPI