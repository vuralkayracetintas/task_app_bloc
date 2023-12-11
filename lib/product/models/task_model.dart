import 'package:equatable/equatable.dart';

class Task with EquatableMixin {
  final String title;
  final String id;
  final String description;
  bool? isDone;
  bool? isDeleted;

  Task({
    required this.title,
    required this.id,
    required this.description,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  @override
  List<Object?> get props => [title, isDone, isDeleted, id, description];

  Task copyWith({
    String? title,
    String? description,
    String? id,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'description': description,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> json) {
    return Task(
      title: json['title'] as String,
      id: json['id'] as String,
      description: json['description'] as String,
      isDone: json['isDone'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
    );
  }
}
