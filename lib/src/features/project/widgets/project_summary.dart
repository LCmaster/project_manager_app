import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_board.dart';
import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_card.dart';
import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_stage_header.dart';
// import 'package:threev_project_manager_app/src/features/project/pages/task_details_page.dart';

class ProjectSummary extends StatefulWidget {
  const ProjectSummary({super.key});

  @override
  State<ProjectSummary> createState() => _ProjectSummaryState();
}

class _Task {
  final String category;
  final String title;
  final String description;

  _Task(
    this.category,
    this.title,
    this.description,
  );
}

class _Stage {
  final String name;
  final List<_Task> tasks;

  _Stage(this.name, this.tasks);
}

class _Project {
  final String name;
  final List<_Stage> stages;

  _Project(this.name, this.stages);
}

class _ProjectSummaryState extends State<ProjectSummary> {
  var project = _Project(
    "Project Name",
    [
      _Stage(
        "To Do",
        List.generate(5, (index) {
          return _Task(
            "Development",
            "Task $index",
            "Descriptionfor task $index...",
          );
        }),
      ),
      _Stage(
        "Doing",
        [],
      ),
      _Stage(
        "Testing",
        List.generate(3, (index) {
          return _Task(
            "Development",
            "Task $index",
            "Description...",
          );
        }),
      ),
      _Stage(
        "Done",
        [],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: KanbanBoard(
          onReorder: (oldColumn, oldIndex, newColumn, newIndex) {
            setState(() {
              var card = project.stages[oldColumn].tasks.removeAt(oldIndex);
              project.stages[newColumn].tasks.insert(newIndex, card);
            });
          },
          onCardTap: (int columnIndex, int cardIndex) {
            context.push("/project/0/task");
          },
          columnWidth: 300,
          headerGap: 8,
          columnGap: 16,
          cardGap: 8,
          columnCount: project.stages.length,
          columnHeaderBuilder: (BuildContext context, int index) {
            return KanbanStageHeader(name: project.stages[index].name);
          },
          cardCount: List.generate(
            project.stages.length,
            (index) => project.stages[index].tasks.length,
          ),
          cardBuilder: (BuildContext context, int columnIndex, int index) {
            return KanbanCard(
              status: "Open",
              category: (index == 2)
                  ? "Design"
                  : (index == 4)
                      ? "Bugfix"
                      : "Development",
              attachments: 0,
              description: "Task description $index",
            );
          }),
    );
  }
}
