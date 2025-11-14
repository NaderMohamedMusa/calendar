import 'package:nader_mohamed_task/core/src/app_export.dart';

class CalendarCard extends StatelessWidget {
  const CalendarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (context, state) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(child: Text('')), // placeholder for tabs
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF7F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () =>
                                context.read<CalendarCubit>().toggleView(),
                            child: Text(
                              state.isWeek ? 'اسبوعي' : 'شهري',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: () =>
                                context.read<CalendarCubit>().toggleView(),
                            icon: const Icon(Icons.swap_horiz),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TableCalendar(
                  locale: 'ar',
                  focusedDay: state.selectedDay,
                  firstDay: DateTime(2000),
                  lastDay: DateTime(2100),
                  calendarFormat: state.isWeek
                      ? CalendarFormat.week
                      : CalendarFormat.month,
                  startingDayOfWeek: StartingDayOfWeek.saturday,
                  selectedDayPredicate: (day) =>
                      isSameDay(day, state.selectedDay),
                  onDaySelected: (selectedDay, focusedDay) {
                    context.read<CalendarCubit>().changeDay(selectedDay);
                  },
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    leftChevronVisible: true,
                    rightChevronVisible: true,
                  ),
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Color(0xFF22BDB7),
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    markerDecoration: BoxDecoration(
                      color: Color(0xFF22BDB7),
                      shape: BoxShape.circle,
                    ),
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
      },
    );
  }
}
