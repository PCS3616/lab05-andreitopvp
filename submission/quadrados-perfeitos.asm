LD CONTPARA  # Carrega o valor 63 (0x3F)
SB CONTADOR  # Verifica se CONTADOR atingiu 63
JZ FIM       # Se sim, termina o programa

SC CALCULO   # Chama a sub-rotina para calcular quadrados perfeitos
JP INICIO    # Volta para verificar a condição de parada

@CALCULO
LD CONTADOR  # Carrega i
ML DOIS      # Multiplica por 2 (2*i)
AD UM        # Soma 1 (2*i + 1)
AD SOMA      # Adiciona ao valor acumulado
MM SOMA      # Atualiza SOMA

LD ENDERECO  # Obtém o endereço de memória onde armazenaremos SOMA
AD DOIS      # Avança para o próximo endereço (pois cada valor ocupa 2 bytes)
MM ENDERECO  # Atualiza o endereço na memória

LD SOMA      # Obtém o quadrado perfeito calculado
MM ENDERECO  # Armazena no endereço correspondente

LD CONTADOR  # Incrementa CONTADOR
AD UM
MM CONTADOR

RS CALCULO   # Retorna da sub-rotina

@FIM
HM /000      # Finaliza o programa

@DADOS
CONTPARA  K /003F  # 63 (0x3F), limite superior
CONTADOR  K /0000  # Começa em 0
UM        K /0001  # Constante 1
DOIS      K /0002  # Constante 2
ENDERECO  K /0100  # Primeiro endereço de armazenamento
SOMA      K /0000  # Acumulador para quadrados perfeitos
