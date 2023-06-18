import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threev_project_manager_app/src/features/dashboard/data/dummy_data.dart';
import 'package:threev_project_manager_app/src/features/dashboard/models/project.dart';
import 'package:uuid/uuid.dart';

abstract class ProjectsRepository {
  List<Project> getProjects();
}

class FakeProjectsRepository implements ProjectsRepository {
  @override
  List<Project> getProjects() {
    return dummyProjects;
  }
}

final projectsRepositoryProvider = Provider(
  (ref) => FakeProjectsRepository(),
);
final projectsProvider = Provider(
  (ref) => ref
      .watch(
        projectsRepositoryProvider,
      )
      .getProjects(),
);
