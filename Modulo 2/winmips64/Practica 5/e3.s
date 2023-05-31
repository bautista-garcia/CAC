.data
base: .double 5.85
altura: .double 13.47
aux: .double 0.5
superficie: .double 0.0

.code
l.d f1, base(r0)
l.d f2, altura(r0)
l.d f3, aux(r0)
mul.d f1, f2, f1 ;f1 = Base x Height
mul.d f3, f3, f1 ;f3 = (Base x Height) / 2
s.d f3, superficie(r0)
halt

; Notas: Se producen RAWS en mul.d f3, f3, f1 ya que el valor de f1 aun no esta
; disponible, sale de los RAWS una vez pasada etapa MEM de mul.d f1, f2, f1 (forwardin activado)
; Lo mismo ocurre en la instruccion s.d pero ahora en la etapa ID ya que en iden
; de operandos todavia no esta disponible f3.

; Se produce un str porque mul y sd quieren acceder a mem en simultaneo