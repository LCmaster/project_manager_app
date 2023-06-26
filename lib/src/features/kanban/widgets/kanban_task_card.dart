// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:threev_project_manager_app/src/common/widgets/size_notifier.dart';

import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_task_card_body.dart';
import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_task_card_footer.dart';
import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_task_card_header.dart';

class KanbanTaskCard extends StatelessWidget {
  const KanbanTaskCard({
    Key? key,
    required this.category,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String category;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    Widget child = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KanbanTaskCardHeader(
          category: category,
          color: Colors.purple,
        ),
        KanbanTaskCardBody(
          title: title,
          description: description,
        ),
        const Divider(),
        const KanbanTaskCardFooter(
          attachments: 2,
          messages: 5,
          views: 10,
        ),
      ],
    );
    return child;
  }
}
