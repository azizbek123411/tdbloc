import 'package:bloctd/todomodel.dart';
import 'package:isar/isar.dart';
part 'isar_todo.g.dart';

@collection
class IsarTodo {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  ToDo toDomain() {
    return ToDo(
      id: id,
      text: text,
      isComplete: isCompleted,
    );

  }

  static IsarTodo fromDomain (ToDo todo){
    return IsarTodo()
      ..id=todo.id
    ..text=todo.text
    ..isCompleted=todo.isComplete;
  }
}
