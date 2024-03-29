import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final double percent;

  const ChartWidget({Key? key, required this.percent}) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween(begin: 0.0, end: widget.percent).animate(_controller);
  }

  @override
  void didChangeDependencies() {
    _animation = Tween(begin: 0.0, end: widget.percent).animate(_controller);
    _controller.forward();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    initAnimation();
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, __) {
          return Stack(
            children: [
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: _animation.value,
                    backgroundColor: AppColors.chartSecondary,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  ),
                ),
              ),
              Center(
                  child: Text(
                '${(_animation.value * 100).toStringAsFixed(2)}%',
                style: AppTextStyles.heading,
              ))
            ],
          );
        },
      ),
    );
  }
}
