import 'dart:math';

import 'package:flutter/material.dart';

class TimerClock extends StatelessWidget {
  const TimerClock({
    super.key,
    required this.radius,
  });
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        for (int i = 0; i < 60; i++)
          Positioned(
            left: radius - ((i % 5 == 0) ? 1 : 0.5),
            top: radius,
            child: Transform(
              alignment: Alignment.topCenter,
              transform: Matrix4.identity()
                ..rotateZ(((2 * pi) / 60) * i)
                ..translate(0.0, radius - ((i % 5 == 0) ? 18 : 10), 0.0),
              child: Container(
                width: (i % 5 == 0) ? 2 : 1,
                height: (i % 5 == 0) ? 18 : 10,
                color: Colors.black,
              ),
            ),
          ),
      ],
    );
  }
}
