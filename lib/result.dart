import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final int resultScore;
  final Function resultHandler;
  Result(this.resultScore,this.resultHandler);
  String get resultPhrase{
    String resultText;
    if(resultScore <= 8){
      resultText = 'You are  awesome and innocent!';

    }
    else if(resultScore <=12) {
      resultText = 'Pretty Likeable!';
    }
    else if(resultScore <= 16){
      resultText = 'You Are... Strange!?';
    }
    else{
      resultText = 'You are so bad!';
    }
    return resultText;
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPhrase,
        style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              child: Center(child: Center(child: Text('Restart Quiz!'))),
            textColor: Colors.blue,
            onPressed: resultHandler,
            ),
          ),
        ),
      )
    );
  }
}
