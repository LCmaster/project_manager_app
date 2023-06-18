import 'package:go_router/go_router.dart';
import 'package:threev_project_manager_app/src/features/dashboard/pages/dashboard_page.dart';

class AppRouter {
  static final dashboard = GoRoute(
    path: "/",
    builder: (context, state) => DashboardPage(),
  );

  static final router = GoRouter(
    routes: [
      dashboard,
    ],
  );
}
