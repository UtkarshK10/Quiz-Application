import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore,this.resetHandler);
   String get resultPhrase{
     var resultText = 'You did it!';
     if(resultScore <= 8)
       {
         resultText = 'You are awesome and innocent';
       }
     else if(resultScore <= 12)
       {
         resultText = 'It is pretty likeable';
       }
     else if(resultScore <=16)
       {
         resultText = 'You are strange';
       }
     else{
       resultText = 'You are so bad';
     }
     return resultText;
   }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(resultPhrase,style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.indigo
          ),
          textAlign: TextAlign.center,),
          FlatButton(child: Text('Restart Quiz',style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Colors.teal
          ),),onPressed:resetHandler ,)
        ],
      ),
    );
  }
}
