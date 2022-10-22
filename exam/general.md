# Questões gerais de programação e computação

1) Explique, em suas palavras, o que é o conceito de classe em uma linguagem orientada a objetos?

Uma classe nada mais é do que um modelo para a criação de um objeto (uma estrutura de dados) que possui
dados iniciais para o estado desse objeto (atributos da classe) e que implementa comportamentos (os métodos).
Por exemplo, uma classe Car que representa um carro. O carro possui atributos como cor, quantidade de portas, km rodados, etc.
E possui métodos que ditam o seu comportamento, como andar, buzinar, ligar o alarme.

2) Explique, em suas palavras, o que é um objeto imutável, suas vantagens e desvantagens?

Um objeto imutavel como o próprio nome diz, não pode ter seu estado alterado depois que for instanciado. Existem muitas vantagens
ao escolher usar um objeto imutavel, como por exemplo para threads e multhreads pq vc tem a ctz que nenhum código vai alterar o seu objeto.
Tbm podemos passar essa referencia sem preocupar em copiar e armazerar esse objeto para evitar que os dados sejam alterados inesperadamente.
A unica desvantagem que eu me lembro de usar objetos imutaveis é que sempre que precisamos alterar esse objeto por algum motivo, nos devemos criar 
um novo objeto, e isso pode causar um garbage collector mais frequente. No flutter, uma vantagem de construir widgets imutaveis é justamente manter
o seu estado e não precisar criar novos widgets. 

3) Explique por que o código Dart abaixo resulta em um loop infinito:

Uma função recursiva precisa de uma condição de parada, assim como um while ou do while. 
Como ela não possui uma condição de parada ela resultará em loop infinito.

```dart
int func(int x) {
    return func(x + 1);
}
```

4) Por que o conceito de encapsulamento em linguagens com suporte a orientação a objetos é importante para o desenvolvimento de software?

O encapsulamento é um dos conceitos que tenta evitar os dev de fazer merda. Ele é usado para encapsular ou "esconder" valores ou estados
de uma Classe, impedindo o acesso direto desses items que não foram autorizados. Geralmente, se quisermos deixar alguma coisa acessivel, 
seria através de gettes e setters. Qualquer lugar que quiser recuperar ou acessar esses valores que são encapsulados por essa classe, devem 
faze-los atraves dos getter e setters.


5) Explique, em suas palavras, qual é a diferença entre uma variável e uma constante em uma linguagem de programação?

Uma constante é um valor fixo, por ex pi = 3.14 que não vai mudar em tempo de compilação. Ja uma variavel fornece um local especifico 
na memoria para armazenar um valor que será usado no programa. A variavel ao contrario da constante, pode ter seu valor alterado em tempo de execução.


6) Explique, em suas palavras, o que é um algoritmo?
Um algoritmo nada mais é do que um conjunto de instruçoes para realizar determinada tarefa. Essas instruçoes não devem ser ambiguas, 
e para cada entrada há uma sequencia finita de operacoes que terminam com uma saida correspondente. 

7) Dado que dois algoritmos `A` e `B` resolvem o mesmo problema `P`, como conseguimos provar matematicamente que um algoritmo é mais eficiente computacionalmente que o outro?
Conseguimos provar matematicamente atraves da analise assintotica, pegando os maiores expoentes e assim comparando-os utilizando a notação Big O, teta ou omega.

8) Explique por que o código dart abaixo não altera os valores das variáveis `X` e `Y`, mesmo depois que `swap` é chamado:

Eu imagino que seja devido ao escopo. Por exemplo, o print pega a variavel x e y dentro do escopo da main, e estamos alterando o seu valor em outro escopo,
dentro da função swap. 

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

9) Qual a principal vantagem de uma lista encadeada?
A maior vantagem de escolher uma lista encadeada ao inves e uma lista sequencial por exemplo é o ganho em performance
nas operacoes de adicionar ou remover elementos dessa lista. Em uma lista sequencial contigua (i.e ocupa espaços seguidos na memoria)
quando queremos adicionar um novo elemento precisamos nos preocupar se o tamanho da lista cabe naquele espaço de memória, se não é necessario alocar
esses dados em outro espaço o que leva tempo e pouco performatico. Já com listas encadeadas, não existe essa obrigatoriedade dos elementos dessa lista
estarem em forma contigua, eles podem estar espalhados na memória, e serem localizados atraves da referencia do nó. Então para adicionar ou remover um elemento, 
basta alterar a referencia do nó, e pronto. easy. Esse tipo de dado é recomendado para listas muito longas onde acontece uma perda consideravel de performance.

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

Resposta: Alternativa ___ (*troque os underlines pela letra da alternativa.*)