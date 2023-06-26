// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SizeNotifier extends StatefulWidget {
  const SizeNotifier({
    Key? key,
    required this.onChanged,
    required this.child,
  }) : super(key: key);

  final Function(Size) onChanged;
  final Widget child;

  @override
  State<SizeNotifier> createState() => _SizeNotifierState();
}

class _SizeNotifierState extends State<SizeNotifier> {
  final widgetKey = GlobalKey();
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
    if (size == currentSize || currentSize == null) return;

    size = currentSize;
    widget.onChanged(currentSize);
  }
}
