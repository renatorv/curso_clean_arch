import 'package:sqflite/sqflite.dart';
import 'package:tdd_tutorial/core/database/tables/habits_table.dart';
import 'package:tdd_tutorial/features/habits/data/datasources/habit_local_datasource.dart';

import '../../../../core/database/app_database.dart';
import '../models/habit_model.dart';

class HabitLocalDatasourceImpl implements HabitLocalDatasource {
  Future<Database> get _db async => AppDatabase.instance;

  @override
  Future<void> deleteHabit(String id) async {
    final db = await _db;

    await db.delete(habitsTableName, where: "id = ?", whereArgs: [id]);
  }

  @override
  Future<List<HabitModel>> getHabits() async {
    final db = await _db;

    final habitsMap = await db.query(habitsTableName);

    return habitsMap.map(HabitModel.fromMap).toList();
  }

  @override
  Future<void> insertHabit(HabitModel habit) async {
    final db = await _db;

    await db.insert(
      habitsTableName,
      habit.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> updateHabit(HabitModel habit) async {
    final db = await _db;

    await db.update(
      habitsTableName,
      habit.toMap(),
      where: "id = ?",
      whereArgs: [habit.id],
    );
  }
}
