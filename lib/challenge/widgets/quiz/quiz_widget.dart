import 'package:devquiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/feed_back/feed_back_page.dart';
import 'package:devquiz/shared/models/awnser_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onAnswering;

  const QuizWidget(
      {Key? key, required this.question, required this.onAnswering})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Text(widget.question.title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: widget.question.answers.length,
              itemBuilder: (_, int index) {
                final answer = widget.question.answers[index];
                return IgnorePointer(
                  ignoring: selectedIndex > -1,
                  child: AwnserWidget(
                    answer: answer,
                    isSelected: selectedIndex == index,
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});

                      showFeedBack(answer);
                    },
                  ),
                );
              },
              separatorBuilder: (__, _) => SizedBox(height: 8),
            ),
          ),
        ],
      ),
    );
  }

  Future showFeedBack(AnswerModel answer) =>
      Future.delayed(Duration(milliseconds: 500)).then((_) {
        if (answer.isRight) return Future.value(null);

        return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => FeedBackPage(
              correctAnswer: widget.question.correctAnswer,
              type: answer.isRight ? FeedBackType.Success : FeedBackType.Error,
            ),
          ),
        );
      }).then((_) => widget.onAnswering());
}
