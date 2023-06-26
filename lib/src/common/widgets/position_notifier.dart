// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PositionNotifier extends StatefulWidget {
  const PositionNotifier({
    Key? key,
    required this.onChanged,
    required this.child,
  }) : super(key: key);

  final Function(Offset) onChanged;
  final Widget child;

  @override
  State<PositionNotifier> createState() => _PositionNotifierState();
}

class _PositionNotifierState extends State<PositionNotifier> {
  final widgetKey = GlobalKey();
  Offset? offset;

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }

  void postFrameCallback(_) {
    var context = widgetKey.currentContext;
    if (context == null) return;

    var renderBox = context.findRenderObject() as RenderBox;
    var currentOffset = renderBox.localToGlobal(Offset.zero);
    if (offset == currentOffset) return;

    offset = currentOffset;
    widget.onChanged(currentOffset);
  }
}
