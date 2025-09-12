import 'package:flutter/material.dart';

class QuizzesPage extends StatefulWidget {
  const QuizzesPage({super.key});

  @override
  State<QuizzesPage> createState() => _QuizzesPageState();
}

class _QuizzesPageState extends State<QuizzesPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool answered = false;
  String selectedOption = "";

  final List<Map<String, Object>> questions = [
    {
      "question": "What is One in japanese?",
      "options": ["ruko", "ichi", "san", "sebun"],
      "answer": "ichi"
    },
    {
      "question": "What is Grandmother in japanese?",
      "options": ["ojisan", "ane", "sobo", "shi"],
      "answer": "sobo"
    },
    {
      "question": "what is Red in japanese ?",
      "options": ["akai", "kuroi", "oi kiiro", "haiiro"],
      "answer": "akai"
    },
  ];

  void checkAnswer(String option) {
    if (!answered) {
      setState(() {
        selectedOption = option;
        answered = true;
        if (option == questions[currentQuestionIndex]["answer"].toString()) {
          score++;
        }
      });
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        answered = false;
        selectedOption = "";
      });
    } else {
      // Quiz Finished
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Quiz Finished 🎉"),
          content: Text("Your score is $score / ${questions.length}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  currentQuestionIndex = 0;
                  score = 0;
                  answered = false;
                  selectedOption = "";
                });
              },
              child: const Text("Restart"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    var options = currentQuestion["options"] as List<String>;
    var correctAnswer = currentQuestion["answer"].toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quizzes"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Question ${currentQuestionIndex + 1}/${questions.length}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Text(
              currentQuestion["question"].toString(),
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            ...options.map((option) {
              Color optionColor = Colors.white;
              if (answered) {
                if (option == correctAnswer) {
                  optionColor = Colors.green.shade200;
                } else if (option == selectedOption) {
                  optionColor = Colors.red.shade200;
                }
              }

              return GestureDetector(
                onTap: () => checkAnswer(option),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: optionColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Text(
                    option,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              );
            }),

            const Spacer(),
            ElevatedButton(
              onPressed: answered ? nextQuestion : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                currentQuestionIndex == questions.length - 1
                    ? "Finish Quiz"
                    : "Next Question",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
