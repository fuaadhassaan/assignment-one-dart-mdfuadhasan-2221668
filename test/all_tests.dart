import 'dart:math';
import 'package:test/test.dart';

import '../question1.dart' as question1;
import '../question2.dart' as question2;
import '../question3.dart' as question3;
import '../question4.dart' as question4;
import '../question5.dart' as question5;

void main() {
  test('question1: calculateBMI and getGrade', () {
    expect(question1.calculateBMI(22.5, 1.5).toStringAsFixed(2), '10.00');
    expect(question1.calculateBMI(75, 1.75).toStringAsFixed(2), '24.49');
    expect(question1.getGrade(95), 'A');
    expect(question1.getGrade(82), 'B');
    expect(question1.getGrade(72), 'C');
    expect(question1.getGrade(65), 'D');
    expect(question1.getGrade(50), 'F');
  });

  test('question2: deterministic score helpers', () {
    final names = ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'];
    final scores = question2.assignStudentScores(names, random: Random(1));
    expect(scores.length, 5);
    final highest = question2.findHighestScore(scores);
    final lowest = question2.findLowestScore(scores);
    expect(highest.key, 'Diana');
    expect(highest.value, 86);
    expect(lowest.key, 'Bob');
    expect(lowest.value, 63);
    expect(question2.calculateAverageScore(scores), 75.0);
    expect(question2.categorizeScore(95), 'Excellent');
    expect(question2.categorizeScore(88), 'Good');
    expect(question2.categorizeScore(75), 'Average');
    expect(question2.categorizeScore(60), 'Needs Improvement');
  });

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

  test('question4: vehicle inheritance', () {
    final car = question4.Car('Toyota', 'Camry', DateTime.now().year - 2, 4);
    expect(car.calculateAge(), 2);
    final moto = question4.Motorcycle(
      'Honda',
      'CBR',
      DateTime.now().year - 3,
      true,
    );
    expect(moto.calculateAge(), 3);
    expect(car.numberOfDoors, 4);
    expect(moto.hasWindshield, true);
  });

  test('question5: payable and reportable', () {
    final manager = question5.Manager('John', 'M001', 'IT', 5);
    expect(manager.getJobTitle(), 'Manager');
    expect(manager.getBaseSalary(), 8000.0);
    final managerSalary = manager.calculateSalary(
      manager.getBaseSalary(),
      1000.0,
    );
    expect(managerSalary, 9000.0);

    final developer = question5.Developer('Alice', 'D001', 'IT', 'Dart');
    expect(developer.getJobTitle(), 'Senior Developer');
    expect(developer.getBaseSalary(), 6000.0);
    final devSalary = developer.calculateSalary(
      developer.getBaseSalary(),
      500.0,
    );
    expect(devSalary, 6500.0);
  });
}
