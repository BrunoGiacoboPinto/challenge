import 'dart:math';

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
  if (start == end) {
    return data[end];
  }

  int calculateMax(int maxValue, int nextIndex) {
    final value = max<int>(maxValue, data[nextIndex]);

    if (nextIndex == end) {
      return value;
    } else {
      return calculateMax(value, nextIndex + 1);
    }
  }

  return calculateMax(data[start], start + 1);
}
