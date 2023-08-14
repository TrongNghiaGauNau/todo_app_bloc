import 'package:flutter/material.dart';
import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';

class FavoriteTasksScreen extends StatelessWidget {
  const FavoriteTasksScreen({super.key});
  static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.favoriteTasks;
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(label: Text('${tasksList.length} Tasks:')),
              ),
              TasksList(taskList: tasksList)
            ],
          ),
        );
      },
    );
  }
}
