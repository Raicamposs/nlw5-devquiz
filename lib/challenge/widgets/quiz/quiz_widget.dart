import 'package:devquiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                AwnserWidget(
                  title: 'Kit de desenvolvimento de interface de usuário',
                ),
                SizedBox(height: 8),
                AwnserWidget(
                  title:
                      'Possibilita a criação de aplicativos compilados nativamente',
                  isSelected: true,
                  isRight: true,
                ),
                SizedBox(height: 8),
                AwnserWidget(
                  title: 'Acho que é uma marca de café do Himalaia',
                ),
                SizedBox(height: 8),
                AwnserWidget(
                  title:
                      'Possibilita a criação de desktops que são muito incríveis',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
