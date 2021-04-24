import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/awnser_model.dart';
import 'package:devquiz/shared/widgets/next_button/next_button_widget.dart';
import 'package:flutter/material.dart';

enum FeedBackType { Error, Success, Info }

class FeedBackPage extends StatelessWidget {
  final AnswerModel correctAnswer;
  final FeedBackType type;

  const FeedBackPage(
      {Key? key, required this.correctAnswer, this.type = FeedBackType.Info})
      : super(key: key);

  IconData get icon => {
        FeedBackType.Success: Icons.check_circle_outline_rounded,
        FeedBackType.Error: Icons.highlight_off_outlined,
        FeedBackType.Info: Icons.emoji_objects_outlined,
      }[type]!;

  Color get iconColor => {
        FeedBackType.Success: AppColors.darkGreen,
        FeedBackType.Error: AppColors.darkRed,
        FeedBackType.Info: AppColors.purple,
      }[type]!;

  String get statusText => {
        FeedBackType.Success: 'Acertou!',
        FeedBackType.Error: 'Errou :/',
        FeedBackType.Info: 'Alcance o próximo nível',
      }[type]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 120,
                ),
              ),
              SizedBox(height: 40),
              Text(
                statusText,
                style: AppTextStyles.heading,
              ),
              SizedBox(height: 16),
              Text(
                'Resposta correta:',
                style: AppTextStyles.bodyBold,
              ),
              SizedBox(height: 8),
              Text(
                correctAnswer.title,
                style: AppTextStyles.body,
              ),
              SizedBox(height: 56),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: NextButtonWidget.purple(
                  label: 'Avançar',
                  onPressed: () => Navigator.pop(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
