import 'package:bloctd/todomodel.dart';

abstract class TodoRepo{
  Future<List<ToDo>> getTodos();

  Future<void> addTodo(ToDo newTodo);

  Future<void> updateTodo(ToDo todo);

  Future<void> deleteTodo(ToDo todo);

}