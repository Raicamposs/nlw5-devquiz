import 'package:flutter/cupertino.dart';

class ChallengeController {
  final currentePageNotifier = ValueNotifier<int>(0);
  int get pageIndicator => currentePageNotifier.value + 1;
  int get currentePage => currentePageNotifier.value;

  nextQuestion() {
    currentePageNotifier.value = currentePageNotifier.value + 1;
  }

  goToPage(int page) {
    currentePageNotifier.value = page;
  }

  dispose() {
    currentePageNotifier.dispose();
  }
}
