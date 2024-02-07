import 'package:flutter/material.dart';


void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0; // เพิ่มตัวแปรเก็บคะแนน

  List<Map<String, dynamic>> questions = [
    {
      "question": "1. เครื่องบินลำแรกของโลกที่ขึ้นบินได้สำเร็จหลังจากพยายามคิดค้น ทำสำเร็จเมื่อวันที่เท่าไร?",
      "options": ["21 ธันวาคม 1902", "10 พฤศจิกายน 1899", "28 สิงหาคม 1900", "17 ธันวาคม 1903"],
      "correctAnswer": 3
    },
    {
      "question": "2. คนคิดค้นเครื่องบินลำแรกของโลก คือใคร?",
      "options": ["ออวิลล์ และ วิลเบอร์ ไรต์", "อัลเบิร์ต ไอน์สไตน์", "อัลเฟรด โนเบล", "เซอร์ ทิม เบอร์เนอร์ส-ลี"],
      "correctAnswer": 0
    },
    {
      "question": "3. เครื่องบินลำแรกมีชื่อว่าอะไร?",
      "options": ["ฟลาย", "ฟลายเยอร์", "ฟลายเออร์", "บัตเตอร์ฟลาย"],
      "correctAnswer": 2
    },
    {
      "question": "4. เครื่องบินลำแรกสามารถบินในอากาศได้นานกี่นาที?",
      "options": ["5 นาที", "20 นาที", "12 นาที", "13 นาที"],
      "correctAnswer": 2
    },
    {
      "question": "5. เครื่องบินลำแรกสามารถบินได้ระยะทางรวมกี่ฟุตในครั้งแรก?",
      "options": ["100 ฟุต", "90 ฟุต", "150 ฟุต", "120 ฟุต"],
      "correctAnswer": 3
    },
    {
      "question": "6. เครื่องบินลำแรกได้ถูกทำการทดสอบขึ้นไปกี่ครั้ง เพิ่มจากรอบแรก?",
      "options": ["1 ครั้ง", "3 ครั้ง", "2 ครั้ง", "ไม่ได้ทำการทดสอบเพิ่ม"],
      "correctAnswer": 1
    },
    {
      "question": "7. เครื่องบินโดยสาร แบ่งเป็นกี่ประเภท?",
      "options": ["3 ประเภท", "5 ประเภท", "2 ประเภท", "4 ประเภท"],
      "correctAnswer": 0
    },
    {
      "question": "8. เครื่องบินโดยสารที่ใช้โดยสารคนข้ามประเทศเรียกว่าอะไร?",
      "options": ["เครื่องบินโดยสารทางอากาศ", "เครื่องบินโดยสารไอพ่น", "เครื่องบินโดยสารใบพัด", "เครื่องบินโดยสารความเร็วเหนือเสียง"],
      "correctAnswer": 1
    },
    {
      "question": "9. สายการบินที่บินตามกำหนดการของประเทศไทยในปัจจุบันมีทั้งหมดกี่สายการบิน?",
      "options": ["10 สายการบิน", "5 สายการบิน", "7 สายการบิน", "8 สายการบิน"],
      "correctAnswer": 3
    },
    {
      "question": "10. สายการบินที่มีคำขวัญว่า รักคุณเท่าฟ้า เป็นของสายการบินใด?",
      "options": ["การบินไทยสมายล์", "ไทยไลอ้อนแอร์", "การบินไทย", "ไทยเวียดเจ็ทแอร์"],
      "correctAnswer": 2
    },
    // เพิ่มคำถามต่อไปตามต้องการ
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex]["question"],
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ...(questions[currentQuestionIndex]["options"] as List<String>).map((option) {
              return ElevatedButton(
                onPressed: () {
                  checkAnswer(option);
                },
                child: Text(option),
              );
            }).toList(),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: nextQuestion,
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

 void checkAnswer(String selectedOption) {
  int correctAnswerIndex = questions[currentQuestionIndex]["correctAnswer"];
  if (selectedOption == questions[currentQuestionIndex]["options"][correctAnswerIndex]) {
    setState(() {
      correctAnswers++; // เพิ่มคะแนนเมื่อตอบถูก
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ถูกต้อง!'),
          content: Text('คําตอบของคุณถูกต้อง.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                goToNextQuestion();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ไม่ถูกต้อง!'),
          content: Text('คําตอบของคุณไม่ถูกต้อง.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                goToNextQuestion(); // ไปยังคำถามถัดไปโดยไม่เพิ่มคะแนน
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}


  void goToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('จบแบบทดสอบ'),
              content: Text('คุณทําแบบทดสอบเสร็จแล้ว คะแนนของคุณ: $correctAnswers/10'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('End of Quiz'),
              content: Text('You have finished the quiz. Your score: $correctAnswers/10'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }
}