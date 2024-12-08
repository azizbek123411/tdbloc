import 'package:bloctd/todo_cubit.dart';
import 'package:bloctd/todomodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  void showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              controller: textController,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  todoCubit.addTodo(
                    textController.text,
                  );
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'To Do app with BLoC',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showAddTodoBox(context);
        },
      ),
      body: BlocBuilder<TodoCubit, List<ToDo>>(
        builder: (context, todos) {
          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(
                    todo.text,
                    style: TextStyle(
                        fontSize: 20,
                        color: !todo.isComplete ? Colors.black : Colors.grey,
                        decoration: todo.isComplete
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  leading: Checkbox(
                    value: todo.isComplete,
                    onChanged: (bool? value) =>
                        todoCubit.toggleCompletion(todo),
                  ),
                  trailing: IconButton(
                    onPressed: () => todoCubit.deleteTodo(todo),
                    icon: const Icon(
                      Icons.delete,
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
