// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    Key? key,
    required this.children,
    this.gap = 0,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  final double gap;
  final List<Widget> children;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: children
          .asMap()
          .entries
          .map((entry) {
            int index = entry.key;
            Widget child = entry.value;

            List<Widget> result = [child];
            if (index < children.length - 1 && gap > 0) {
              result.add(SizedBox(width: gap));
            }

            return result;
          })
          .expand((element) => element)
          .toList(),
    );
  }
}
