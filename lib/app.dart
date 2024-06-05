import 'package:flutter/material.dart';
import 'package:todooapp/src/data/database_repository.dart';
import 'package:todooapp/src/data/mock_database.dart';
import 'package:todooapp/src/futures/presentation/todo_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseRepository databaseRepository = MockDatabase();
    return MaterialApp(
      home: TodoScreen(
        databaseRepository: databaseRepository,
      ),
    );
  }
}
