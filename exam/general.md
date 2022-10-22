# Questões gerais de programação e computação

1) Explique, em suas palavras, o que é o conceito de classe em uma linguagem orientada a objetos?

R: Uma linguagem orientada a objetos é uma linguagem que permite a implementação de um paradigma (ou
um conjunto de conceitos) que trata conceitos reais (ex: Carro, Ave, Gato) como objetos/classes que 
carregam dados e métodos dentro de si. Esses objetos que simulam a realidade devem permitir algumas
regras de implementação, como o isolamento de informações (O objeto Gato deve ser visto como diferente 
do objeto Carro, por exemplo) através do encapsulamento; como a "árvore hierárquica" entre objetos (O objeto
Gato pode ser uma subclasse herdada do objeto Animal, podendo acessar métodos e dados que só existiam no
objeto Animal), através de herança; como a possibilidade de flexibilidade (O objeto Gato pode ser construído
como Gato, Gato.semRabo, Gato.selvagem, o que pré-define durante a construção alguns dados), através dos
Construtores. 

2) Explique, em suas palavras, o que é um objeto imutável, suas vantagens e desvantagens?

R: Um objeto imutável é um objeto que não permite manipulações posteriores à sua instanciação. Sua 
principal vatangem é ter um espaço em memória bem definido e de rápido acesso, além disso traz mais
segurança durante o desenvolvimento por não poder sofrer alterações inesperadas/indesejadas. Sua 
principal desvantagem cai justamente na falta de flexibilidade do objeto, sendo necessário reinstanciar
uma variável que carrega um objeto imutável toda vez que precisamos realizar algum tipo de manipulação,
aumentando a complexidade do código e da manutenção.

3) Explique por que o código Dart abaixo resulta em um loop infinito:

```dart
int func(int x) {
    return func(x + 1);
}
```

R: O código representa uma função recursiva sem condição de parada, por conta disso irá sempre acessar
o próximo elemento sem encontrar um limite de execução.

4) Por que o conceito de encapsulamento em linguagens com suporte a orientação a objetos é importante para o desenvolvimento de software?

R: Encapsulamento serve principalmente para reaproveitamento de objetos (e portanto código), o que auxilia
durante o desenvolvimento por conta do isolamento de dados e consequentemente manutenção simplifcada.

5) Explique, em suas palavras, qual é a diferença entre uma variável e uma constante em uma linguagem de programação?

R: Variáveis são pedaços de memória normalmente mutáveis e/ou atribuídos em tempo de execução de um código.
Constantes são obrigatoriamente imutáveis e atribuídas em tempo de compilação. Em outras palavras, constantes 
são valores únicos e inalteráveis, previamente carregados, mais rápidos e eficientes que variáveis não constantes.
Apesar de podermos definir variáveis imutáveis, estas ainda são definidas em tempo de execução e só são 
atribuídas depois de suas devidas manipulações.

6) Explique, em suas palavras, o que é um algoritmo?

R: Um algoritmo é um conjunto de expressões capaz de manipular dados em sequência. Algoritmos também
são independentes do contexto, possuindo um objeto claro e previamente definido a fim de chegar num
resultado.

7) Dado que dois algoritmos `A` e `B` resolvem o mesmo problema `P`, como conseguimos provar matematicamente que um algoritmo é mais eficiente computacionalmente que o outro?

R: Além do tempo de execução e consumo de memória para cada expressão definida dentro do algoritmo, 
é possível calcularmos seus piores casos de execução olhando para quantas variáveis e iterações 
existem dentro de cada algoritmo, e então definindo seu big O a fim de comparação com outros algoritmos.

8) Explique por que o código dart abaixo não altera os valores das variáveis `X` e `Y`, mesmo depois que `swap` é chamado:

```dart
void swap(int a, int b) {
    int temp = a;
    a = b;
    b = temp;
}

void main() {
    int x = 10;
    int y = 20;

    swap(x, y);

    print('${x == 10} ${y == 20}'); // prints true true
}
```

R: Quando x e y são passados para o método swap, são reservados dois outros espaços de memória a e b
para manipulação desses dados, portanto, toda e qualquer manipulação que existe dentro do escopo de swap
ocorrerá nesses outros espaços de memória, mantendo x e y inalterados. 

9) Qual a principal vantagem de uma lista encadeada?

R: Ter seus elementos indexados para posterior manipulação.

10) Assinale a alternativa correta a cerca das seguintes afirmações:

    I) O Algoritmo de Dijkstra encontra o caminho mais longo em um grafo;

    II) Grafos homeomórficos tem números de nós distintos;

    III) O algoritmo de busca binária tem complexidade $O(log(n))$ no pior caso;

    IV) Se um algoritmo A tem complexidade computacional $O(2^n)$ no pior caso, ele é mais eficiente
    que um algoritmo B com complexidade $O(n^2)$ no pior caso;

    V) É impossível comparar a complexidade computacional de algoritmos que não estão em classes de complexidade distintas;

Dadas as afirmativas acima, estão corretas somente (delete todas as alternativas incorretas):

    a) I e V 
    b) Todas estão corretas
    c) III, I e V
    d) III
    e) V

Resposta: Alternativa III (*troque os underlines pela letra da alternativa.*)