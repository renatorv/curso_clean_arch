import 'package:get_it/get_it.dart';
import 'package:tdd_tutorial/features/habits/data/datasources/habit_local_datasource.dart';
import 'package:tdd_tutorial/features/habits/data/datasources/habit_local_datasource_impl.dart';
import 'package:tdd_tutorial/features/habits/data/repositories/habit_repository_impl.dart';
import 'package:tdd_tutorial/features/habits/domain/repositories/habit_repository.dart';
import 'package:tdd_tutorial/features/habits/domain/usecases/delete_habit_usecase.dart';
import 'package:tdd_tutorial/features/habits/domain/usecases/get_habit_usecase.dart';
import 'package:tdd_tutorial/features/habits/domain/usecases/insert_habit_usecase.dart';
import 'package:tdd_tutorial/features/habits/domain/usecases/update_habit_usecase.dart';
import 'package:tdd_tutorial/features/habits/presentation/cubit/habits_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Data Source
  sl.registerLazySingleton<HabitLocalDatasource>(
    () => HabitLocalDatasourceImpl(),
  );

  // Repositório
  sl.registerLazySingleton<HabitRepository>(() => HabitRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => DeleteHabitUsecase(sl()));
  sl.registerLazySingleton(() => GetHabitUsecase(sl()));
  sl.registerLazySingleton(() => InsertHabitUsecase(sl()));
  sl.registerLazySingleton(() => UpdateHabitUsecase(sl()));

  // Cubits
  sl.registerLazySingleton(() => HabitsCubit(sl(), sl(), sl(), sl()));
}
