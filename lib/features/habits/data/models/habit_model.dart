import 'package:tdd_tutorial/features/habits/domain/entities/habit.dart';

import '../../../../core/database/tables/habits_table.dart';

class HabitModel {
  final String id;
  final String title;
  final DateTime createdAt;

  const HabitModel({
    required this.id,
    required this.title,
    required this.createdAt,
  });

  // PARA LER DO BD DE DEVOLVER PARA APLICAÇÃO
  factory HabitModel.fromMap(Map<String, dynamic> map) {
    return HabitModel(
      id: map[habitsTableId],
      title: map[habitsTableTitle],
      createdAt: DateTime.parse(map[habitsTableCreatedAt]),
    );
  }

  // PARA SALVAR NO BD
  Map<String, dynamic> toMap() {
    return {
      habitsTableId: id,
      habitsTableTitle: title,
      habitsTableCreatedAt: createdAt.toIso8601String(),
    };
  }

  Habit toEntity() {
    return Habit(id: id, title: title, createdAt: createdAt);
  }

  factory HabitModel.fromEntity(Habit habit) {
    return HabitModel(
      id: habit.id,
      title: habit.title,
      createdAt: habit.createdAt,
    );
  }
}
