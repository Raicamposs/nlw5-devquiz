import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/awnser_model.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final VoidCallback onTap;

  const AwnserWidget({
    Key? key,
    required this.answer,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  bool get isRight => answer.isRight;

  Color get _selectedColorCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _colorCard =>
      isSelected ? _selectedColorCardRight : AppColors.white;

  Color get _selectedBorderCardRight =>
      isRight ? AppColors.green : AppColors.red;

  Color get _colorBorder =>
      isSelected ? _selectedBorderCardRight : AppColors.border;

  TextStyle get _selectedTextStyleRight =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  TextStyle get _textStyle =>
      isSelected ? _selectedTextStyleRight : AppTextStyles.body;

  Color get _selectedColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _iconBackgroudColor =>
      isSelected ? _selectedColorRight : AppColors.white;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  Color get _selectedBorderRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _iconBorderColor =>
      isSelected ? _selectedBorderRight : AppColors.border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _colorCard,
        border: Border.fromBorderSide(
          BorderSide(
            color: _colorBorder,
          ),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(answer.title, style: _textStyle)),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(
                    color: _iconBorderColor,
                  ),
                ),
                borderRadius: BorderRadius.circular(12),
                color: _iconBackgroudColor,
              ),
              child: Icon(
                _selectedIconRight,
                size: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
