import 'package:test/test.dart';

import '../question5.dart' as question5;

void main() {
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
//END
