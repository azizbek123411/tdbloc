import 'package:bloctd/isar_todo.dart';
import 'package:bloctd/repo.dart';
import 'package:bloctd/todomodel.dart';
import 'package:isar/isar.dart';

class IsarTodoRepo implements TodoRepo {
  final Isar db;

  IsarTodoRepo(this.db);

  @override
  Future<List<ToDo>> getTodos() async {
    final todos = await db.isarTodos.where().findAll();

    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  @override
  Future<void> addTodo(ToDo newTodo) {
    final todoIsar = IsarTodo.fromDomain(newTodo);
    return db.writeTxn(
      () => db.isarTodos.put(todoIsar),
    );
  }

  @override
  Future<void> deleteTodo(ToDo todo) async {
    await db.writeTxn(
      () => db.isarTodos.delete(todo.id),
    );
  }

  @override
  Future<void> updateTodo(ToDo todo) {
    final todoIsar = IsarTodo.fromDomain(todo);
    return db.writeTxn(
      () => db.isarTodos.put(todoIsar),
    );
  }
}
