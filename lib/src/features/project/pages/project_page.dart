// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_board.dart';
import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_card.dart';
import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_column.dart';
import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_stage_header.dart';
import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_task_card_body.dart';
import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_task_card_footer.dart';
import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_task_card_header.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class Task {
  final String category;
  final String title;
  final String description;

  Task(
    this.category,
    this.title,
    this.description,
  );
}

class Stage {
  final String name;
  final List<Task> tasks;

  Stage(this.name, this.tasks);
}

class Project {
  final String name;
  final List<Stage> stages;

  Project(this.name, this.stages);
}

class _ProjectPageState extends State<ProjectPage> {
  var project = Project(
    "Project Name",
    [
      Stage(
        "To Do",
        List.generate(5, (index) {
          return Task(
            "Development",
            "Task $index",
            "Description...",
          );
        }),
      ),
      Stage(
        "Doing",
        [],
      ),
      Stage(
        "Testing",
        List.generate(3, (index) {
          return Task(
            "Development",
            "Task $index",
            "Description...",
          );
        }),
      ),
      Stage(
        "Done",
        [],
      ),
    ],
  );

  bool isDragging = false;

  final moveDistance = 5;

  int oldRowIndex = -1;
  int oldColumnIndex = -1;
  int currentRowIndex = -1;
  int currentColumnIndex = -1;
  int confirmedRowIndex = -1;
  int confirmedColumnIndex = -1;

  Widget _createListener(Widget child) {
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          project.name,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _createListener(
          KanbanBoard(
              onReorder: (oldColumn, oldIndex, newColumn, newIndex) {
                print("OLD:  COLUMN $oldColumn CARD $oldIndex ");
                print("NEW:  COLUMN $newColumn CARD $newIndex ");

                setState(() {
                  var card = project.stages[oldColumn].tasks.removeAt(oldIndex);
                  project.stages[newColumn].tasks.insert(newIndex, card);
                });
              },
              columnWidth: 300,
              columnCount: project.stages.length,
              columnHeaderBuilder: (BuildContext context, int index) {
                return KanbanStageHeader(name: project.stages[index].name);
              },
              cardCount: List.generate(
                project.stages.length,
                (index) => project.stages[index].tasks.length,
              ),
              cardBuilder: (BuildContext context, int columnIndex, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const KanbanTaskCardHeader(
                      category: "Development",
                      color: Colors.purple,
                    ),
                    KanbanTaskCardBody(
                      title: "Task Card $index",
                      description: "Description...",
                    ),
                    const KanbanTaskCardFooter(
                      attachments: 5,
                      messages: 2,
                      views: 9,
                    ),
                  ],
                );
              }),
          // Positioned.fill(
          //   child: ListView.builder(
          //     key: _listViewKey,
          //     shrinkWrap: true,
          //     controller: _scrollController,
          //     scrollDirection: Axis.horizontal,
          //     itemCount: project.stages.length,
          //     itemBuilder: (context, stageIndex) {
          //       return SizedBox(
          //         width: 300,
          //         child: CustomColumn(
          //           gap: 16,
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             KanbanStageHeader(
          //                 name: project.stages[stageIndex].name),
          //             Expanded(
          //               child: ListView.builder(
          //                 key: project.stages[stageIndex].key,
          //                 itemCount:
          //                     project.stages[stageIndex].tasks.length,
          //                 padding: EdgeInsets.only(bottom: 8.0),
          //                 itemBuilder: (context, taskIndex) {
          //                   return Container(
          //                     key: project
          //                         .stages[stageIndex].tasks[taskIndex].key,
          //                     child: LongPressDraggable(
          //                       onDragStarted: () {
          //                         isDragging = true;

          //                         oldRowIndex = taskIndex;
          //                         currentRowIndex = taskIndex;

          //                         oldColumnIndex = stageIndex;
          //                         currentColumnIndex = stageIndex;
          //                       },
          //                       onDragEnd: (_) {
          //                         isDragging = false;

          //                         oldRowIndex = -1;
          //                         currentRowIndex = -1;
          //                         confirmedRowIndex = -1;

          //                         oldColumnIndex = -1;
          //                         currentColumnIndex = -1;
          //                         confirmedColumnIndex = -1;
          //                       },
          //                       onDraggableCanceled: (velocity, offset) =>
          //                           isDragging = false,
          //                       feedback: SizedBox(
          //                         width: 300,
          //                         child: Card(
          //                           elevation: 16,
          //                           child: Padding(
          //                             padding: const EdgeInsets.all(8.0),
          //                             child: KanbanTaskCard(
          //                                 category: project
          //                                     .stages[stageIndex]
          //                                     .tasks[taskIndex]
          //                                     .category,
          //                                 title: project.stages[stageIndex]
          //                                     .tasks[taskIndex].title,
          //                                 description: project
          //                                     .stages[stageIndex]
          //                                     .tasks[taskIndex]
          //                                     .description),
          //                           ),
          //                         ),
          //                       ),
          //                       childWhenDragging: SizedBox(
          //                         width: 300,
          //                         child: Padding(
          //                           padding: const EdgeInsets.all(8.0),
          //                           child: Container(
          //                             color: Color.fromARGB(
          //                                 255, 247, 247, 247),
          //                             child: DottedBorder(
          //                               color: const Color.fromARGB(
          //                                   255, 185, 185, 185),
          //                               dashPattern: [8, 4],
          //                               strokeWidth: 2,
          //                               borderType: BorderType.RRect,
          //                               radius: Radius.circular(8),
          //                               child: ClipRRect(
          //                                 borderRadius: BorderRadius.all(
          //                                     Radius.circular(8)),
          //                                 child: Opacity(
          //                                   opacity: 0.0,
          //                                   child: KanbanTaskCard(
          //                                       category: project
          //                                           .stages[stageIndex]
          //                                           .tasks[taskIndex]
          //                                           .category,
          //                                       title: project
          //                                           .stages[stageIndex]
          //                                           .tasks[taskIndex]
          //                                           .title,
          //                                       description: project
          //                                           .stages[stageIndex]
          //                                           .tasks[taskIndex]
          //                                           .description),
          //                                 ),
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                       ),
          //                       child: SizedBox(
          //                         width: 300,
          //                         child: Card(
          //                           child: Padding(
          //                             padding: const EdgeInsets.all(8.0),
          //                             child: KanbanTaskCard(
          //                                 category: project
          //                                     .stages[stageIndex]
          //                                     .tasks[taskIndex]
          //                                     .category,
          //                                 title: project.stages[stageIndex]
          //                                     .tasks[taskIndex].title,
          //                                 description: project
          //                                     .stages[stageIndex]
          //                                     .tasks[taskIndex]
          //                                     .description),
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                   );
          //                 },
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ),
      ),
    );
  }
}
