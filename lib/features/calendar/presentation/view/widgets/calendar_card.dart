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
            child: TableCalendar(
              locale: 'ar',
              focusedDay: state.selectedDay,
              firstDay: DateTime(2000),
              lastDay: DateTime(2100),
              pageJumpingEnabled: true,
              pageAnimationEnabled: true,
              daysOfWeekVisible: true,
              headerVisible: !state.isWeek,
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
                titleCentered: false,
                leftChevronVisible: true,
                rightChevronVisible: true,
                formatButtonShowsNext: true,
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
          ),
        );
      },
    );
  }
}
