import 'package:nader_mohamed_task/core/src/app_export.dart';
part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  final GetSessionsByDate getSessionsByDate;

  CalendarCubit(this.getSessionsByDate)
      : super(CalendarState(selectedDay: DateTime.now(),
      sessions: const [], loading: false, isWeek: false)) {
    loadSessions(state.selectedDay);
  }

  void setView({required bool isWeek}) {
    emit(state.copyWith(isWeek: isWeek));
  }

  void changeDay(DateTime day) async {
    emit(state.copyWith(selectedDay: day, loading: true));
    await loadSessions(day);
  }

  Future<void> loadSessions(DateTime day) async {
    emit(state.copyWith(loading: true));
    final List<SessionEntity> data = await getSessionsByDate(day);
    emit(state.copyWith(sessions: data, loading: false));

  }
}
