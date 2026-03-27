import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_tutorial/features/habits/domain/usecases/delete_habit_usecase.dart';
import 'package:tdd_tutorial/features/habits/presentation/cubit/delete_habit_state.dart';

class DeleteHabitCubit extends Cubit<DeleteHabitState> {
  final DeleteHabitUsecase _deleteHabitUsecase;
  DeleteHabitCubit(this._deleteHabitUsecase) : super(DeleteHabitStateInitial());

  Future<void> deleteHabit(String id) async {
    emit(DeletingHabitState(id));
    try {
      await Future.delayed(Duration(seconds: 2));
      await _deleteHabitUsecase(id);
      emit(SuccessDeletetingHabitState());
      // await getHabits();
    } catch (e) {
      emit(ErrorDeletingHabitState(e.toString()));
    }
  }
}
