import 'package:flutter/material.dart';
import 'package:threev_project_manager_app/src/features/timer/widget/timer_clock.dart';

class TimerSlider extends StatelessWidget {
  const TimerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxWidth / 2,
            child: Transform.scale(
                scale: 2, child: TimerClock(radius: constraints.maxWidth / 2)),
          );
        },
      ),
    );
  }
}
