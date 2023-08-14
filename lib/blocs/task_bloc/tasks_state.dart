part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completeTasks;
  final List<Task> favoriteTasks;
  final List<Task> removedTasks;

  const TasksState({
    this.pendingTasks = const <Task>[],
    this.completeTasks = const <Task>[],
    this.favoriteTasks = const <Task>[],
    this.removedTasks = const <Task>[],
  });

  @override
  List<Object> get props =>
      [pendingTasks, completeTasks, favoriteTasks, removedTasks];

  Map<String, dynamic> toMap() {
    return {
      'pendingTasks': pendingTasks,
      'completeTasks': completeTasks,
      'favoriteTasks': favoriteTasks,
      'removedTasks': removedTasks,
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pendingTasks: map['allTasks'] as List<Task>,
      completeTasks: map['completeTasks'] as List<Task>,
      favoriteTasks: map['favoriteTasks'] as List<Task>,
      removedTasks: map['removedTasks'] as List<Task>,
    );
  }
}
