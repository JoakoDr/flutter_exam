import 'package:flutter/material.dart';
import 'package:flutter_exam/Model/Question.dart';

class QuestionScreen extends StatefulWidget {
  final Question question;

  QuestionScreen(this.question);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}
class _QuestionsScreenState extends State<QuestionScreen> {
  // user defined function
  void _showDialog(int index) {
    // flutter defined function
    if (index == 1) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(" ${widget.question.correctAnswer}"),
            content: new Text("¡Has acertado! Enhorabuena"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }else if(index == 3)
      {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(" ${widget.question.incorrectAnswers[index-1]}"),
            content: new Text("¡Has fallado! Ohhhhhhh"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      }
    else if(index == 2)
    {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(" ${widget.question.incorrectAnswers[index]}"),
            content: new Text("¡Has fallado! Ohhhhhhh"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(" ${widget.question.incorrectAnswers[index]}"),
            content: new Text("¡Has fallado! Ohhhhhhh"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _onPressed(int index) {
    _showDialog(index);
  }
  void _is2() {
    if (widget.question.incorrectAnswers.length > 2){

      new FlatButton(onPressed: () {
        _onPressed(2);
      }, child: new Text('Respuesta 3: ${widget.question
          .incorrectAnswers[1]}'));
    new FlatButton(onPressed: () {
    _onPressed(3);
    }, child: new Text('Respuesta 4: ${widget.question
        .incorrectAnswers[2]}'));
        }
        else
          {

          }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${widget.question.question}'),
          backgroundColor: Colors.black,),
        body: new Container(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Card(
                  child:
                  new Column(
                    children: <Widget>[
                      new Text("Pregunta :  ${widget.question.question}",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,),
                      new FlatButton(onPressed: () {
                        _onPressed(0);
                      },
                          child: new Text('Respuesta 1: ${widget.question
                              .incorrectAnswers[0]}')),
                      new FlatButton(onPressed: () {
                        _onPressed(1);
                      }, child: new Text('Respuesta 2: ${widget.question.correctAnswer}')),
                      new FlatButton(onPressed: () {
                         _onPressed(2);
                         }, child: new Text('Respuesta 3: ${widget.question
                          .incorrectAnswers[1]}')),
                         new FlatButton(onPressed: () {
                        _onPressed(3);
                         }, child: new Text('Respuesta 4: ${widget.question
                          .incorrectAnswers[2]}')),



                    ],

                  )

              ),
            ],
          ),
        )
    );
  }
}
