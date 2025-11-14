part of 'calendar_cubit.dart';

class CalendarState {
  final DateTime selectedDay;
  final List<SessionEntity> sessions;
  final bool loading;
  final bool isWeek;

  CalendarState({
    required this.selectedDay,
    required this.sessions,
    required this.loading,
    required this.isWeek,
  });

  CalendarState copyWith({
    DateTime? selectedDay,
    List<SessionEntity>? sessions,
    bool? loading,
    bool? isWeek,
  }) {
    return CalendarState(
      selectedDay: selectedDay ?? this.selectedDay,
      sessions: sessions ?? this.sessions,
      loading: loading ?? this.loading,
      isWeek: isWeek ?? this.isWeek,
    );
  }
}