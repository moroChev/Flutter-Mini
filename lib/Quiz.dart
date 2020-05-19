import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestion = 0;
  int score = 0;
  var quiz = [
    {
      "title": "Quand est-ce que le maroc a eu son independance ?",
      "answers": [
        {"answer": "1956", "correct": true},
        {"answer": "1955", "correct": false},
        {"answer": "1954", "correct": false}
      ]
    },
    {
      "title": "le constructeur de Marrakech",
      "answers": [
        {"answer": "Youssef Bentachafine", "correct": true},
        {"answer": "Hamza Lamine", "correct": false},
        {"answer": "Fatih Al Akbar", "correct": false}
      ]
    },
    {
      "title": "l'age du royaume Alaoui",
      "answers": [
        {"answer": "1245", "correct": false},
        {"answer": "1243", "correct": false},
        {"answer": "1233", "correct": true}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Quiz"),
      ),
      body:
      (this.currentQuestion >= this.quiz.length) ?
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("vous avez $score / ${quiz.length}"),
                RaisedButton(
                  child: Text("Restart"),
                  onPressed: (){
                    setState(() {
                      this.score=0;
                      this.currentQuestion=0;
                    });
                  },
                )
              ],
            ),
          )
      : ListView(
        children: <Widget>[
          ListTile(
            title: Center(
                child: Text(
              'question ${currentQuestion + 1} / ${quiz.length}',
              style: TextStyle(
                  fontSize: 20,
                  backgroundColor: Colors.grey,
                  fontWeight: FontWeight.bold),
            )),
          ),
          ListTile(
            title: Text('${quiz[currentQuestion]['title']}'),
          ),

          ...(quiz[currentQuestion]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return ListTile(
              title: RaisedButton(
                child: Text(answer['answer']),
                onPressed: () {

                  if(answer['correct']){
                    score++;
                  }
                  setState(() {
                    this.currentQuestion++;
                  });
                },
              ),
            );
          }),

        ],
      ),
    );
  }
}
