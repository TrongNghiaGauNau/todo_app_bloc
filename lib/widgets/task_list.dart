import 'package:flutter/material.dart';
import 'package:todo_app_bloc/models/task.dart';
import 'package:todo_app_bloc/widgets/task_tile.dart';
import '../blocs/bloc_exports.dart';
class TasksList extends StatelessWidget{
  const TasksList({super.key,required this.taskList});

  final List<Task> taskList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList.map((task) => ExpansionPanelRadio(
                value: task.id,//value phải duy nhất
                headerBuilder: (context,isOpen) //return what the first line of this panel will be
                =>TaskTile(task: task),
                body: ListTile(
                  title: SelectableText.rich(
                    TextSpan(children: [
                      const TextSpan(
                        text: 'Text\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      TextSpan(text: '${task.title}\n'),
                      const TextSpan(
                          text: 'Description\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )
                      ),
                      TextSpan(text: task.description),
                    ]),
                  ),
                ),
            )).toList(),
        ),
      ),
    );
  }
}


// Expanded(
// child: ListView.builder(
// itemCount: taskList.length,
// itemBuilder: (context, index) {
// var task = taskList[index];
// return TaskTile(task: task);
// }
// ),
// );