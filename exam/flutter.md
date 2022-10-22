# Questões sobre Flutter

1) Explique o que é e para que serve o `BuildContext` passado para os métodos `build` de um
`StatefullWidget` ou `StatelessWidget`?

O BuildContext é o que "conecta" todos os widgets da árvore de widgets, através do contexto que sabemos onde cada widget se encontra

2) Qual a função da árvore de elementos?

A árvore de elementos organiza os elementos, garantindo que a hieraquia pai e filho seja respeitada, é ela que forma a hierarquia que vemos na tela

3) Diga em qual situação o seguinte código pode incorre em um erro, explique o porquê:

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

Como o init state tem um delayed, pode quebrar a aplicação antes dela buildar na tela, visto que o init state nao deveria ser assincrono

4) É possível passar um `Scaffold` para o parâmetro body de outro `Scaffold`? Quais problemas essa construção poderia causar?

É possível, mas nao é recomendado, isso porque pode gerar uma confusão de hierarquia e de elementos que deveriam ser únicos com mais de uma atribuição

5) Explique a função das `keys` que são passada para os construtores dos `Widgets` em Flutter.

As keys passadas para os construtores dos widgets, servem para identificá-los

6) Explique, em suas palavras, quais são os problemas do pseudo-código abaixo?

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
como não temos um await, o programa não irá esperar a chamada da api, gerando assim erro na aplicação