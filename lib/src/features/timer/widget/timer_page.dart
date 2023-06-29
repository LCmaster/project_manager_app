import 'package:flutter/material.dart';
import 'package:threev_project_manager_app/src/features/timer/widget/timer_slider.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 32,
        ),
        Text(
          "Project name",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            "Task description: Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
            style: TextStyle(fontSize: 24),
          ),
        ),
        Spacer(),
        Container(
          width: double.infinity,
          height: 128,
          padding: EdgeInsets.symmetric(horizontal: 64.0),
          child: FittedBox(child: Text("00:15")),
        ),
        SizedBox(
          height: 96,
          child: Align(
            alignment: Alignment.topCenter,
            child: Icon(
              Icons.arrow_drop_down,
              size: 40,
            ),
          ),
        ),
        SizedBox(height: 128, child: TimerSlider()),
        SizedBox(
          height: 64,
          child: FilledButton(
            onPressed: () {},
            child: Icon(Icons.play_arrow),
          ),
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
