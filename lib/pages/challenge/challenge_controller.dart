import 'package:flutter/cupertino.dart';

class ChallengeController {
  int _correctAnswers = 0;
  int get correctAnswers => _correctAnswers;

  final currentePageNotifier = ValueNotifier<int>(0);
  int get pageIndicator => currentePageNotifier.value + 1;
  int get currentePage => currentePageNotifier.value;

  nextQuestion() {
    currentePageNotifier.value = currentePageNotifier.value + 1;
  }

  inclementCorrectAnswers() {
    _correctAnswers++;
  }

  goToPage(int page) {
    currentePageNotifier.value = page;
  }

  dispose() {
    currentePageNotifier.dispose();
  }
}
