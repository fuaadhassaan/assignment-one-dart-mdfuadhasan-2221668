import 'package:test/test.dart';

import '../question1.dart' as question1;

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
}
//END
