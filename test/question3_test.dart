import 'package:test/test.dart';

import '../question3.dart' as question3;

void main() {
  test('question3: bank account operations', () {
    final acc = question3.BankAccount('1', 'Tester', 'Checking');
    expect(acc.getBalance(), 0.0);
    acc.deposit(100.0);
    expect(acc.getBalance(), 100.0);
    acc.withdraw(40.0);
    expect(acc.getBalance(), 60.0);
    acc.withdraw(50.0);
    expect(acc.getBalance(), 10.0);
  });
}
