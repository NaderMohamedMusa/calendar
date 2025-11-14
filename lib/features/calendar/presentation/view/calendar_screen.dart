import 'package:nader_mohamed_task/core/src/app_export.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CalendarCubit>(),
      child: const _CalendarScreenContent(),
    );
  }
}

class _CalendarScreenContent extends StatelessWidget {
  const _CalendarScreenContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF005C5B),
      body: Column(
        children: [
          SizedBox(height: 12),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back, color: Colors.white,size: 16),
              ),
              const SizedBox(width: 16),
              Text(
                "التقويم",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: 12),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CalendarCard(),
                  ),
                  SizedBox(height: 12),
                  Expanded(child: SessionsArea()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}