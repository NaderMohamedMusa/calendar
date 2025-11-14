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
          SizedBox(height: 30),
          /// --- Header ---
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back, color: Colors.white, size: 16),
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

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),

                  /// ------------------------------
                  /// New Tabs Instead of Button
                  /// ------------------------------
                  BlocBuilder<CalendarCubit, CalendarState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _CalendarTab(
                              title: "شهري",
                              selected: !state.isWeek,
                              onTap: () => context.read<CalendarCubit>().setView(isWeek: false),
                            ),
                            const SizedBox(width: 12),
                            _CalendarTab(
                              title: "اسبوعي",
                              selected: state.isWeek,
                              onTap: () => context.read<CalendarCubit>().setView(isWeek: true),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  /// ---- Calendar ----
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: CalendarCard(),
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text("الوقت", style: TextStyle(color: Colors.grey, fontSize: 12)),
                        const SizedBox(width: 35),
                        Text("الجلسة", style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),

                  Expanded(child: SessionsArea()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// -----------------------------------------
/// Custom Tab Widget (Month / Week)
/// -----------------------------------------
class _CalendarTab extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _CalendarTab({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 60),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selected
                  ? const Color(0xFF22BDB7)
                  : Colors.transparent,
              width: 2,
            ),
          )
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.black : Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
