import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:threev_project_manager_app/src/features/dashboard/pages/dashboard_page.dart';
import 'package:threev_project_manager_app/src/features/project/pages/project_page.dart';
import 'package:threev_project_manager_app/src/features/project/pages/task_details_page.dart';

class AppRouter {
  static final dashboard = GoRoute(
      path: "/",
      name: "DASHBOARD",
      builder: (context, state) => DashboardPage(),
      routes: [
        project,
      ]);
  static final project = GoRoute(
      path: "project/:id",
      name: "PROJECT",
      builder: (context, state) => ProjectPage(),
      routes: [
        GoRoute(
          path: "task",
          pageBuilder: (context, state) {
            return MaterialPage(
              fullscreenDialog: true,
              child: TaskDetailsPage(
                  status: "Open",
                  attachments: 2,
                  category: "Development",
                  description: "Description..."),
            );
          },
        ),
      ]);

  static final router = GoRouter(
    routes: [
      dashboard,
    ],
  );
}
