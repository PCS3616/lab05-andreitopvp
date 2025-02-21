LD N        # Carrega N
JZ FIM      # Se N == 0, termina o programa

LD UM       # Carrega a constante 1
MM RES      # Inicializa RES = 1

@LOOP
LD N        # Carrega N
JZ FIM      # Se N == 0, termina o loop
ML RES      # Multiplica RES por N
MM RES      # Armazena o novo RES

LD N        # Carrega N
SB UM       # Subtrai 1
MM N        # Atualiza N
JP LOOP     # Repete enquanto N > 0

@FIM
HM /000     # Finaliza o programa

@DADOS
N   K/5     # Número para calcular fatorial (exemplo: 5)
RES K/1     # Inicializa RES = 1
UM  K/1     # Constante 1