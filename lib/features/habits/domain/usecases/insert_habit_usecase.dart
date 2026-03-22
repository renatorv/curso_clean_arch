import 'package:tdd_tutorial/features/habits/domain/repositories/habit_repository.dart';

import '../entities/habit.dart';

class InsertHabitUsecase {
  final HabitRepository _repository;

  const InsertHabitUsecase(this._repository);

  Future<void> call(Habit habit) async {
    return await _repository.insert(habit);
  }
}
