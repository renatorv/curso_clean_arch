abstract class DeleteHabitState {}

class DeleteHabitStateInitial implements DeleteHabitState {}

class DeletingHabitState implements DeleteHabitState {
  final String deleteId;

  DeletingHabitState(this.deleteId);
}

class SuccessDeletetingHabitState implements DeleteHabitState {}

class ErrorDeletingHabitState implements DeleteHabitState {
  final String error;

  ErrorDeletingHabitState(this.error);
}
