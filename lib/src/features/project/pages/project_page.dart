// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:threev_project_manager_app/src/features/project/widgets/project_summary.dart';
import 'package:threev_project_manager_app/src/features/timer/widget/timer_page.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Project name",
        ),
      ),
      body: const TimerPage(),
    );
  }
}
