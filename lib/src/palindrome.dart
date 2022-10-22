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
    // Eu primeiro fiz essa solução... deu certo? Deu. Mas acho que não é tao performático.
    // O split eu fui olhar a implementação e ele usa um trem que eu nao faço a minima ideia do que é
    // usando uma lib do JS. O reversed inverte a lista, que eu imagino que não deva ser um processo
    // barato, e o join faz o uso do while.. Então decidi tentar outra abordagem.
    String reverse = split('').reversed.join('');
    if (reverse == this) {
      return true;
    } else {
      return false;
    }
  }
}
