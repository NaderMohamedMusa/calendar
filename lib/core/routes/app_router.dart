import 'package:nader_mohamed_task/core/src/app_export.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const CalendarScreen(),
      ),
    ],
  );
}
