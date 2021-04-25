import 'package:devquiz/pages/challenge/challenge_controller.dart';
import 'package:devquiz/pages/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/pages/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/pages/feed_back/feed_back_page.dart';
import 'package:devquiz/pages/result/result_page.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/widgets/next_button/next_button_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final QuizModel quiz;

  const ChallengePage({Key? key, required this.quiz}) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final PageController pageController = PageController();

  List<QuestionModel> get questions => widget.quiz.questions;
  int get questionsNumber => questions.length;
  bool get isLastQuestion => controller.pageIndicator == questionsNumber;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _nextPage() {
    if (!isLastQuestion) {
      pageController.nextPage(
        duration: Duration(milliseconds: 100),
        curve: Curves.bounceInOut,
      );
    } else
      _showResult();
  }

  _skipPage() {
    final correctAnswer = questions[controller.currentePage].correctAnswer;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FeedBackPage(
          correctAnswer: correctAnswer,
          type: FeedBackType.Info,
        ),
      ),
    ).then((_) => _nextPage());
  }

  _showResult() {
    widget.quiz.questionsAnswered = controller.correctAnswers;
    controller.nextQuestion();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultPage(
          length: questionsNumber,
          numberOfCorrectAnswers: controller.correctAnswers,
          title: widget.quiz.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
          top: true,
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
                      length: questionsNumber,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: controller.goToPage,
        itemCount: questionsNumber,
        itemBuilder: (_, int index) => QuizWidget(
          question: questions[index],
          onAnswering: (bool isCorrectAnswer) {
            if (isCorrectAnswer) {
              controller.inclementCorrectAnswers();
            }
            _nextPage();
          },
        ),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentePageNotifier,
            builder: (_, indexPage, ___) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (indexPage < (questionsNumber - 1))
                  Expanded(
                    child: NextButtonWidget.white(
                      label: 'Pular',
                      onPressed: _skipPage,
                    ),
                  ),
                if (indexPage >= (questionsNumber - 1))
                  Expanded(
                    child: NextButtonWidget.green(
                      label: 'Ver resultado',
                      onPressed: _skipPage,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
