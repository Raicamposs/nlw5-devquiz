import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:devquiz/shared/models/question_model.dart';

enum Level {
  Easy,
  Medium,
  Hard,
  Expert,
}

extension LevelExt on Level {
  String get toMap => {
        Level.Easy: 'Fácil',
        Level.Medium: 'Médio',
        Level.Hard: 'Difícil',
        Level.Expert: 'Perito',
      }[this]!;
}

extension StringExt on String {
  Level get levelParse => {
        'Fácil': Level.Easy,
        'Médio': Level.Medium,
        'Difícil': Level.Hard,
        'Perito': Level.Expert,
      }[this]!;

  String get imageParse => 'assets/images/${this}.png';
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionsAnswered;
  final String image;
  final Level level;

  int get questionsNumber => questions.length;
  double get percentProgress =>
      questionsNumber > 0 ? (questionsAnswered * 100) / questionsNumber : 0;

  QuizModel({
    required this.title,
    required this.questions,
    required this.questionsAnswered,
    required this.image,
    required this.level,
  });

  QuizModel copyWith({
    String? title,
    List<QuestionModel>? questions,
    int? questionsAnswered,
    String? image,
    Level? level,
  }) {
    return QuizModel(
      title: title ?? this.title,
      questions: questions ?? this.questions,
      questionsAnswered: questionsAnswered ?? this.questionsAnswered,
      image: image ?? this.image,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionsAnswered': questionsAnswered,
      'image': image,
      'level': level.toMap,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionsAnswered: map['questionsAnswered'] as int,
      image: map['image'].toString().imageParse,
      level: map['level'].toString().levelParse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuizModel(title: $title, questions: $questions, questionsAnswered: $questionsAnswered, image: $image, level: $level)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuizModel &&
        other.title == title &&
        listEquals(other.questions, questions) &&
        other.questionsAnswered == questionsAnswered &&
        other.image == image &&
        other.level == level;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        questions.hashCode ^
        questionsAnswered.hashCode ^
        image.hashCode ^
        level.hashCode;
  }
}
