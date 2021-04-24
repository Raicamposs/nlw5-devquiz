import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/models/quiz.dart';
import 'package:devquiz/home/widgets/app_bar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget.easy(),
                LevelButtonWidget.medium(),
                LevelButtonWidget.hard(),
                LevelButtonWidget.expert(),
              ],
            ),
          ),
          SizedBox(height: 8),
          Expanded(
              child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            padding: EdgeInsets.all(16),
            children:
                quizList.map((quiz) => QuizCardWidget(quiz: quiz)).toList(),
          ))
        ],
      ),
    );
  }

  final quizList = [
    Quiz(
        title: 'Gerenciamento de Estado',
        total: 10,
        progress: 3,
        image: AppImages.data),
    Quiz(
        title: 'Construindo Interfaces',
        total: 10,
        progress: 10,
        image: AppImages.laptop),
    Quiz(
        title: 'Integração Nativa',
        total: 9,
        progress: 10,
        image: AppImages.hierarchy),
    Quiz(
        title: 'Widgets do Flutter',
        total: 5,
        progress: 10,
        image: AppImages.blocks),
    Quiz(
        title: 'Gerenciamento de Estado',
        total: 10,
        progress: 3,
        image: AppImages.data),
    Quiz(
        title: 'Construindo Interfaces',
        total: 10,
        progress: 10,
        image: AppImages.laptop),
    Quiz(
        title: 'Integração Nativa',
        total: 9,
        progress: 10,
        image: AppImages.hierarchy),
    Quiz(
        title: 'Widgets do Flutter',
        total: 5,
        progress: 10,
        image: AppImages.blocks),
  ];
}
