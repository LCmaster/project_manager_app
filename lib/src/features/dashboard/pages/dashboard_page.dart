import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threev_project_manager_app/src/features/dashboard/data/projects_repository.dart';
import 'package:threev_project_manager_app/src/features/dashboard/widgets/dashboard_title.dart';
import 'package:threev_project_manager_app/src/features/dashboard/widgets/project_card.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DashboardTitle(
                numberOfProjects: projects.length,
              ),
              const SizedBox(
                height: 16,
              ),
              ...projects.map((project) => ProjectCard(project)),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text("Add a project"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
