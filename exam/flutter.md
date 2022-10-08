# Questões sobre Flutter

1) Explique o que é e para que serve o `BuildContext` passado para os métodos `build` de um
`StatefullWidget` ou `StatelessWidget`?

2) Qual a função da árvore de elementos?

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

4) É possível passar um `Scaffold` para o parâmetro body de outro `Scaffold`? Quais problemas essa construção poderia causar?

5) Explique a função das `keys` que são passada para os construtores dos `Widgets` em Flutter.

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
