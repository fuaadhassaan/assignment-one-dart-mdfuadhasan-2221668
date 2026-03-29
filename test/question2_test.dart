import 'dart:math';
import 'package:test/test.dart';

import '../question2.dart' as question2;

void main() {
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
}
