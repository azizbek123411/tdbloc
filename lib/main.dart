import 'package:bloctd/home.dart';
import 'package:bloctd/isar_todo.dart';
import 'package:bloctd/isartodorepo.dart';
import 'package:bloctd/repo.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [IsarTodoSchema],
    directory: dir.path,
  );

  final isarTodoRepo=IsarTodoRepo(isar);
  
  runApp( MyApp(todoRepo: isarTodoRepo,));
}

class MyApp extends StatelessWidget {
  final TodoRepo todoRepo;
   const MyApp({super.key,required this.todoRepo});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(todoRepo: todoRepo),
    );
  }
}
