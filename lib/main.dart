import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/quiz.dart';
import 'package:my_app/result.dart';
import './question.dart';
import './answer.dart';
// void main(List<String> args) {
//   runApp(MyApp());
// }
void main(List<String> args) => runApp(MyApp());
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }

}
class MyAppState extends State<MyApp>{
  final  _questions = const[
    //how using map
    {
      'questionText': 'What\'s Your Favorite Color !?',
      'answers':[
        {'text': 'Black', 'score':10},
        {'text':'Red','score':5},
        {'text': 'Green', 'score':3},
        {'text': 'White', 'score':1}
        ],
    },
    {
      'questionText': 'what\'s Your Favorite Animal !?',
      'answers':[
        {'text': 'Rabbit','score': 3},
        {'text': 'Snake','score': 11},
        {'text': 'Elephent','score': 5},
        {'text': 'Lion','score': 9},
        ],
    },
    {
      'questionText': 'Who\'s your Favorite Instructor !?',
      'answers':[
        {'text': 'Rabbit','score': 1},
        {'text': 'Rabbit','score': 1},
        {'text': 'Rabbit','score': 1},
        {'text': 'Rabbit','score': 1},
        ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz(){
    setState(() {
      _questionIndex =0;
      _totalScore =0;
    });
  }
  void _answerQuestion(int score){
    _totalScore += score;
   setState(() {
     _questionIndex = _questionIndex+1;
   });
  print(_questionIndex);
   if(_questionIndex < _questions.length){
     print('We have more questions!');
   }
  }

  @override
  Widget build(BuildContext context) {

     // question = []; does not work if questions is a const

     var dummy = ['Hello'];
     dummy.add('Max');
     print(dummy);

    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body:_questionIndex < _questions.length
            ? Quiz(answerQuestion: _answerQuestion,questionIndex: _questionIndex,questions: _questions,
        )
            : Result(_totalScore, _resetQuiz),
      ),

    );
  }
}
