import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';

import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget({Key? key, required this.quiz, this.onTap})
      : super(key: key);
  final QuizModel quiz;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: AppColors.border,
          ),
        ),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(quiz.image),
            ),
            Text(
              quiz.title,
              style: AppTextStyles.heading15,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    '${quiz.questionsAnswered.toString().padLeft(2, '0')} de ${quiz.questionsNumber.toString().padLeft(2, '0')}',
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  child: ProgressIndicatorWidget(quiz.percentProgress),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
