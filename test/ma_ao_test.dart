import 'dart:math';
import 'package:test/test.dart';

import '../qone.dart' as qone;
import '../qtwo.dart' as qtwo;
import '../qthree.dart' as qthree;
import '../qfour.dart' as qfour;
import '../qfive.dart' as qfive;

void main() {
  test('qone: calculateBMI and getGrade', () {
    expect(qone.calculateBMI(22.5, 1.5).toStringAsFixed(2), '10.00');
    expect(qone.calculateBMI(75, 1.75).toStringAsFixed(2), '24.49');
    expect(qone.getGrade(95), 'A');
    expect(qone.getGrade(82), 'B');
    expect(qone.getGrade(72), 'C');
    expect(qone.getGrade(65), 'D');
    expect(qone.getGrade(50), 'F');
  });

  test('qtwo: deterministic score helpers', () {
    final names = ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'];
    final scores = qtwo.assignStudentScores(names, random: Random(1));
    expect(scores.length, 5);
    final highest = qtwo.findHighestScore(scores);
    final lowest = qtwo.findLowestScore(scores);
    expect(highest.key, 'Diana');
    expect(highest.value, 86);
    expect(lowest.key, 'Bob');
    expect(lowest.value, 63);
    expect(qtwo.calculateAverageScore(scores), 75.0);
    expect(qtwo.categorizeScore(95), 'Excellent');
    expect(qtwo.categorizeScore(88), 'Good');
    expect(qtwo.categorizeScore(75), 'Average');
    expect(qtwo.categorizeScore(60), 'Needs Improvement');
  });

  test('qthree: bank account operations', () {
    final acc = qthree.BankAccount('1', 'Tester', 'Checking');
    expect(acc.getBalance(), 0.0);
    acc.deposit(100.0);
    expect(acc.getBalance(), 100.0);
    acc.withdraw(40.0);
    expect(acc.getBalance(), 60.0);
    acc.withdraw(50.0); // within funds; no “insufficient funds” print
    expect(acc.getBalance(), 10.0);
  });

  test('qfour: vehicle inheritance', () {
    final car = qfour.Car('Toyota', 'Camry', DateTime.now().year - 2, 4);
    expect(car.calculateAge(), 2);
    final moto = qfour.Motorcycle(
      'Honda',
      'CBR',
      DateTime.now().year - 3,
      true,
    );
    expect(moto.calculateAge(), 3);
    expect(car.numberOfDoors, 4);
    expect(moto.hasWindshield, true);
  });

  test('qfive: payable and reportable', () {
    final manager = qfive.Manager('John', 'M001', 'IT', 5);
    expect(manager.getJobTitle(), 'Manager');
    expect(manager.getBaseSalary(), 8000.0);
    final managerSalary = manager.calculateSalary(
      manager.getBaseSalary(),
      1000.0,
    );
    expect(managerSalary, 9000.0);

    final developer = qfive.Developer('Alice', 'D001', 'IT', 'Dart');
    expect(developer.getJobTitle(), 'Senior Developer');
    expect(developer.getBaseSalary(), 6000.0);
    final devSalary = developer.calculateSalary(
      developer.getBaseSalary(),
      500.0,
    );
    expect(devSalary, 6500.0);
  });
}
