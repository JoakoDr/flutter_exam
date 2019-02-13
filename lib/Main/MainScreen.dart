import 'package:flutter/material.dart';
import 'package:flutter_exam/Main/MainPresenter.dart';
import 'package:flutter_exam/Main/MainView.dart';
import 'package:flutter_exam/Model/Question.dart';
import 'package:flutter_exam/QuestionScreen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> implements MainView {
  MainPresenter _mainPresenter;
  List<Question> _questions = [];
  bool _isLoading = true;
  bool _isError = false;

  _MainScreenState() {
    _mainPresenter = MainPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _mainPresenter.fetchData();
  }

  @override
  openSettingsScreen(Question question) {
    Navigator.push(context, MaterialPageRoute(builder: (c) {
      return QuestionScreen(question);
    }));
  }

  @override
  showLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  showError() {
    setState(() {
      _isError = true;
    });
  }

  @override
  showUsers(List<Question> questions) {
    setState(() {
      this._questions = questions;
    });
  }

  buildBody() {
    if (_isLoading) {
      return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90.0),
            child: CircularProgressIndicator(),
          ));
    }
    else if (_isError) {
      return Center(child: Text("Ha habido un error"));
    } else {
      return RefreshIndicator(
        onRefresh: () {
          _mainPresenter.fetchData();
        },
        child: ListView.builder(
          itemBuilder: (context, position) {
            return ListTile(
              leading: Icon(Icons.account_circle),
              title:
              Text(_questions[position].question),
              onTap: () {
                Question newQuestion = new Question(_questions[position].question,_questions[position].correctAnswer,_questions[position].incorrectAnswers);
                _mainPresenter.elementClicked(newQuestion);
              },
            );
          },
          itemCount: _questions.length,
          reverse: false,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  @override
  openDetailScreen(int position) {
    // TODO: implement openDetailScreen
    return null;
  }

  @override
  openQuestionScreen(Question question) {
    // TODO: implement openQuestionScreen
    Navigator.push(context, MaterialPageRoute(builder: (c) {
      return QuestionScreen(question);
    }));
  }

  @override
  showQuestions(List<Question> questions) {
    setState(() {
      this._questions = questions;
    });
  }
}