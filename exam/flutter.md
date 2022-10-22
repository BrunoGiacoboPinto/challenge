# Questões sobre Flutter

1) Explique o que é e para que serve o `BuildContext` passado para os métodos `build` de um
`StatefullWidget` ou `StatelessWidget`?
  BuildContext é o conjunto de informações cruciais para se passar para um widget, para que se garanta a integridade da árvore de widgets, que precisa possuir as referências e hierarquias bem definidas.

2) Qual a função da árvore de elementos?
  Árvore de elementos serve para intermediar a comunicação entre a árvore de renderização e a árvore de widgets sempre que a alteração visual dos componentes é requisitada, pois a árvore de elementos consiga discernir componentes que podem sofrer alterações visuais (RenderObjectComponent) ou que simplesmente encapsulam outros. 

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
Está sendo feita uma chamada assíncrona no initState, dito isso, por definição, o initState gerenciará um estado no primeiro frame de renderização do respectivo widget, portanto, uma chamada assíncrona que, por definição, exige a espera para a execução processual do código seria incoerente e geraria problemas, o correto seria fazer a chamada do WidgetBindingPostFrameCallback(), como o próprio nome diz, consegue efetuar chamadas e alterações após o frame inicial do initState.


4) É possível passar um `Scaffold` para o parâmetro body de outro `Scaffold`? Quais problemas essa construção poderia causar?
Scaffold é um InheritedWidget, então, sim, é uma implementação possível mas que não faz sentido pelo fato de que, por definição um InheritedWidget é usado para conseguir ter suas informações (contexto) acessadas em qualquer nível hierarquico que o SUCEDE, então ter um Scaffold como filho direto de outro não faz sentido. 

5) Explique a função das `keys` que são passada para os construtores dos `Widgets` em Flutter.
Key é um importante identificador de um widget que possui estados, pois a element tree pode sofrer dificuldades em referenciar e discernir widgets com estados, e, portanto, uma alteração na renderização requisitada em código pode não ser efetuada pois a element tree pode considerar os widgets como iguais, ja que, a principio, ela vai identificá-los pelo tipo ao chamar a árvore de renderização.

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
Este Widget não possui gerenciamento de estado e está extendendo um Stateful, o retorno de apiCall() é declaradamente uma String, logo, não faz sentido tratar o nulo a partir do retorno de uma função que nem é nulável, e também não vejo o porquê criar uma classe que será instanciada pra executar um único método, semanticamente não seria problemático declará-lo dentro do próprio Widget.
