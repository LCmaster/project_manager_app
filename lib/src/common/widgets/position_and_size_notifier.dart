// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PositionAndSizeNotifier extends StatefulWidget {
  const PositionAndSizeNotifier({
    Key? key,
    required this.onChanged,
    required this.child,
  }) : super(key: key);

  final void Function(Offset, Size) onChanged;
  final Widget child;

  @override
  State<PositionAndSizeNotifier> createState() =>
      _PositionAndSizeNotifierState();
}

class _PositionAndSizeNotifierState extends State<PositionAndSizeNotifier> {
  final widgetKey = GlobalKey();
  Offset? offset;
  Size? size;

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

    var currentSize = context.size;
    var renderBox = context.findRenderObject() as RenderBox;
    var currentOffset = renderBox.localToGlobal(Offset.zero);

    if (offset == currentOffset) return;
    if (size == currentSize || currentSize == null) return;

    size = currentSize;
    offset = currentOffset;
    widget.onChanged(currentOffset, currentSize);
  }
}
