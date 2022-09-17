import 'package:challange/challange.dart';
import 'package:test/test.dart';

void main() {
  group('maxElement', () {
    test('should find the maximum element of a given list of integers', () {
      expect(maxElement([-1, -2, -3, -4, -5, -6], 0, 5), -1);
      expect(maxElement([1, 2, 3, 4, 5, 6], 0, 5), 6);
      expect(maxElement([1, 1, 1, 1, 2], 0, 4), 2);
      expect(maxElement([1, 1, 1, 1], 0, 3), 1);
      expect(maxElement([99, 12], 0, 1), 99);
      expect(maxElement([313], 0, 0), 313);
    });

    test('should handle input correctly', () {
      expect(() => maxElement([1, 2, 3, 4], 0, 6), throwsArgumentError);
      expect(() => maxElement([1, 2, 3], -1, 2), throwsArgumentError);
      expect(() => maxElement([1, 2, 3], 0, -2), throwsArgumentError);
      expect(() => maxElement([1, 2, 3], 5, 1), throwsArgumentError);
      expect(() => maxElement([], 0, 0), throwsArgumentError);
    });
  });

  group('isPalindrome', () {
    test('should detect palindrome strings correctly', () {
      expect('🎉🎉🎉🎉'.isPalindrome, isFalse);
      expect('llloll'.isPalindrome, isFalse);
      expect('eii'.isPalindrome, isFalse);
      expect('ai'.isPalindrome, isFalse);
      expect('oii'.isPalindrome, isFalse);

      expect('eeaee'.isPalindrome, isTrue);
      expect('lol'.isPalindrome, isTrue);
      expect('a'.isPalindrome, isTrue);
    });
  });
}
