import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_bloc/blocs/bloc_exports.dart';
import '../../models/task.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
          pendingTasks: List.from(state.pendingTasks)..add(event.task),
          completeTasks: state.completeTasks,
          favoriteTasks: state.favoriteTasks,
          removedTasks: state.removedTasks),
    );
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    //biến xử lý giữ nguyên vị trí của giá trị cần thay đổi trên list
    // final int index = state.allTasks.indexOf(task);

    List<Task> pendingTasks = List.from(state.pendingTasks)..remove(task);
    List<Task> completeTasks = List.from(state.completeTasks)..remove(task);
    //add sẽ chỉ add giá trị vào vị trí cuối cùng nên sẽ làm thay đổi thứ tự list
    // task.isDone == false
    //     ? allTasks.add(task.copyWith(isDone: true))
    //     : allTasks.add(task.copyWith(isDone: false));
    task.isDone == false
        ? {
            pendingTasks = List.from(pendingTasks)..remove(task),
            completeTasks = List.from(completeTasks)
              ..insert(0, task.copyWith(isDone: true)),
          }
        : {
            completeTasks = List.from(completeTasks)..remove(task),
            pendingTasks = List.from(pendingTasks)
              ..insert(0, task.copyWith(isDone: false)),
          };
    emit(
      TasksState(
          pendingTasks: pendingTasks,
          completeTasks: completeTasks,
          favoriteTasks: state.favoriteTasks,
          removedTasks: state.removedTasks),
    );
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        pendingTasks: state.pendingTasks,
        completeTasks: state.completeTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: List.from(state.removedTasks)..remove(event.task),
      ),
    );
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        completeTasks: List.from(state.completeTasks)..remove(event.task),
        favoriteTasks: List.from(state.favoriteTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDelete: true)),
      ),
    );
  }
//
// @override
// TasksState? fromJson(Map<String, dynamic> json) {
//   return TasksState.fromMap(json);
// }
//
// @override
// Map<String, dynamic>? toJson(TasksState state) {
//   return state.toMap();
// }
}
