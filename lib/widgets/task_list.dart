import 'package:flutter/material.dart';
import 'package:todo_app_bloc/models/task.dart';
class TasksList extends StatelessWidget{
  const TasksList({super.key,required this.taskList});

  final List<Task> taskList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            var task = taskList[index];
            return ListTile(
              title: Text(task.title),
              trailing: Checkbox(
                onChanged: (value) {

                },
                value: task.isDone,
              ),
            );
          }
      ),
    );
  }
}