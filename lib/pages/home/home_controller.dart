import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

import 'home_repository.dart';

enum HomeState { empty, loading, success, error }

class HomeController {
  UserModel? user;
  List<QuizModel>? quizzes;
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  final _repository = HomeRepository();

  Future<void> loadUserAndQuizzes() async {
    try {
      stateNotifier.value = HomeState.loading;

      await Future.wait([
        _repository.loadUser().then((value) => user = value),
        _repository.loadQuizzes().then((value) => quizzes = value)
      ]);

      stateNotifier.value = HomeState.success;
    } catch (e) {
      print(e);
      stateNotifier.value = HomeState.error;
    }
  }

  dispose() {
    stateNotifier.dispose();
  }
}
