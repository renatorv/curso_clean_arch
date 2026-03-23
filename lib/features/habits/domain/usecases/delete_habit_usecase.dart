import '../repositories/habit_repository.dart';

class DeleteHabitUsecase {
  final HabitRepository _repository;

  const DeleteHabitUsecase(this._repository);

  Future<void> call(String id) async {
    return await _repository.deleteHabit(id);
  }
}
