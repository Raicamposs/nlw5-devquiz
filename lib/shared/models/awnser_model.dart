import 'dart:convert';

class AnswerModel {
  final String title;
  final bool isRight;

  AnswerModel({
    required this.title,
    required this.isRight,
  });

  AnswerModel copyWith({
    String? title,
    bool? isRight,
  }) {
    return AnswerModel(
      title: title ?? this.title,
      isRight: isRight ?? this.isRight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isRight': isRight,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      title: map['title'],
      isRight: map['isRight'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source));

  @override
  String toString() => 'AwnserModel(title: $title, isRight: $isRight)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnswerModel &&
        other.title == title &&
        other.isRight == isRight;
  }

  @override
  int get hashCode => title.hashCode ^ isRight.hashCode;
}
