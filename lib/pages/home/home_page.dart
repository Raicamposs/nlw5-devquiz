import 'package:devquiz/pages/challenge/challenge_page.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/pages/home/widgets/app_bar/app_bar_widget.dart';
import 'package:devquiz/pages/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/pages/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.loadUserAndQuizzes();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<HomeState>(
      valueListenable: controller.stateNotifier,
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      ),
      builder: (_, HomeState value, Widget? loader) {
        if (value == HomeState.success) {
          return Scaffold(
            appBar: AppBarWidget(controller.user!),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: Level.values
                        .map((level) => LevelButtonWidget(level))
                        .toList(),
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                    child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  padding: EdgeInsets.all(16),
                  children: (controller.quizzes ?? [])
                      .map(
                        (quiz) => QuizCardWidget(
                          quiz: quiz,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChallengePage(
                                quiz: quiz,
                              ),
                            ),
                          ).then((_) {
                            final questions = controller.quizzes!
                                .map((element) => element.questions.length)
                                .reduce((value, element) {
                              return value + element;
                            });

                            final questionsAnswered = controller.quizzes!
                                .map((element) => element.questionsAnswered)
                                .reduce((value, element) {
                              return value + element;
                            });

                            final score =
                                (questionsAnswered / questions * 100).toInt();

                            controller.user!.score = score;

                            setState(() {});
                          }),
                        ),
                      )
                      .toList(),
                ))
              ],
            ),
          );
        }

        return loader!;
      },
    );
  }
}
