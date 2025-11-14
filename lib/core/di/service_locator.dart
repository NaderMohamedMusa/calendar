import 'package:nader_mohamed_task/core/src/app_export.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // datasources
  sl.registerLazySingleton(() => CalendarRemoteDatasource());

  sl.registerLazySingleton<CalendarRepository>(
        () => CalendarRepositoryImpl(sl()),
  );

  // repositories
  sl.registerLazySingleton(() => CalendarRepositoryImpl(sl()));

  // usecases
  sl.registerLazySingleton(() => GetSessionsByDate(sl()));

  // cubit
  sl.registerFactory(() => CalendarCubit(sl()));
}
