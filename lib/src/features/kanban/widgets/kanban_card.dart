// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_board_context_provider.dart';

class KanbanCard extends StatefulWidget {
  const KanbanCard({
    Key? key,
    this.isDraggable = true,
    required this.child,
  }) : super(key: key);
  final bool isDraggable;
  final Widget child;

  @override
  State<KanbanCard> createState() => _KanbanCardState();
}

class _KanbanCardState extends State<KanbanCard> {
  KanbanBoardContextProvider? _provider;

  @override
  void didChangeDependencies() {
    _provider = KanbanBoardContextProvider.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isDraggable
        ? _buildDraggable(context, widget.child)
        : widget.child;
  }

  Widget _buildDraggable(BuildContext context, Widget cardChild) {
    return LongPressDraggable(
      childWhenDragging: Opacity(
        opacity: 0.25,
        child: cardChild,
      ),
      feedback: Material(
        elevation: 16,
        child: SizedBox(
          width: _provider?.columnWidth,
          child: cardChild,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Material(
          elevation: 2,
          child: cardChild,
        ),
      ),
    );
  }
}
