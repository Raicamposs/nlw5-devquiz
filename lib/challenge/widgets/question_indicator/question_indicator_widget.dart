import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int length;

  const QuestionIndicatorWidget(
      {Key? key, required this.currentPage, required this.length})
      : super(key: key);

  double get value => length > 0 ? (currentPage - 1) / length : 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Questão $currentPage', style: AppTextStyles.body),
              Text('de $length', style: AppTextStyles.body)
            ],
          ),
          SizedBox(height: 16),
          ProgressIndicatorWidget(value)
        ],
      ),
    );
  }
}
