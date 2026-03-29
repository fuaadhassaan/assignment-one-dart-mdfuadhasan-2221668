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

Map<String, int> assignStudentScores(List<String> studentNames, {Random? random}) {
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
  // TODO: Create the scores map
  Map<String, int> studentScores = {};

  // 3. Use a for loop to assign random scores (60-100) to each student
  // TODO: Implement the for loop to assign random scores
  Random random= Random();
  for (String student in studentNames) {
    studentScores[student]= 60+ random.nextInt(41);
  }

  // 4. Find and display:
  //    - The student with the highest score
  //    - The student with the lowest score
  //    - The average score of all students
  // TODO: Implement the logic to find highest, lowest, and average scores
  String highestStudent = "";
  int highestScore = 0;
  String lowestStudent = "";
  int lowestScore = 100;
  double total = 0.0;

  // TODO: Add your logic here

studentScores.forEach((student, score) {
    if (score > highestScore){
      highestScore= score;
      highestStudent= student;
    }

    if (score > lowestScore){
      lowestScore= score;
      lowestStudent= student;
    }
    total+= score;
  });

  double averageScore= total/ studentScores.length;

  print("Student Scores: $studentScores");
  print("Highest Score: $highestStudent with $highestScore");
  print("Lowest Score: $lowestStudent with $lowestScore");
  print("Average Score: ${averageScore.toStringAsFixed(2)}");

  // 5. Use a switch statement to categorize students:
  //    - 90-100: "Excellent"
  //    - 80-89: "Good"
  //    - 70-79: "Average"
  //    - Below 70: "Needs Improvement"
  // TODO: Implement the switch statement for each student
  for (String student in studentNames) {
    int score = studentScores[student] ?? 0;
    String category = "";

    // TODO: Add your switch statement here
    switch (score ~/10) {
      case 10:
      case 9:
        category= "Excellent";
        break;
      case 8:
        category= "Good";
        break;
      case 7:
        category= "Average";
        break;
      default:
        category= "Needs Improvement";
    }

    print("$student: $score ($category)");
  }
}
