import 'package:tdd_tutorial/features/habits/domain/entities/habit.dart';
import 'package:tdd_tutorial/features/habits/domain/repositories/habit_repository.dart';

class UpdateHabitUsecase {
  final HabitRepository _repository;

  const UpdateHabitUsecase(this._repository);

  Future<void> call(Habit habit) async {
    return await _repository.update(habit);
  }
}
