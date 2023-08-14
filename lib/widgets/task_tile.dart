import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_bloc/blocs/bloc_exports.dart';
import 'package:todo_app_bloc/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});

  final Task task;

  void _removeOrDeleteTasks(BuildContext context, Task task) {
    task.isDelete!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.star_outline),
                const SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          decoration: task.isDone! ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      Text(DateFormat().add_yMEd().format(DateTime.now())),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            value: task.isDone,
            onChanged: task.isDelete == false
                ? (value) {
                    context.read<TasksBloc>().add(UpdateTask(task: task));
                  }
                : null,
          ),
        ],
      ),
    );
  }
}

//
// ListTile(
// title: Text(
// task.title,
// overflow: TextOverflow.ellipsis,//dể title ko bị dài quá
// style: TextStyle(
// decoration: task.isDone!?TextDecoration.lineThrough:null,
// ),),
// trailing: Checkbox(
// onChanged: task.isDelete ==false?(value) {
// context.read<TasksBloc>().add(UpdateTask(task: task));
// }:null,
// value: task.isDone,
// ),
// onLongPress:() => _removeOrDeleteTasks(context, task),
// );
