import '../models/session_model.dart';

class CalendarRemoteDatasource {
  Future<List<SessionModel>> getSessions(DateTime date) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return List.generate(6, (i) {
      final startHour = 9 + i;
      final startMinute = i == 0 ? 30 : 0;
      final start = DateTime(date.year, date.month, date.day, startHour, startMinute);
      final end = start.add(const Duration(minutes: 15));
      return SessionModel(
        caseNumber: 'ZI-3236-2024',
        caseType: 'ربط وغرامة',
        startTime: start,
        endTime: end,
      );
    });
  }
}