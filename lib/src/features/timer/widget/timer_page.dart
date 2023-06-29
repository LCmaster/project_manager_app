import 'package:flutter/material.dart';
import 'package:threev_project_manager_app/src/features/timer/widget/timer_slider.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Project name",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Hours",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "00",
            style: TextStyle(fontSize: 96, fontWeight: FontWeight.w100),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //   child: Text(
        //     "minutes",
        //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Minutes",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                "00",
                style: TextStyle(fontSize: 96, fontWeight: FontWeight.w100),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Seconds",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "00",
            style: TextStyle(fontSize: 96, fontWeight: FontWeight.w100),
          ),
        ),
        SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
              height: 80,
              width: double.infinity,
              child: FilledButton(
                  onPressed: () {},
                  child: Text(
                    "Start",
                    style: TextStyle(fontSize: 24),
                  ))),
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
