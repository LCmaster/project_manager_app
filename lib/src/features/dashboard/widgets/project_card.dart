// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:threev_project_manager_app/src/features/dashboard/models/project.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard(
    this.project, {
    Key? key,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(project.name),
          subtitle: Text(project.description),
          trailing: TextButton(
            onPressed: () {},
            child: const Text("Select"),
          ),
        ),
      ),
    );
  }
}
