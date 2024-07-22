import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizStartScreen(),
    );
  }
}

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  // Simulasi jawaban kuis
  final List<Map<String, dynamic>> quizResults = const [
    {'question': 'Question 1', 'answer': 'Correct Answer', 'isCorrect': true},
    {'question': 'Question 2', 'answer': 'Wrong Answer', 'isCorrect': false},
    // Tambahkan lebih banyak jawaban jika diperlukan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: quizResults.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          quizResults[index]['question'],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          quizResults[index]['answer'],
                          style: TextStyle(
                            fontSize: 16,
                            color: quizResults[index]['isCorrect']
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Logika untuk me-restart kuis
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizStartScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuizStartScreen extends StatelessWidget {
  const QuizStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Start'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Mulai kuis
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuizResultScreen()),
            );
          },
          child: const Text('Start Quiz'),
        ),
      ),
    );
  }
}
