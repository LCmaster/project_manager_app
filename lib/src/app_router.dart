import 'package:go_router/go_router.dart';
import 'package:threev_project_manager_app/src/features/dashboard/pages/dashboard_page.dart';
import 'package:threev_project_manager_app/src/features/project/pages/project_page.dart';

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
  );

  static final router = GoRouter(
    routes: [
      dashboard,
    ],
  );
}
