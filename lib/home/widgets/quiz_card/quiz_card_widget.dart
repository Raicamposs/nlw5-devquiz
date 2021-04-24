import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/home/models/quiz.dart';
import 'package:flutter/material.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget({Key? key, required this.quiz}) : super(key: key);
  final Quiz quiz;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(quiz.image),
          ),
          SizedBox(height: 24),
          Text(
            quiz.title,
            style: AppTextStyles.heading15,
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    '${quiz.progress} de ${quiz.total}',
                    style: AppTextStyles.body11,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: ProgressIndicatorWidget(quiz.percentProgress),
              )
            ],
          )
        ],
      ),
    );
  }
}
