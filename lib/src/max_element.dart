/// Encontrar o maior elemento em uma lista
///
/// Desafio 1: preencha a implementação da função a baixo de modo a encontrar o maior
/// elemento em [data] que esteja entre [start] e [end]. Esses valores devem
/// indicar o primeiro e último índice válido da lista, iniciando em zero.
///
/// Sua implementação deverá passar em todos os casos de teste definidos pelo arquivo `test/challenge_test.dart`.
///
/// Considerações:
///
/// 1) Não é permitido usar nenhuma instrução de iteração da linguagem (ex. while, do/while ou for).
/// 2) Não é permitido utilizar nenhum método da classe `List` que permita iteração (forEach, map, etc)
/// 3) Não é permitido ordenar a lista passada como parâmetro. Nem mesmo ordenar uma cópia desse parâmetro.
/// 4) Não é permitido copiar a lista passada por parâmetro e convertê-la para outro tipo de coleção da linguagem Dart.
///
/// Dica:
///
/// - Use a técnica de construção de algoritmos chamada divisão e conquista para resolver esse problema.
/// - Atente para não acessar posições inválidas dentro da lista
///
/// Soluções que violarem as considerações supracitadas serão consideradas incorretas e não pontuarão.
///
int maxElement(List<int> data, int start, int end) {
  // 0 , 1 => start = 0 , end = 1
  //? 1. se o tamanho do data for 1, i.e start = end => então o valor que corresponte ao end ou ao start é o valor máximo.
  //? 2. se o tamanho do data for 2, i.e start + 1 = end => como a lista só tem dois valores tem que compara-los
  //? 3. Se o tamanho do data for maior que dois => divide and conquer
  //? 3.1 Encontrar o meio da lista
  //? 3.2 Calcular o max de cada metade da lista e comparar os resultados
  if (start < 0 || end < 0) throw ArgumentError('O parametro start deve ser maior que zero');
  if (end > data.length - 1) throw ArgumentError('O parametro end deve ser menor que ${data.length}');
  if (data.isEmpty) throw ArgumentError('A lista data não pode ser vazia');

  if (start == end) {
    return data[start];
  } else if (start + 1 == end) {
    final startValue = data[start];
    final endValue = data[end];
    if (startValue > endValue) {
      return startValue;
    } else {
      return endValue;
    }
  } else {
    final middle = ((start + end) / 2).round();
    print(middle);
    final left = maxElement(data, start, middle);
    final right = maxElement(data, end, middle);
    if (left > right) {
      return left;
    } else {
      return right;
    }
  }
}
