import 'dart:convert';

import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> loadUser() async {
    final response = await rootBundle.loadString("assets/database/user.json");
    return UserModel.fromJson(response);
  }

  Future<List<QuizModel>> loadQuizzes() async {
    final response =
        await rootBundle.loadString("assets/database/quizzes.json");
    final list = jsonDecode(response) as List;
    return list.map((item) => QuizModel.fromMap(item)).toList();
  }
}
