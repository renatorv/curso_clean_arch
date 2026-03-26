import 'package:flutter/material.dart';
import 'package:tdd_tutorial/features/habits/presentation/cubit/habits_cubit.dart';

import '../../../../core/di/injector_container.dart';
import '../../domain/entities/habit.dart';

class HabitCard extends StatelessWidget {
  const HabitCard({super.key, required this.habit});

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    final cubit = sl<HabitsCubit>();
    return Card(
      child: ListTile(
        title: Text(habit.title),
        trailing: Column(
          children: [
            IconButton(
              onPressed: () {
                cubit.deleteHabit(habit.id);
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
