import 'package:flutter/material.dart';
import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_boards_view.dart';

class ProjectSummary extends StatefulWidget {
  const ProjectSummary({super.key});

  @override
  State<ProjectSummary> createState() => _ProjectSummaryState();
}

class _ProjectSummaryState extends State<ProjectSummary> {
  final List<int> _items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return KanbanBoardsView();
  }
}
