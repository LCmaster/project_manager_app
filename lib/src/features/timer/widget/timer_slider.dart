import 'package:flutter/material.dart';
import 'package:threev_project_manager_app/src/features/timer/widget/timer_clock.dart';

class TimerSlider extends StatelessWidget {
  const TimerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: GestureDetector(
        onTap: () {
          print("On Tap");
        },
        onTapDown: (details) {
          print("On Tap Down");
        },
        onHorizontalDragUpdate: (details) {
          print("On Drag Update");
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxWidth / 3,
              // child: Transform.scale(
              //   scale: 2,
              //   child: TimerClock(radius: constraints.maxWidth / 2),
              // ),
            );
          },
        ),
      ),
    );
  }
}
