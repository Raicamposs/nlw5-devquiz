import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/next_button/next_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int numberOfCorrectAnswers;

  const ResultPage(
      {Key? key,
      required this.title,
      required this.length,
      required this.numberOfCorrectAnswers})
      : super(key: key);

  double get percent =>
      length > 0 ? (numberOfCorrectAnswers * 100) / length : 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.trophy),
              SizedBox(height: 40),
              Text(
                'Parabéns!',
                style: AppTextStyles.heading40,
              ),
              SizedBox(height: 16),
              Text(
                'Você concluiu',
                style: AppTextStyles.body,
              ),
              Text(
                title,
                style: AppTextStyles.bodyBold,
              ),
              Text(
                'com $numberOfCorrectAnswers de $length acertos.',
                style: AppTextStyles.body,
              ),
              SizedBox(height: 56),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: NextButtonWidget.purple(
                  label: 'Compartilhar',
                  onPressed: () {
                    Share.share(
                        'DevQuiz NLW 5 - Flutter: Resultado do Quiz: $title \nObtive:${percent.toStringAsFixed(2)}% de aproveitamento!');
                  },
                ),
              ),
              SizedBox(height: 8),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: NextButtonWidget.transparent(
                  label: 'Voltar ao início',
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
