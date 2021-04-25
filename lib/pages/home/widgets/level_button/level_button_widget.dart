import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';

class LevelButtonWidget extends StatelessWidget {
  final Level level;
  final void Function()? onTap;

  const LevelButtonWidget(this.level, {this.onTap});

  factory LevelButtonWidget.easy({void Function()? onTap}) =>
      LevelButtonWidget(Level.Easy, onTap: onTap);

  factory LevelButtonWidget.medium({void Function()? onTap}) =>
      LevelButtonWidget(Level.Medium, onTap: onTap);

  factory LevelButtonWidget.hard({void Function()? onTap}) =>
      LevelButtonWidget(Level.Hard, onTap: onTap);

  factory LevelButtonWidget.expert({void Function()? onTap}) =>
      LevelButtonWidget(Level.Expert, onTap: onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.fromBorderSide(
          BorderSide(
            color: level.borderColor,
          ),
        ),
        color: level.buttonColor,
      ),
      child: InkWell(
        onTap: onTap,
        child: Text(
          level.text,
          style: AppTextStyles.body.copyWith(color: level.textColor),
        ),
      ),
    );
  }
}

extension LevelExtension on Level {
  String get text => {
        Level.Easy: 'Fácil',
        Level.Medium: 'Médio',
        Level.Hard: 'Difícil',
        Level.Expert: 'Perito',
      }[this]!;

  Color get buttonColor => {
        Level.Easy: AppColors.levelButtonFacil,
        Level.Medium: AppColors.levelButtonMedio,
        Level.Hard: AppColors.levelButtonDificil,
        Level.Expert: AppColors.levelButtonPerito,
      }[this]!;

  Color get borderColor => {
        Level.Easy: AppColors.levelButtonBorderFacil,
        Level.Medium: AppColors.levelButtonBorderMedio,
        Level.Hard: AppColors.levelButtonBorderDificil,
        Level.Expert: AppColors.levelButtonBorderPerito,
      }[this]!;

  Color get textColor => {
        Level.Easy: AppColors.levelButtonTextFacil,
        Level.Medium: AppColors.levelButtonTextMedio,
        Level.Hard: AppColors.levelButtonTextDificil,
        Level.Expert: AppColors.levelButtonTextPerito,
      }[this]!;
}
