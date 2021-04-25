import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class NextButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  final Color _backgroudcolor;
  final Color _textColor;
  final Color _borderColor;

  NextButtonWidget._internal(
      this._backgroudcolor, this._textColor, this._borderColor, this.label,
      {this.onPressed});

  factory NextButtonWidget.green(
          {required String label, required VoidCallback? onPressed}) =>
      NextButtonWidget._internal(
        AppColors.darkGreen,
        Colors.white,
        AppColors.darkGreen,
        label,
        onPressed: onPressed,
      );
  factory NextButtonWidget.purple(
          {required String label, required VoidCallback? onPressed}) =>
      NextButtonWidget._internal(
        AppColors.purple,
        Colors.white,
        AppColors.purple,
        label,
        onPressed: onPressed,
      );

  factory NextButtonWidget.white(
          {required String label, required VoidCallback? onPressed}) =>
      NextButtonWidget._internal(
        Colors.white,
        AppColors.grey,
        AppColors.border,
        label,
        onPressed: onPressed,
      );

  factory NextButtonWidget.transparent(
          {required String label, required VoidCallback? onPressed}) =>
      NextButtonWidget._internal(
        Colors.transparent,
        AppColors.grey,
        Colors.transparent,
        label,
        onPressed: onPressed,
      );

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(_backgroudcolor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.all(BorderSide(color: _borderColor))),
      onPressed: onPressed,
      child: Text(
        label,
        style: AppTextStyles.body.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: _textColor,
        ),
      ),
    );
  }
}
