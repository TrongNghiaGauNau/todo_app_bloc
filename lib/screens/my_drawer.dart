import 'package:flutter/material.dart';
import 'package:todo_app_bloc/blocs/bloc_exports.dart';
import 'package:todo_app_bloc/screens/recycle_bin.dart';
import 'package:todo_app_bloc/screens/tabs_screen.dart';
import 'package:todo_app_bloc/screens/pending_tasks_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //để cái drawer ko có lấn lên thanh công cụ điện thoại
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.grey,
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return ListTile(
                  //pushReplacementNamed để khi bấm back sẽ ko stack quá nhiều trang
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(TabsScreen.id),
                  leading: const Icon(Icons.folder_special),
                  title: const Text('My Tasks'),
                  trailing: Text('${state.pendingTasks.length}'),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return ListTile(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                  leading: const Icon(Icons.delete),
                  title: const Text('Bin'),
                  trailing: Text('${state.removedTasks.length}'),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(value: state.switchValue, onChanged: (newValue) {
                  newValue
                  ?context.read<SwitchBloc>().add(SwitchOnEvent(context: context))
                  :context.read<SwitchBloc>().add(SwitchOffEvent(context: context));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
