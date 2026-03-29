import 'package:test/test.dart';

import '../question4.dart' as question4;

void main() {
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
}
