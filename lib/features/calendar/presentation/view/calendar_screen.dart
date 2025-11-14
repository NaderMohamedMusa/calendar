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
      appBar: AppBar(
        title: const Text('التقويم'),
        backgroundColor: const Color(0xFF005C5B),
        elevation: 0,
        titleTextStyle: const TextStyle(color: Colors.white),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back,color: Colors.white)
        ),
      ),
      body: Column(
        children: const [
          SizedBox(height: 12),
          Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: _CalendarCard()),
          SizedBox(height: 12),
          Expanded(child: _SessionsArea()),
        ],
      ),
    );
  }
}

class _CalendarCard extends StatelessWidget {
  const _CalendarCard();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(builder: (context, state) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(child: Text('')), // placeholder for tabs
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: const Color(0xFFEFF7F6), borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => context.read<CalendarCubit>().toggleView(),
                          child: Text(state.isWeek ? 'اسبوعي' : 'شهري', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () => context.read<CalendarCubit>().toggleView(),
                          icon: const Icon(Icons.swap_horiz),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              TableCalendar(
                locale: 'ar',
                focusedDay: state.selectedDay,
                firstDay: DateTime(2000),
                lastDay: DateTime(2100),
                calendarFormat: state.isWeek ? CalendarFormat.week : CalendarFormat.month,
                startingDayOfWeek: StartingDayOfWeek.saturday,
                selectedDayPredicate: (day) => isSameDay(day, state.selectedDay),
                onDaySelected: (selectedDay, focusedDay) {
                  context.read<CalendarCubit>().changeDay(selectedDay);
                },
                headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true, leftChevronVisible: true, rightChevronVisible: true),
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(color: Color(0xFF22BDB7), shape: BoxShape.circle),
                  todayDecoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
                  markerDecoration: BoxDecoration(color: Color(0xFF22BDB7), shape: BoxShape.circle),
                  markersMaxCount: 3,
                ),
                eventLoader: (day) {
                  if ([5, 12, 14, 19, 24].contains(day.day)) return ['x'];
                  return const <String>[];
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _SessionsArea extends StatelessWidget {
  const _SessionsArea();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(builder: (context, state) {
      if (state.loading) return const Center(child: CircularProgressIndicator());
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ListView.separated(
                itemCount: state.sessions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final s = state.sessions[index];
                  return SessionCard(session: s);
                },
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 110,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.separated(
                itemCount: state.sessions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final s = state.sessions[index];
                  return Column(
                    children: [
                      Text(_formatTime(s.startTime), style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(_formatTime(s.endTime), style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }

  String _formatTime(DateTime t) {
    final String hour = t.hour.toString().padLeft(2, '0');
    final String minute = t.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}