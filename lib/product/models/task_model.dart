import 'package:equatable/equatable.dart';

class Task with EquatableMixin {
  final String id;
  final String title;
  final String description;
  final String date;
  bool? isFavorite;
  bool? isDone;
  bool? isDeleted;

  Task({
    required this.id,
    required this.date,
    required this.title,
    required this.description,
    this.isFavorite,
    this.isDone,
    this.isDeleted,
  }) {
    isFavorite = isFavorite ?? false;
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  @override
  List<Object?> get props => [
        title,
        isDone,
        isDeleted,
        isFavorite,
        date,
        id,
        description,
      ];

  Task copyWith({
    String? title,
    String? description,
    String? id,
    String? date,
    bool? isFavorite,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      date: date ?? this.date,
      isFavorite: isFavorite ?? this.isFavorite,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'description': description,
      'date': date,
      'isFavorite': isFavorite,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> json) {
    return Task(
      title: json['title'] as String,
      id: json['id'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      isFavorite: json['isFavorite'] as bool?,
      isDone: json['isDone'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
    );
  }
}
