# Stories Untold em Prolog

**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01 <br>
**Número do Grupo**: 04<br>
**Paradigma**: Lógico<br>

## Alunos

|Matrícula | Aluno |
| -- | -- |
| 18/0015834 | Elizeu Kadesh |
| 20/0030469  |  Felipe Candido de Moura  |
| 19/0089601  |  João Lucas Pinto         |
| 15/0141629 |  Matheus Pimentel |
| 19/0038926  | Victor Eduardo Araújo Ribeiro  |

## Sobre

O projeto Games, consiste em uma reprodução do capítulo 1 do jogo _Stories Untold_ chamado de the _The House Abandon_ em Prolog. O jogo é baseado em texto e tem como objetivo explorar uma casa e chegar em um determinado evento baseando-se apenas nas descrições que serão dadas, e na intuição do próprio jogador.

## Screenshots

![Fluxo do Jogo](./assets/Fluxo_Stories_Untold.jpg)

## Instalação

**Linguagens**: *Prolog*<br>
**Tecnologias**: *SWI-Prolog*<br>

### Pré-requisitos

- Ter o [*SWI-Prolog*](https://www.swi-prolog.org/Download.html) instalado em sua máquina.

### Como executar o projeto?

Primeiramente, clone o repositório em sua máquina:

```
git clone git@github.com:UnBParadigmas2023-1/2023.1_G4_Logico_Planes_n_Games.git
```

Logo após, vá até a pasta *src* da área do projeto *Games*:

```
cd 2023.1_G4_Logico_Planes_n_Games/Games/src
```

Por fim executar o SWI e carregar o arquivo principal do jogo*:

```
swipl main.pl
```

## Uso

Basicamente o jogador vai inserir os comandos que quer realizar. Esses tendem a ser bem intuitívos ao que se quer fazer, por isso incentivamos a testar as idéias que tiver em mente.

OBS: Os comandos devem ser todos em Inglês.

Caso tenha alguma dificuldade, seguem abaixo alguns comandos comuns:

- lookaround
- look at (nome do que quer olhar)
- go to (nome do local)

## Participações

|Nome do Membro | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| -- | -- | -- |
|  Elizeu Kadesh     | Adição de interações, função de "look at" e implementação de linguagem natural                                    |  Excelente  |
| Felipe Candido de Moura | Desenvolvimento das mecânicas básicas de movimentação e interação, loop do game e ajuda geral no projeto     |  Excelente  |
| João Lucas Pinto  |    Adição do look around, menu help, "doors", e transcrição das mensagens padrões do jogo                         |  Excelente  |
| Matheus Pimentel  |  Adicao de regras e localizacao, ajuda na funcao "look at", integracao da linguagem natural e o projeto em prolog |  Excelente  |
| Victor Eduardo Araújo Ribeiro|   Fiz a função de movimentação (go_to), e as restrições de movimentação, uso/interação                  |  Excelente  |

- Grande parte do projeto foi desenvolvido em conjunto por meio do _Pair Programming_.

## Outros

### Lições Aprendidas
- Pensar no paradigma lógico, focando em fatos e regras de associação.
- Não depender dos operadores de condição.
- Usar o operador cut.
- Aprender a definir linguagem natural em Prolog.

### Percepções
- A facilidade em termos da programação em si, por ser mais próximo a linguagem natural.
- A diferença entre os paradigmas lógico e funcional, principalmente por um ser mais matemática.

### Contribuições e Fragilidades
- Dificuldade de identificar os erros.
- Dificuldade em raciocinar no paradigma lógico, à principio.

### Trabalhos Futuros
- Melhorar o jogo, adicionando complexidade.
- Fazer o segundo loop do jogo.

## Fontes

- Jogo Stories Untold: [Página na Steam](https://store.steampowered.com/app/558420/Stories_Untold/).
- Guia de Jogo em texto em Prolog: [Amzi - Adventure in Prolog](http://www.amzi.com/AdventureInProlog/a1start.php).
