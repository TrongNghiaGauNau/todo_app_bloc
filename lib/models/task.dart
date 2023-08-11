
import 'package:equatable/equatable.dart';

class Task extends Equatable{
  final String title;
  bool? isDone;
  bool? isDelete;

  Task({
    required this.title,
    this.isDone,
    this.isDelete,
  }){
    isDone = isDone?? false ;
    isDelete = isDelete ?? false;
  }

  Task copyWith({
    String? title,
    bool? isDone,
    bool? isDelete,
  }) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDelete: isDelete ?? this.isDelete,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'isDone': this.isDone,
      'isDelete': this.isDelete,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      isDone: map['isDone'],
      isDelete: map['isDelete'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    title,
    isDone,
    isDelete,
  ];
}