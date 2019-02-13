

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_exam/Main/MainView.dart';
import 'package:flutter_exam/Model/Question.dart';
import 'package:http/http.dart' as network;




class MainPresenter {

  MainView _view;

  MainPresenter(this._view);

  fetchData() async {
    _view.showLoading();
    network.Response response =
    await network.get('https://opentdb.com/api.php?amount=10');
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      List<Question> users = jsonBody['results'].map<Question>((element) {

        String question = element['question'];
        print(question);
        String correctAnswer = element["correct_answer"];
        List<dynamic> incorrectAnswers = element['incorrect_answers'];
        return Question(question, correctAnswer, incorrectAnswers);
      }).toList();
      _view.showQuestions(users);
    } else {
      _view.showError();
    }
    _view.hideLoading();
  }

  elementClicked(Question question) {
    _view.openQuestionScreen(question);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Questions List"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          children: <Widget>[
            ListTile(
              title: Text("Prueba Primera Pregunta"),
              onTap: () {

              },
            ),

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
