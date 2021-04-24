import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/feed_back/feed_back_page.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/widgets/next_button/next_button_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({Key? key, required this.questions}) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final PageController pageController = PageController();

  bool get isLastPage => widget.questions.length == controller.pageIndicator;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _nextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 100),
      curve: Curves.bounceInOut,
    );
  }

  _skipPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => FeedBackPage(
          correctAnswer:
              widget.questions[controller.currentePage].correctAnswer,
          type: FeedBackType.Info,
        ),
      ),
    ).then((_) => _nextPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(),
            SafeArea(
              child: ValueListenableBuilder<int>(
                valueListenable: controller.currentePageNotifier,
                builder: (_, __, ___) {
                  return QuestionIndicatorWidget(
                    currentPage: controller.pageIndicator,
                    length: widget.questions.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: controller.goToPage,
        itemCount: widget.questions.length,
        itemBuilder: (_, int index) => QuizWidget(
          question: widget.questions[index],
          onAnswering: _nextPage,
        ),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (!isLastPage)
                Expanded(
                  child: NextButtonWidget.white(
                    label: 'Pular',
                    onPressed: _skipPage,
                  ),
                ),
              if (isLastPage)
                Expanded(
                  child: NextButtonWidget.green(
                    label: 'Confirmar',
                    onPressed: _nextPage,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
