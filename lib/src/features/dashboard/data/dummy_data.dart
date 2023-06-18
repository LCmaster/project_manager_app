import 'package:threev_project_manager_app/src/features/dashboard/models/project.dart';
import 'package:uuid/uuid.dart';

final dummyProjects = [
  Project(
    id: const Uuid().v4(),
    name: "Dummy Project",
    description: "A brief description of a very fake project.",
  ),
];
