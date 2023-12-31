import 'package:flutter/material.dart';
import 'package:todo_app_bloc/blocs/bloc_exports.dart';
import 'package:todo_app_bloc/screens/complete_tasks_screen.dart';
import 'package:todo_app_bloc/screens/favorite_tasks_screen.dart';
import 'package:todo_app_bloc/screens/my_drawer.dart';
import 'package:todo_app_bloc/screens/pending_tasks_screen.dart';

import '../widgets/add_task_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({super.key});
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String,dynamic>> _pageDetails = [
    {'pageName':const PendingTasksScreen(),'title':'Pending Task'},
    {'pageName':const CompleteTasksScreen(),'title':'Completed Task'},
    {'pageName':const FavoriteTasksScreen(),'title':'Favorite Task'}
  ];
  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,//để khi bật bán phím lên thì phần nhập  nội dung ko bị che
      builder: (context) =>
          SingleChildScrollView(
            child: Container(
              padding:
              EdgeInsets.only(bottom: MediaQuery
                  .of(context)
                  .viewInsets
                  .bottom),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: AddTasks(),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: _selectedPageIndex == 0?FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ):null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label:'Pending Tasks'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.done),
              label:'Completed Tasks'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label:'Favorite Tasks'
          ),
        ],
      ),
    );
  }
}