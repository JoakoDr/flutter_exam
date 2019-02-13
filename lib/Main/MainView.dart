import 'package:flutter_exam/Model/Question.dart';

abstract class MainView {
  openQuestionScreen(Question question);

  openDetailScreen(int position);

  showQuestions(List<Question> users);

  showLoading();

  hideLoading();

  showError();
}