import '../repositories/calendar_repository.dart';
import '../entities/session_entity.dart';

class GetSessionsByDate {
  final CalendarRepository repository;
  GetSessionsByDate(this.repository);

  Future<List<SessionEntity>> call(DateTime date) => repository.getSessionsByDate(date);
}
