# Questões sobre Flutter

1) Explique o que é e para que serve o `BuildContext` passado para os métodos `build` de um
`StatefullWidget` ou `StatelessWidget`?

O BuildContext é uma interface dos objetos Elements. Ele é utilizado como interface para nos
impedir de acessar os elements diretamente. Ele é responsavel por localizar os widgets na arvore
entre outras coisas, como interagir com o RenderObject se eu nao me engano.

2) Qual a função da árvore de elementos?

A arvore de elementos é responsavel por armazenar algumas configuracoes do widget, a posição deles e a logica da ui.
Essa arvore é construida e reconstruida de acordo com a arvore de widgets. Para cada widget criado, existe um element correspondente.
Uma coisa interessante sobre os elements, é que eles são mutáveis, ao contrário dos widgets que são imutaveis. i.e as propriedades
de um element podem mudar sem a necessidade de construir um novo objeto element.

3) Diga em qual situação o seguinte código pode incorre em um erro, explique o porquê:

Bom, eu acho que esse código vai executar sem problemas devido o callBack Usando um future com delay
em conjunto com o setState pq provavelmente o widget ja estará mounted. Mas porem contudo entretanto
todavia, eu sei que se não existisse esse callBack, e o setState fosse usado diretamente no initState
causaria um crash porque estariamos mudando um stado sendo que o widget pode nem estar construido e inserido
na arvore ainda. Por isso, se for necessario utilizar algo que altere o estado de um widget no initState, 
devemos verificar se o widget ja esta "montado"


```dart
class ProblematicWidget extends StatefulWidget {
  const ProblematicWidget({Key? key}) : super(key: key);

  @override
  State<ProblematicWidget> createState() => _ProblematicWidgetState();
}

class _ProblematicWidgetState extends State<ProblematicWidget> {
  int value = 0;

  @override
  void initState() {
    super.initState();

    Future<void>.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        value += 313;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('$value'),
    );
  }
}
```

4) É possível passar um `Scaffold` para o parâmetro body de outro `Scaffold`? Quais problemas essa construção poderia causar?

Poder até pode, mas não é recomendado pq o scaffold foi feito para ser um widget de nivel superior. Geralmente o pessoal tenta utilizar
desse feito não recomendado para fazer algo semelhante as tabs, ou page view, mas não é recomendado nem necessario. Agora o problema em si, 
eu não sei, imagino que seja problemas com navegação.

5) Explique a função das `keys` que são passada para os construtores dos `Widgets` em Flutter.

As keys sao usadas quando precisamos identificar exclusivamente um widget. Alem disso, o seu uso tbm ajuda
a preservar o estado de widgets statefull enquanto eles sao substituidos por outros ou movidos na arvore. 

6) Explique, em suas palavras, quais são os problemas do pseudo-código abaixo?

Pra mim o problema é no tratamento do snapShot. Do jeito que está implementado não temos um tratamento que indique
o estado em que o dado está, como por exemplo se está em loading ou se ocorreu um erro, ou ainda se existe algum dado 
mesmo que a chamada a api tenha acontecido com sucesso. Alem disso eu tambem faria a chamada a apiCall no initState, 
armazenando o future em uma variavel, e passando esta para o futureBuilder.


```dart
class NetworkService {
  Future<String> apiCall() async {
    // ..
  }
}

class ProblematicWidget extends StatefulWidget {
  const ProblematicWidget({Key? key}) : super(key: key);

  @override
  State<ProblematicWidget> createState() => _ProblematicWidgetState();
}

class _ProblematicWidgetState extends State<ProblematicWidget> {
  final service = NetworkService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: service.apiCall(),
      builder: (context, AsyncSnapshot<String> snapshot) {
        return Text(snapshot.data ?? '');
      },
    );
  }
}
```
