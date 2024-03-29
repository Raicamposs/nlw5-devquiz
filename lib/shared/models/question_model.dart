import 'dart:convert';

import 'package:devquiz/shared/models/awnser_model.dart';
import 'package:flutter/foundation.dart';

class QuestionModel {
  final String title;
  final List<AnswerModel> answers;

  AnswerModel get correctAnswer =>
      answers.firstWhere((element) => element.isRight);

  QuestionModel({
    required this.title,
    required this.answers,
  }) : assert(answers.length == 4);

  QuestionModel copyWith({
    String? title,
    List<AnswerModel>? answers,
  }) {
    return QuestionModel(
      title: title ?? this.title,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      answers: List<AnswerModel>.from(
          map['answers']?.map((x) => AnswerModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));

  @override
  String toString() => 'Quizmodel(title: $title, answers: $answers)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionModel &&
        other.title == title &&
        listEquals(other.answers, answers);
  }

  @override
  int get hashCode => title.hashCode ^ answers.hashCode;
}
