import 'package:bloctd/repo.dart';
import 'package:bloctd/todomodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<ToDo>> {
  final TodoRepo todoRepo;

  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    final todoList = await todoRepo.getTodos();
    emit(todoList);
  }

  Future<void> addTodo(String text) async {
    final newTodo = ToDo(
      id: DateTime.now().millisecondsSinceEpoch,
      text: text,
    );
    await todoRepo.addTodo(newTodo);
    loadTodos();
  }

  Future<void>deleteTodo(ToDo todo)async{
    await todoRepo.deleteTodo(todo);
    loadTodos();
  }

  Future<void> toggleCompletion(ToDo todo)async{
    final updatedTodo=todo.toggleCompletion();

    await todoRepo.updateTodo(updatedTodo);
    loadTodos();
  }
}
