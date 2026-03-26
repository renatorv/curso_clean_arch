import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_tutorial/features/habits/presentation/cubit/habits_cubit.dart';
import 'package:tdd_tutorial/features/habits/presentation/cubit/habits_state.dart';
import 'package:tdd_tutorial/features/habits/presentation/widgets/empty_habit_view_widget.dart';
import 'package:tdd_tutorial/features/habits/presentation/widgets/error_habit_view_widget.dart';
import 'package:tdd_tutorial/features/habits/presentation/widgets/habits_form_dialog.dart';
import 'package:tdd_tutorial/features/habits/presentation/widgets/list_habits_widget.dart';

import '../../../../core/di/injector_container.dart';
import '../widgets/loading_habits_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final habitsCubit = sl<HabitsCubit>();

  @override
  void initState() {
    super.initState();

    habitsCubit.getHabits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Habits')),
      body: BlocBuilder<HabitsCubit, HabitsState>(
        bloc: habitsCubit,
        builder: (context, state) {
          if (state is HabitsLoading) {
            return LoadingHabitsViewWidget();
          }
          if (state is HabitsLoaded) {
            if (state.habits.isEmpty) {
              return EmptyHabitViewWidget();
            }
            return ListHabitsWidget(habits: state.habits);
          }
          if (state is HabitsError) {
            return ErrorHabitViewWidget(error: state.error);
          }
          return SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => HabitsFormDialog(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
