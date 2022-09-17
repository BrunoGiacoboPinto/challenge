# Questões gerais de programaçao e computação

1) Explique, em suas palavras, o que é o conceito de classe em uma linguagem orientada a objetos?

2) Explique, em suas palavras, o que é um objeto imutável, suas vantagens e desvantagens?

3) Explique por que o código dart abaixo resulta em um loop infinito:

```{dart}
int func(int x) {
    return funct(x + 1);
}
```

4) Por que o conceito de encapsulamento em linguagens com suporte a orientação a objetos é importante para o desenvolvimento de software?

5) Explique, em suas palavras, qual a diferença entre uma variável e uma constante em uma linguagem de programação?

6) Explique, em suas palavras, o que é um algoritmo?

7) Dado que dois algoritmos A e B resolvem o mesmo problema P, como conseguimos provar matematicamente que um algoritmo é mais eficiente computacionalmente que o outro?

8) Explique por que o código dart abaixo não altera os valores das variáveis X e Y, mesmo depois que `swap` é chamado:

```{dart}
void swap(int a, int b) {
    int temp = a;
    a = b;
    b = temp;
}


void main() {
    int x = 10;
    int y = 20;

    swap(x, y);

    print('${x == 10} ${y == 20}'); // true true
}
```

9) Qual a principal vantagem de uma lista encadeada?

10) Assinale a alternativa correta a cerca das seguintes afirmações:

    I) O Algoritmo de Dijkstra encontra o caminho mais longo em um grafo;

    II) Grafos homeomorfos tem números de nós distintos;

    III) O algoritmo de busca binária tem complexidade O(log(n)) no pior caso;

    IV) Se um algoritmo A tem complexidade computacional O(2ˆn) no pior caso, ele é mais eficiente
    que um algoritmo B com complexidade O(n^2) no pior caso; (O símbolo ^ denota exponênciação)

    V) É impossível comparar a complexidade computacional de algoritmos que não estão em classes de complexidade distintas;

    Dadas as afirmativas acima, estão corretas somente (delete todas as alternativas incorretas):

    a) I e V
    b) Todas estão corretas
    c) III, I e V
    d) III
    e) V
