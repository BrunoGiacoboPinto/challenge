# Questões gerais de programação e computação

1) Explique, em suas palavras, o que é o conceito de classe em uma linguagem orientada a objetos?

Uma classe, em uma linguagem orientada a objetos, define um tipo de objeto, seus atributos, suas funções

2) Explique, em suas palavras, o que é um objeto imutável, suas vantagens e desvantagens?

Objeto imutável é um objeto que não permite a mudança no seu estado depois de criado, a maior vantagem é que ele não poderá ser modificado por engano, a desvantagem é que se preciso fazer a modificação não será possível

3) Explique por que o código Dart abaixo resulta em um loop infinito:

```dart
int func(int x) {
    return func(x + 1);
}
```

Como esse código não tem um final, ou seja, um valor em que ele para de incrementar, o código vai incrementar para sempre, resultando em um loop infinito

4) Por que o conceito de encapsulamento em linguagens com suporte a orientação a objetos é importante para o desenvolvimento de software?

O encapsulamento é importante porque, além de auxiliar na legitibilidade do código, "protege" o código, já que evita acessos indesejados a partes específicas

5) Explique, em suas palavras, qual é a diferença entre uma variável e uma constante em uma linguagem de programação?

Enquanto uma váriavel pode ter o seu valor modificado, uma constante, após sua atribuição, não poderá ser modificada

6) Explique, em suas palavras, o que é um algoritmo?

Um algoritmo é uma sequência de instruções para a realização de uma tarefa

7) Dado que dois algoritmos `A` e `B` resolvem o mesmo problema `P`, como conseguimos provar matematicamente que um algoritmo é mais eficiente computacionalmente que o outro?

Atráves da sua complexidade, calculando o tempo de execução

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

como uma função do tipo void não possui um retorno, o swap faz a troca internamente, mas não a retorna e nem muda as variaveis no main

9) Qual a principal vantagem de uma lista encadeada?

Através de uma lista encadeada, podemos acessar e acrescentar elementos em qualquer posição

10) Assinale a alternativa correta a cerca das seguintes afirmações:

    I) O Algoritmo de Dijkstra encontra o caminho mais longo em um grafo; x -> mais curto

    II) Grafos homeomórficos tem números de nós distintos; x -> sao iguais em outras posições

    III) O algoritmo de busca binária tem complexidade $O(log(n))$ no pior caso;

    IV) Se um algoritmo A tem complexidade computacional $O(2^n)$ no pior caso, ele é mais eficiente
    que um algoritmo B com complexidade $O(n^2)$ no pior caso; x-> ao contrario

    V) É impossível comparar a complexidade computacional de algoritmos que não estão em classes de complexidade distintas;

Dadas as afirmativas acima, estão corretas somente (delete todas as alternativas incorretas):

    a) I e V 
    b) Todas estão corretas
    c) III, I e V
    d) III
    e) V

Resposta: Alternativa d (*troque os underlines pela letra da alternativa.*)