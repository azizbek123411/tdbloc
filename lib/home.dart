import 'package:bloctd/repo.dart';
import 'package:bloctd/todo_cubit.dart';
import 'package:bloctd/todoview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  final TodoRepo todoRepo;

  const Home({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(todoRepo),
      child: const TodoView(),
    );
  }
}
