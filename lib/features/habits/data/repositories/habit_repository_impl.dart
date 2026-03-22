import '../../domain/entities/habit.dart';
import '../../domain/repositories/habit_repository.dart';
import '../datasources/habit_local_datasource.dart';
import '../models/habit_model.dart';

class HabitRepositoryImpl implements HabitRepository {
  final HabitLocalDatasource _datasource;

  const HabitRepositoryImpl(this._datasource);

  @override
  Future<void> deleteHabit(String id) async {
    await _datasource.deleteHabit(id);
  }

  @override
  Future<List<Habit>> get() async {
    final models = await _datasource.getHabits();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> insert(Habit habit) async {
    await _datasource.insertHabit(HabitModel.fromEntity(habit));
  }

  @override
  Future<void> update(Habit habit) async {
    await _datasource.updateHabit(HabitModel.fromEntity(habit));
  }
}
