[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/8K2hEYnH)
[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-2e0aaae1b6195c2367325f4f02e2d04e9abb55f0b24a779b69b11b9e10269abc.svg)](https://classroom.github.com/online_ide?assignment_repo_id=18200093&assignment_repo_type=AssignmentRepo)
# PCS3616 - Laboratório 5 - MVN 3

Na aula de hoje começamos o estudo e uso da linguagem de montagem da
MVN, o ASM (assembly), e da função de pilha implementada na MVN.
A partir desta aula você só escreverá códigos em ASM, e para isso
precisamos usar os módulos Montador, Ligador e Relocador.

## Instalação das ferramentas

Diferentemente do monitor, essas ferramentas foram escritas em uma
linguagem compilada ([Rust](https://www.rust-lang.org/)), então é
somente necessário instalar um executável.
Instruções sobre esse processo e sobre as opções disponíveis nas
ferramentas estão disponíveis
[em seu repositório](https://github.com/PCS3616/mvn-rs#readme)

### Execução do código gerado

Executar o código MVN gerado deve ser feito da mesma forma que com o
código MVN escrito manualmente.

## Tabela de mnemônicos

| OPCODE | MNEMONIC | function |
| --- | --- | --- |
| 0 | JP |Jumps to the operand address |
| 1 | JZ |Jumps to the operand address if AC is 0 |
| 2 | JN |Jumps to the operand address if AC is negative |
| 3 | LV |Load the operand to AC |
| 4 | AD |Save in AC the value AC+value stored in operand address |
| 5 | SB |Save in AC the value AC-value stored in operand address |
| 6 | ML |Save in AC the value AC*value stored in operand address |
| 7 | DV |Save in AC the value AC/value stored in operand address |
| 8 | LD |Save in AC the value stored in operand address |
| 9 | MM |Save in the operand address the value AC |
| A | SC |Call subroutine in operand address |
| B | RS |Return the subroutine that started in operand address |
| C | HM |Halt machine |
| D | GD |Save in AC a pair of nibbles from operand device |
| E | PD |Send value in AC to operand device |
| F | SO |Calls the supervisor to deal with specific codes, which are given by the operand |

## Exercícios

**ATENÇÃO:** os entregáveis desta semana deverão estar em formato ASM.
Você pode (e deve) utilizar o Assembler do utilitário `mvn-cli` para
gerar os executáveis e testá-los localmente em seu simulador.

## 0.  `fatorial.asm`
No laboratório 4, você escreveu a sub-rotina fatorial. Agora,
    você irá reescrevê-la, mas na linguagem de montagem da MVN.
    Considere os rótulos N e RES, localizados nas posições de memória 0x100
    e 0x102, que representam respectivamente o argumento e o resultado do fatorial.

## 1. `quadrados-perfeitos.asm`
Desenvolva um programa para a MVN que calcule e tabele, a partir da
posição de memória 0x100, os quadrados perfeitos dos 64 primeiros
números naturais (0x0, 0x1, 0x2, ..., 0x3F). O cálculo deverá ser
realizado aplicando a seguinte interessante propriedade:

$$n^2=\sum_{i=0}^{n-1}(2i+1)$$

Cada quadrado calculado deverá ser armazenado como um inteiro de dois
bytes, iniciando na posição de memória 0x100, ou seja, ao final da
execução, os valores das posições de memória serão:

 |Posição (hexa)         |Valor (hexa)|Valor (decimal)|N                 |
 |-----------------------|------------|---------------|------------------|
 |100                    |0000        |0              |0                 |
 |102                    |0001        |1              |1                 |
 |104                    |0004        |4              |2                 |
 |...                    |...         |               |...               |
 |1??                    |0???        |3969           |63                |

OBS.: caso você encontre problemas em algum exercício devido ao evitador
de loops infinitos, você pode mudar o valor do número máximo de passos
acionando a flag "-s \[valor\]" ou "\--max_step \[valor\]", trocando
"\[valor\]" pelo limite de passos que você queira definir, ao chamar o
módulo "mvnMonitor.py".

\*:mostração intuitiva da fórmula

![](./media/image1.png)

## 2. `io.asm`
Escrever um programa que lê dois números do teclado
(`x` e `y`), e imprime o valor de `x+y`. Observações:

- `0 <= x`, `y <= 99`

- Os números devem ser lidos do teclado, em uma única linha, no
formato `<x-d1><x-d2><s><s><y-d1><y-d2>`, onde:

  - `<x-d1>` é o primeiro dígito de x. Se `x < 10`, o dígito
  informado deve ser `0`.

  - `<x-d2>` é o segundo dígito de `x`.

  - `<s>` é um espaço em branco

  - `<y-d1>` é o primeiro dígito de `y`. Se `y < 10`, o dígito
  informado deve ser `0`.

  - `<x-d2>` é o segundo dígito de `y`.

Por exemplo, \"07 54\" é uma entrada válida, e o programa deve imprimir
\"61\" na saída. Lembrando que em ASCII 07 é 0x3037 e 54 é 0x3534, enquanto 61 é 0x3631.

Para realizar esse exercício, utilize o seguinte algoritmo:

- Subtraia 0x3030 de ambos os números obtidos pelo teclado.
- Some esses números.
- Caso o dígito menos significativo do número resultante da soma, seja maior ou igual a A, subtraia 0x000A e some 0x0100 para realizar o "vai-um".
- Soma 0x3030 ao número resultante do passo anterior.
- Imprima esse número no monitor.

OBS.: Consulte a [tabela ASCII](http://ascii.cl/)
