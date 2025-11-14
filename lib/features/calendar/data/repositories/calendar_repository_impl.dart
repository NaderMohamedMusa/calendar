import '../../domain/entities/session_entity.dart';
import '../../domain/repositories/calendar_repository.dart';
import '../datasources/calendar_remote_datasource.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarRemoteDatasource datasource;
  CalendarRepositoryImpl(this.datasource);

  @override
  Future<List<SessionEntity>> getSessionsByDate(DateTime date) {
    return datasource.getSessions(date);
  }
}
