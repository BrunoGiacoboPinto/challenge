# Questões gerais de programação e computação

1) Explique, em suas palavras, o que é o conceito de classe em uma linguagem orientada a objetos?

A classe nada mais é que um objeto em si, que pode ter propriedades e pode conter em seu contrato funções. A partir do conceito básico de um objeto (classes) nós temos uma imensidão de possibilidades de composição das mesmas, com conceitos de herança, injeção com abstrações e implementações, encapsulamento, polimorfismo, e por aí vai.

2) Explique, em suas palavras, o que é um objeto imutável, suas vantagens e desvantagens?

Um objeto imutável é aquele que, após sua declaração, não pode mudar seu estado. Desta forma, garantimos aque suas propriedades serão sempre as mesmas, e que para alterá-las, uma cópia deste objeto com as respectivas alterações desejadas será criada. Dessa forma, você tem um controle melhor de como os dados são tratados e alterados, e evita problemas relacionados à, por exemplo, interações terceiras interfirindo no estado de uma propriedade inexperadamente. Enfim, torna o controle de dados do objeto mais rígido.

3) Explique por que o código Dart abaixo resulta em um loop infinito:

```dart
int func(int x) {
    return func(x + 1);
}
```

Um método que executa ele mesmo é comumente chamado de função recursiva. Elas são muito úteis em casos específicos, mas seu maior perigo é cair em um loop sem fim, como o caso do exemplo acima o qual não tem um _trigger_ para chegar ao fim, no qual seria uma operação dentro dela que finalizaria sem chamar a si mesma.

4) Por que o conceito de encapsulamento em linguagens com suporte a orientação a objetos é importante para o desenvolvimento de software?

Encapsulamento é um conceito que nos permite compor a API de um objeto, para que somente os items que desejamos sejam acessíveis à um objeto externo, fora de sua implementação. Desta forma, podemos dizer se uma propriedade é para apenas leitura, se podemos alterá-la também (Getters and Setters). Por fim, de forma simples, detalhes de implementação ficam na implementação, e é importante dominar este quesito para expor somente o necessário para quem utilizar o objeto, de forma clara e limpa.

5) Explique, em suas palavras, qual é a diferença entre uma variável e uma constante em uma linguagem de programação?

Uma variável é um ponteiro que pode ser alterado, e, durante a execução, ter N valores diferentes. Uma constante é um ponteiro que, após sua declaração, não pode ser alterado, tendo o mesmo valor durante toda a execução.

6) Explique, em suas palavras, o que é um algoritmo?

Quando penso em algorítmo, me vem na mente um script, uma execução de passos, uma inteligência a qual resolve um determinado problema / executa uma determinada ação.

7) Dado que dois algoritmos `A` e `B` resolvem o mesmo problema `P`, como conseguimos provar matematicamente que um algoritmo é mais eficiente computacionalmente que o outro?

O algorítmo que, com menos passos, chegou no mesmo objetivo. Menos passos significa gastar menos fichas, significa usar menos poder computacional, portanto, um algoritmo mais enchuto, mas com o mesmo poder de chegar ao objetivo desejado, se torna mais eficiente.

8) Explique por que o código dart abaixo não altera os valores das variáveis `X` e `Y`, mesmo depois que `swap` é chamado:

```dart
void swap(int a, int b) {
    int temp = a;
    // temp = 10;
    a = b;
    // temp = 10;
    b = temp;
}

void main() {
    int x = 10;
    int y = 20;

    swap(x, y);

    print('${x == 10} ${y == 20}'); // prints true true
}
```

As variáaveis trabalhadas no exemplo acima são primitivas, ou seja, value-objects. Quando você passa as mesmas, são tratadas pelo seu valor, e não referência. Então altere como quiser dentro da função chamada, não surtirá efeito em sua referência na `main`. Agora, se você passar um objeto qualquer, por exemplo, você passaria a referência, e portanto o valor seria alterado. Neste exemplo, poderia colocar este valor primitivo dentro de uma classe, e assim você lidaria com / passaria a mesma referência.

9) Qual a principal vantagem de uma lista encadeada?

Eu creio que seja o controle da ordem dos items na lista independente de sua alocação. Cada item carrega consigo a referência de seu sucessor.

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

Resposta: Alternativa ficou com Deus, tá faltando estudar grafos por aqui (*troque os underlines pela letra da alternativa.*)