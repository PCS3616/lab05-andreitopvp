LD N
JZ FIM
LOOP   JP VERIFICAR
COMECO JZ FIM
       JP LOOP


@/230
FIM HM /000

@ /0200
VERIFICAR JP /000
          JZ FIMROT
          ML RES
          MM RES
          LD N
          SB UM
          MM N
FIMROT    JP COMECO


@ /0102
RES K/0001

@ /0220
UM K/0001

