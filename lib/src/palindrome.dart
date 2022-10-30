/// Verificar se uma palavra é ou não palíndromo
///
/// Desafio 2: Preencha a implementação do getter [isPalindrome] da extensão de modo a verificar
/// se a `String` alvo é ou não um palíndromo.
///
/// Sua implementação deverá passar em todos os casos de teste definidos pelo arquivo `test/challenge_test.dart`.
///
/// Considerações:
///
/// - Tente criar uma implementação que privilegie performance do ponto de vista de execução.
///
/// Para mais detalhes sobre o que são palíndromos, leia https://pt.wikipedia.org/wiki/Pal%C3%ADndromo.
///
/// Soluções que violarem as considerações supracitadas serão consideradas incorretas e não pontuarão.
///
extension PalindromeExtension on String {
  bool get isPalindrome {
    // Here we round it to the floor since in an odd-length word the middle
    // letter does not matter when checking a palindrome.
    final halfLettersLength = (length / 2).floor();

    int index = 0;
    while (index <= halfLettersLength) {
      if (this[index] != this[length - index - 1]) return false;
      index++;
    }
    return true;
  }
}
