// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class KanbanBoardContextProvider extends InheritedWidget {
  const KanbanBoardContextProvider({
    super.key,
    required super.child,
    required this.columnWidth,
    required this.onDragEndedCallback,
    required this.onDragStartedCallback,
  });

  final double columnWidth;
  final void Function() onDragEndedCallback;
  final void Function() onDragStartedCallback;

  void onDragStarted() {
    onDragStartedCallback();
  }

  void onDragEnded() {
    onDragEndedCallback();
  }

  void onDragCompleted() {
    // print("Drag Completed");
  }

  void onDragCanceled() {
    // print("Drag Canceled");
  }

  static KanbanBoardContextProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<KanbanBoardContextProvider>();
  }

  @override
  bool updateShouldNotify(KanbanBoardContextProvider oldWidget) {
    return true;
  }
}
