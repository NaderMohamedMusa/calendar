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
              daysOfWeekVisible: !state.isWeek,
              headerVisible: !state.isWeek,
              daysOfWeekHeight: 32, // height for the day-of-week row
              rowHeight: 70, // height for each week row (increase this)
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
              calendarBuilders: state.isWeek
                  ? CalendarBuilders(
                selectedBuilder: (context,
                    date, _) {
                  final isWeek = context.read<CalendarCubit>().state.isWeek;

                  if (!isWeek) return null;

                  final isSelected = isSameDay(
                    date,
                    context.read<CalendarCubit>().state.selectedDay,
                  );

                  return Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF22BDB7)
                          : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _getDayNameShort(date),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF22BDB7)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                defaultBuilder: (context,
                    date, _) =>Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _getDayNameShort(date),
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height:12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
              )
                  :  CalendarBuilders() ,

              eventLoader: (day) {
                return const <String>[];
              },
            ),
          ),
        );
      },
    );
  }

  String _getDayNameShort(DateTime date) {
    const names = [
      'سبت',
      'أحد',
      'اثنين',
      'ثلاثاء',
      'أربعاء',
      'خميس',
      'جمعة',
    ];
    return names[date.weekday % 7];
  }

}
