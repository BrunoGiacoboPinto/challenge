# Questões sobre Flutter

1) Explique o que é e para que serve o `BuildContext` passado para os métodos `build` de um
`StatefullWidget` ou `StatelessWidget`?
De forma simples, o `BuildContext` nos permite localizar um widget na árvore, ter acesso aos widgets que estão níveis acima (e buscar seus dados - `InheritedWidget`), e acessar a localização daquele widget em relação à um outro widget parente, ou seu offset "global".

2) Qual a função da árvore de elementos?
A árvore de elementos é uma ponte entre a árvore de widgets e a árvore de objetos de renderização. Portanto, é ela quem faz a optimização que nos permite ter a absurda eficiência do framework, que somente em último caso performa um _re-build_ de um elemento visual. Ela analisa a mudança da API pública e suas configurações (widget) e então performa ou não a atualização visual com base na análise do tipo do widget e sua respectiva `Key` (caso tenha uma).

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

É possível que, daqui 500 milisegundos o widget já não esteja mais ativo (`!mounted`) e portanto você estará alterando o estado de um widget fora já fora da árvore, por exemplo. Por isso a necessidade de sempre checar se o widget está ainda montado após uma operação assíncrona antecendendo um `setState`.

4) É possível passar um `Scaffold` para o parâmetro body de outro `Scaffold`? Quais problemas essa construção poderia causar?

Vamos supor que você queira acessar a API de mensageria que o `Scaffold` fornece, então você fará, por exemplo, `ScaffoldMessenger.of(context).showToast` (pelo que eu me lembre, algo assim). A questão é que, ao buscar na árvore por este tipo, você encontrará o que estiver mais perto, então por essa constatação já podemos assumir que, se um widget tentar mostrar um toast (sendo este mais perto, na árvore, do primeiro `Scaffold`) e outro widget tentar mostrar outro toast ao mesmo tempo (sendo este mais perto, na árvore, do segundo `Scaffold`), ambos mostrarão o `Toast` sem qualquer gerenciamento de fila de exibição que o `Scaffold` possui, já que ambos acessam `Scaffold`s diferentes 🤷🏻‍♂️. Enfim, cada tela deve ter somente um `Scaffold`, sendo este um widget que provê uma "estrutura pai" para a mesma. Você pode ter comportamentos indesejados na aninhação de dois ou mais deste.

5) Explique a função das `keys` que são passada para os construtores dos `Widgets` em Flutter.
As keys são, como o nome já auto-explica, chaves, identificadores que podem opcionalmente serem passadas à um Widget. Qualquer objeto pode ser uma key, entre suas N usabilidades, as mais usuais são:
- Testes, para que você busque um widget pela sua respectiva `Key`;
- `GlobalKey` para guardar e recuperar estados de um `Widget` de qualquer outro pedaço da árvore (bem pesado), geralmente usado para navegação;
- Items de lista de widgets iguais, evitando o bug que acaba exibindo uma lista de widgets de forma incorreta, por conta da otimização que, para rebuildar, compara o tipo e a key (caso não tenha uma key, compara só o tipo, e já que a lista é de vários items geralmente do mesmo tipo, ocorre o bug);
- Coisas mais específicas e internas, como recuperar em qual offset você parou num scroll (esse gerenciamento de scroll view internamente utiliza keys).

6) Explique, em suas palavras, quais são os problemas do pseudo-código abaixo?

O widget contêm uma requisição feita diretamente dentro do método `build`, ao invés de inicializar uma variável `Future` com esta requisição e usar esta variável para performar o layout. Desta forma, como o método `build` pode ser chamado N vezes conforme a árvore for atualizando (`didChangeDependencies`, ou qualquer outro estado alterando, como widgets acima), muito provavelmente terão várias requisições ao invés de somente uma (o que provavelmente foi a intenção da peça entre o teclado e a cadeira).

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
