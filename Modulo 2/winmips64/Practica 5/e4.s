.data
peso: .double 100
estatura: .double 1.73
imc: .double 0.0
e1: .double 18.5
e2: .double 25
e3: .double 30
estado: 

.code
l.d f2, estatura(r0)
l.d f1, peso(r0)
l.d f3, e1(r0) ;Cargo parametro IMC 1
mul.d f2, f2, f2 ;f2 = estatura ^^ 2
l.d f5, e2(r0) ;Cargo parametro 2, evito RAW
div.d f4, f1, f2 ;f4 = peso / estatura ^^ 2 = IMC
l.d f6, e3(r0) ;Cargo parametro 3, evito RAW
s.d f4, imc(r0)
c.lt.d f4, f3 ;IMC < 18.5 -> FP = 1
bc1t etapa1
c.lt.d f4, f5
bc1t etapa2 
c.lt.d f4, f6
bc1t etapa3
daddi r8, r0, 4
j fin
etapa1: daddi r8, r0, 1
j fin
etapa2: daddi r8, r0, 2
j fin
etapa3: daddi r8, r0, 3
fin: sd r8, estado(r0)
halt