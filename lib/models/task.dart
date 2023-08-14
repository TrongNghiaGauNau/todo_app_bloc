import 'package:equatable/equatable.dart';

class Task extends Equatable{
  final String title;
  final String description;
  final String id;
  bool? isDone;
  bool? isDelete;
  Task({
    required this.title,
    required this.id,
    required this.description,
    this.isDone,
    this.isDelete,
  }){
    isDone = isDone?? false ;
    isDelete = isDelete ?? false;
  }

  Task copyWith({
    String? title,
    String? description,
    String? id,
    bool? isDone,
    bool? isDelete,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDelete: isDelete ?? this.isDelete,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'isDone': isDone,
      'isDelete': isDelete,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      id: map['id'] ?? '',
      isDone: map['isDone'],
      isDelete: map['isDelete'],
    );
  }

  @override
  List<Object?> get props => [
    title,
    description,
    id,
    isDone,
    isDelete,
  ];
}