import 'dart:convert';

class UserModel {
  int score;
  final String name;
  final String photoUrl;

  UserModel({
    this.score = 0,
    required this.name,
    required this.photoUrl,
  });

  UserModel copyWith({
    int? score,
    String? name,
    String? photoUrl,
  }) {
    return UserModel(
      score: score ?? this.score,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'score': score,
      'name': name,
      'photoUrl': photoUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      score: map['score'],
      name: map['name'],
      photoUrl: map['photoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserModel(score: $score, name: $name, photoUrl: $photoUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.score == score &&
        other.name == name &&
        other.photoUrl == photoUrl;
  }

  @override
  int get hashCode => score.hashCode ^ name.hashCode ^ photoUrl.hashCode;
}
