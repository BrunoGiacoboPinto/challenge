# Questões gerais de programação e computação

1) Explique, em suas palavras, o que é o conceito de classe em uma linguagem orientada a objetos?
Classe é o modelo de atributos e métodos a ser seguido pelas instâncias geradas, neste caso objetos. 

2) Explique, em suas palavras, o que é um objeto imutável, suas vantagens e desvantagens?
Objeto cujo valor só pode ser atribuido uma vez.

Vantagem:
Aumenta a segurança e evita a ocorrência de efeitos colaterais(resultados inesperados), possui implementações mais 'bonitas'.

Desvantagem:
É necessário sempre criar um objeto novo mesmo que precise alterar apenas um atributo do escopo, fazendo um abuso grande do garbage collector.

3) Explique por que o código Dart abaixo resulta em um loop infinito:

```dart
int func(int x) {
    return func(x + 1);
}
```
Implementação sem o caso base da recursão, o que acarreta num loop de chamada infinito desta.

4) Por que o conceito de encapsulamento em linguagens com suporte a orientação a objetos é importante para o desenvolvimento de software?
Para a proteção da integridade dos dados de uma classe. Evitando acesso indevido que não por Getters, ou Setters.

5) Explique, em suas palavras, qual é a diferença entre uma variável e uma constante em uma linguagem de programação?
Variável é um espaço reservado para um armazenamento de um dado que pode ser alterado em tempo de execução, enquanto constantes são dados que não podem ser modificados em tempo de execução. 

6) Explique, em suas palavras, o que é um algoritmo?
Sequencia de instruções FINITAS a serem seguidas para resolução de problemas, com uma semântica imperativa, num contexto real seria algo como uma receita.

7) Dado que dois algoritmos `A` e `B` resolvem o mesmo problema `P`, como conseguimos provar matematicamente que um algoritmo é mais eficiente computacionalmente que o outro?
Pelo princípio de indução finita, em matemática discreta aprende-se a aplicação de algorítmos em contextos gerais, em que prova-se a validade de algo para n e n + 1, e, nesse caso, a eficiência será medida pelo número de passos seguidos para a resolução do problema P.

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
Todas as variáveis são declaradas localmente nas respectivas funções, então seus valores só são alterados nos respectivos escopos.

9) Qual a principal vantagem de uma lista encadeada?
Pelo fato de possuir referencias bem definidas, não é preciso efetuar cópias desta para manter a integridade da alocação da lista no espaço lógico, assim como ocorre com a lista linear.

10) Assinale a alternativa correta a cerca das seguintes afirmações:

    I) O Algoritmo de Dijkstra encontra o caminho mais longo em um grafo;
        É o caminho mais curto.

    II) Grafos homeomórficos tem números de nós distintos;
        Não sei bem, mas eu lembro de ter aprendido algo sobre grafos homeomorficos possuirem estruturas bem definidas. Relacionando-se sempre a vertices adjacentes.

    III) O algoritmo de busca binária tem complexidade $O(log(n))$ no pior caso;
        Certo.

    IV) Se um algoritmo A tem complexidade computacional $O(2^n)$ no pior caso, ele é mais eficiente
    que um algoritmo B com complexidade $O(n^2)$ no pior caso;
        Não pois a complexidade do algorítmo A constitui uma função exponencial enquanto o algoríto B constitui uma função quadrática, logo, a curva de complexidade cresceria muito mais no algorítmo A. 

    V) É impossível comparar a complexidade computacional de algoritmos que não estão em classes de complexidade distintas;
        Não é impossível.

Dadas as afirmativas acima, estão corretas somente (delete todas as alternativas incorretas):

    a) I e V 
    b) Todas estão corretas
    c) III, I e V
    d) III
    e) V

Resposta: Alternativa D (*troque os underlines pela letra da alternativa.*)