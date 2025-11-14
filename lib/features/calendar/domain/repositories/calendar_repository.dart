import '../entities/session_entity.dart';

abstract class CalendarRepository {
  Future<List<SessionEntity>> getSessionsByDate(DateTime date);
}
