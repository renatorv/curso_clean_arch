import '../repositories/habit_repository.dart';

class DeletHabitUsecase {
  final HabitRepository _repository;

  const DeletHabitUsecase(this._repository);

  Future<void> call(String id) async {
    return await _repository.deleteHabit(id);
  }
}
