import 'package:nader_mohamed_task/core/src/app_export.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.router;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Calendar Clean Arch',
      locale: const Locale('ar'),
      builder: (context, child) => Directionality(
          textDirection: TextDirection.rtl, child: child!),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F6F7),
        primaryColor: const Color(0xFF005C5B),
        fontFamily: 'Cairo',
      ),
      routerConfig: router,
    );
  }
}
