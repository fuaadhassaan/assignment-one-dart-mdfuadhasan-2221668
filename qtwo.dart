// Question 2: Collections & Control Flow (Difficulty: 2/5) ⭐⭐
/**
 * EXPECTED OUTPUT:
 * Student Scores: {Alice: <random>, Bob: <random>, ...}
 * Highest Score: <Name> with <Score>
 * Lowest Score: <Name> with <Score>
 * Average Score: <Value>
 * Alice: <Score> (Category)
 * ...
 */

import 'dart:math';

Map<String, int> assignStudentScores(
  List<String> studentNames, {
  Random? random,
}) {
  final rng = random ?? Random();
  final studentScores = <String, int>{};
  for (final student in studentNames) {
    studentScores[student] = 60 + rng.nextInt(41);
  }
  return studentScores;
}

MapEntry<String, int> findHighestScore(Map<String, int> studentScores) {
  var highestStudent = '';
  var highestScore = -1;
  studentScores.forEach((student, score) {
    if (score > highestScore) {
      highestScore = score;
      highestStudent = student;
    }
  });
  return MapEntry(highestStudent, highestScore);
}

MapEntry<String, int> findLowestScore(Map<String, int> studentScores) {
  var lowestStudent = '';
  var lowestScore = 1000;
  studentScores.forEach((student, score) {
    if (score < lowestScore) {
      lowestScore = score;
      lowestStudent = student;
    }
  });
  return MapEntry(lowestStudent, lowestScore);
}

double calculateAverageScore(Map<String, int> studentScores) {
  if (studentScores.isEmpty) return 0;
  final total = studentScores.values.reduce((a, b) => a + b);
  return total / studentScores.length;
}

String categorizeScore(int score) {
  switch (score ~/ 10) {
    case 10:
    case 9:
      return 'Excellent';
    case 8:
      return 'Good';
    case 7:
      return 'Average';
    default:
      return 'Needs Improvement';
  }
}

void main() {
  // 1. Create a List<String> of student names: ["Alice", "Bob", "Charlie", "Diana", "Eve"]
  // TODO: Create the student names list
  List<String> studentNames = ["Alice", "Bob", "Charlie", "Diana", "Eve"];

  // 2. Create a Map<String, int> to store student scores
  final studentScores = assignStudentScores(studentNames, random: Random(1));

  // 4. Find and display:
  //    - The student with the highest score
  //    - The student with the lowest score
  //    - The average score of all students
  final highest = findHighestScore(studentScores);
  final lowest = findLowestScore(studentScores);
  final averageScore = calculateAverageScore(studentScores);

  print('Student Scores: $studentScores');
  print('Highest Score: ${highest.key} with ${highest.value}');
  print('Lowest Score: ${lowest.key} with ${lowest.value}');
  print('Average Score: ${averageScore.toStringAsFixed(2)}');

  // 5. Use a switch statement to categorize students:
  //    - 90-100: "Excellent"
  //    - 80-89: "Good"
  //    - 70-79: "Average"
  //    - Below 70: "Needs Improvement"
  // TODO: Implement the switch statement for each student
  for (final student in studentNames) {
    final score = studentScores[student] ?? 0;
    final category = categorizeScore(score);
    print('$student: $score ($category)');
  }
}
