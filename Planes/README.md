# Sistema de Controle de Tráfego Aéreo

**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01 <br>
**Número do Grupo**: 04<br>
**Paradigma**: Lógico<br>

## Alunos

|Matrícula | Aluno |
| -- | -- |
| 20/0014447  |  André Corrêa da Silva |
| 19/0012200  |  Douglas da Silva Monteles |
| 20/0018167  |  Gabriel Mariano da Silva |
| 19/0036940  |  Rafael Fernandes Amancio |

## Sobre

O presente projeto consiste em um sistema de criação e gerenciamento de rotas aéreas entre pontos de partida e chegada. No sistema é apresentada uma prova de conceito que envolve a criação de um protótipo funcional de geração de rotas baseadas na interpretação das ligações entre as capitais do Brasil como um grafo fortemente conectado.

O programa permite que o usuário selecione duas capitais sequencialmente para que seja gerada uma rota com um avião entre elas, onde é apresentada a movimentação do mesmo da partida até a chegada.

## Screenshots

### Funcionamento das Rotas Criadas pelo Usuário

![created routes](https://github.com/UnBParadigmas2023-1/2023.1_G4_Logico_Planes_n_Games/assets/72149063/9247ee4c-4cee-4b1b-a98b-af5c47538107)

### Rotas Geradas Automaticamente

![automatically generated routes](https://github.com/UnBParadigmas2023-1/2023.1_G4_Logico_Planes_n_Games/assets/72149063/6e76d061-8bc4-412c-856c-3ba65693201f)

## Instalação

**Linguagens**: *Prolog*<br>
**Tecnologias**: *Prolog/XPCE*<br>

### Pré-requisitos

- Ter o [*SWI-Prolog*](https://www.swi-prolog.org/Download.html) instalado em sua máquina.

### Como executar o projeto?

Primeiramente, clone o repositório em sua máquina:

```
git clone git@github.com:UnBParadigmas2023-1/2023.1_G4_Logico_Planes_n_Games.git
```

Logo após, vá até a pasta *src* da área do projeto *Planes*:

```
cd 2023.1_G4_Logico_Planes_n_Games/Planes/src
```

Finalmente, execute o projeto em sua máquina a partir da execução do arquivo *main.pl*:

```
swipl main.pl
```

## Uso

No canto direito, são apresentadas as capitais do Brasil, as quais podem ser utilizadas enquanto pontos de partida ou destino de um voo.

Para selecionar um ponto de partida, basta clicar no nome da capital desejada. Em seguida, selecione o ponto de destino desejado.

❗ Mas atenção! Os pontos de partida e destino não podem ser iguais!

Após selecionados os pontos de partida e destino, será apresentada visualmente o percurso de um avião entre os pontos.

❗ Mas atenção novamente! Não é possível fazer com que outro avião percorra o mesmo trajeto (na mesma ordem de partida e chegada) enquanto houver outro avião percorrendo a rota. Isso não vale para caso seja requisitada a rota inversa.

## Participações

|Nome do Membro | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| -- | -- | -- |
| André Corrêa da Silva     | Desenvolvimento Geral do Projeto e Apresentação dos Voos |  Excelente  |
| Douglas da Silva Monteles | Desenvolvimento Geral do Projeto e Criação Inicial do Projeto |  Excelente  |
| Gabriel Mariano da Silva  | Desenvolvimento Geral do Projeto           |  Excelente  |
| Rafael Fernandes Amancio  | Desenvolvimento Geral do Projeto           |  Excelente  |

- O desenvolvimento do projeto se deu, enquanto colaborativamente, através do **Pair/Group Programming**, onde todos os integrantes da sub-equipe se reuniram em uma chamada para desenvolver o *software*.

## Outros

O desenvolvimento do projeto se mostrou uma experiência desafiadora e enriquecedora para todos nós. Ao mesmo tempo em que o aprendizado da linguagem e do paradigma eram colocados em prática, o gerenciamento do tempo se mostrou enquanto uma fonte de pressão para os integrantes da sub-equipe.

Todavia, o trabalho em equipe e o compartilhamento de conhecimentos se mostraram fatores de extrema utilidade ao decorrer do desenvolvimento do *software*.

### Lições Aprendidas

- A depuração de erros em *Prolog* pode ser mais complicada que o convencional em outras linguagens.
- Houve uma evolução na capacidade de interpretação do paradigma lógico por nossa parte.
- Em alguns momentos é necessário o uso de cálculos e raciocínio matemático em programação.
- Houve uma evolução na capacidade de encontrar soluções para problemas existentes através da pesquisa em diversas fontes.

### Percepções

- As informações sobre erros retornadas pelo Prolog não são usualmente informativas. É importante saber lidar com isso.
- É notável a diferença entre o paradigma funcional e o lógico. Todavia, há algumas similaridades eventuais.
- É notável o quão antiquados e "pobres" são os componentes visuais de interface em *Prolog*.
- É difícil a adaptação entre o paradigma imperativo mais usualmente utilizado e o paradigma lógico.
- São escassas as informações sobre *Prolog* disponíveis na *internet*.

### Contribuições e Fragilidades

- Haja vista as complicações de tema e complexidade do projeto, foi avaliada a necessidade de divisão da equipe em sub-equipes responsáveis por diferentes temas. De todo modo, ambas as equipes se empenharam bem no desenvolvimento dos projetos e atuaram de forma colaborativa para atingir o resultado final esperado.
- Todavia, apesar da notável evolução da comunicação da equipe do primeiro projeto para o segundo, ainda há a necessidade da antecipação do início do planejamento, de modo a ampliar o tempo disponível para a implementação das soluções.

### Trabalhos Futuros

- Há a possibilidade de evolução da complexidade da lógica do projeto, de modo a tornar o mesmo mais próximo de um sistema especialista.
- Um exemplo de funcionalidade seria a limitação das arestas existentes e a criação de rotas baseadas apenas nas arestas existentes através do uso de algoritmos de busca em grafos como, por exemplo, *Dijkstra*.
- Há também a possibilidade de melhorar as simulações dos voos, considerando informações como velocidade e altitude, por exemplo.

## Fontes

- Mapa das Capitais do Brasil: [InfoEscola](https://www.infoescola.com/geografia/capitais-do-brasil/).
- Redimensionamento dos botões: [XPCE - Button size](https://comp.lang.prolog.narkive.com/jPA1r809/xpce-button-size).
