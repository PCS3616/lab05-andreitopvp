@ /100
GD /000      ; Lê os dois números (4 dígitos e um espaço)
MM BUFFER    ; Armazena na memória

LD BUFFER    ; Carrega os dois primeiros caracteres (x)
SB AJUSTE    ; Subtrai 0x3030 para converter de ASCII para decimal
MM X         ; Armazena x

LD BUFFER+1  ; Carrega os dois últimos caracteres (y)
SB AJUSTE    ; Subtrai 0x3030 para converter de ASCII para decimal
MM Y         ; Armazena y

LD X         ; Carrega x
AD Y         ; Soma x + y
MM RESULT    ; Armazena o resultado

LD RESULT    ; Verifica o "vai-um"
ML MASK      ; Isola o dígito menos significativo
SB LIMITE    ; Se maior ou igual a 10, precisa do "vai-um"
JP AJUSTAR   ; Se necessário, ajusta o resultado

SOMA_FINAL   LD RESULT
AD AJUSTE    ; Soma 0x3030 para converter de volta para ASCII
PD /100      ; Imprime o resultado
HM /000      ; Finaliza

AJUSTAR      LD RESULT
SB DEZ       ; Subtrai 10 do LSB
AD VAIUM     ; Soma 0x0100 no resultado
MM RESULT    ; Armazena o ajuste
JP SOMA_FINAL

@ /200
BUFFER  K /0000  ; Armazena os 4 caracteres lidos
X       K /0000  ; Primeiro número
Y       K /0000  ; Segundo número
RESULT  K /0000  ; Resultado da soma
AJUSTE  K /3030  ; 0x3030 para ajustar ASCII
MASK    K /00FF  ; Máscara para pegar o LSB
LIMITE  K /000A  ; 10 decimal para verificar "vai-um"
DEZ     K /000A  ; Usado para subtrair 10
VAIUM   K /0100  ; Usado para adicionar "vai-um"
