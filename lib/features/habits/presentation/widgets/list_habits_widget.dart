import 'package:flutter/material.dart';

import '../../domain/entities/habit.dart';
import 'habit_card.dart';

class ListHabitsWidget extends StatelessWidget {
  final List<Habit> habits;
  const ListHabitsWidget({super.key, required this.habits});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final habit = habits[index];
        return HabitCard(habit: habit);
      },
      itemCount: habits.length,
    );
  }
}
