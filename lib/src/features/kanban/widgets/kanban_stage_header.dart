// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class KanbanStageHeader extends StatelessWidget {
  const KanbanStageHeader({
    Key? key,
    required this.name,
    this.color,
  }) : super(key: key);

  final String name;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          leading: (color != null)
              ? ClipOval(
                  child: Container(
                    width: 16,
                    height: 16,
                    color: color,
                  ),
                )
              : null,
          title: Text(name),
          trailing: Icon(Icons.more_vert),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 1.0,
              ),
            ],
          ),
          child: TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text("Add Task"),
          ),
        ),
      ],
    );
  }
}
