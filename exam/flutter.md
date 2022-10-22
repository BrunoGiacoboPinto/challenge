# Questões sobre Flutter

1) Explique o que é e para que serve o `BuildContext` passado para os métodos `build` de um
`StatefullWidget` ou `StatelessWidget`?

R: O BuildContext é o objeto de acesso às outras árvores de componentes geradas pelo Flutter, e 
consequentemente acesso a outros Widgets já presentes na árvore. Seu uso mais comum é
para naveção entre telas e outros componentes renderizados entre telas (ex: Navigator.of(context).pop()),
mas também bastante utilizado para compartilhar temas e outras definições entre "pais e filhos" (É através
do BuildContext que um componente consegue decidir o quanto de espaço pode e deve ocupar em tela).

2) Qual a função da árvore de elementos?

R: Organizar e identificar os elementos da árvore de Widgets para que seja otimizada sua renderização, 
assim como elaborar uma hierarquia de construção de componentes de "pai para filho", 
permitindo reaproveitamento de componentes durante reconstrução de tela e 
acesso simplificado a outros elementos das outras árvores.

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

R: Um setState está sendo chamado 500 milisegundos após o initState, o que pode acarretar no 
erro de rebuild durante o processo de build, conflitando o processo de construção do Widget.

4) É possível passar um `Scaffold` para o parâmetro body de outro `Scaffold`? Quais problemas essa construção poderia causar?

R: Sim, é possível. Scaffolds possuem uma responsabilidade em relação a Snackbars, Drawers e outros 
componentes relacionados a navegação. Com a presença de dois Scaffolds no mesmo context, caso 
o usuário tente dar um pop ou usar o backButton, haverá disputa pelo evento,
causando comportamentos indesejados.

5) Explique a função das `keys` que são passada para os construtores dos `Widgets` em Flutter.

R: A priori, as keys servem para que, durante a reconstrução de um Widget, ele seja devidamente 
reconhecido pela árvore de elementos e então possa ser reaproveitado caso o Widget carregue 
estado (State). Contudo, a real funcionalidade das keys é tornar o componente "único" e
consequentemente reconhecível pela árvore de elementos.

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

R: Para cada build que o ProblematicWidget passe, a função apiCall será chamada novamente, ou seja, 
haverá chamadas excessivas/desnecessárias na API em questão, afetando rede e consumo de dados do 
usuário. Como vários eventos podem acarretar num build, acredito que o principal problema 
se encontre aqui. Mas também posso pontuar o fato do NetworkService estar sendo instanciado dentro 
do State do Widget, o que representa um desperdício de memória para o dispositivo, uma vez que um 
objeto NetworkService será instanciado toda vez que o Widget for construído.
