import 'package:equatable/equatable.dart';

class Task with EquatableMixin {
  final String title;
  final String id;
  bool? isDone;
  bool? isDeleted;

  Task({
    required this.title,
    required this.id,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  @override
  List<Object?> get props => [title, isDone, isDeleted, id];

  Task copyWith({
    String? title,
    String? id,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> json) {
    return Task(
      title: json['title'] as String,
      id: json['id'] as String,
      isDone: json['isDone'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
    );
  }
}
