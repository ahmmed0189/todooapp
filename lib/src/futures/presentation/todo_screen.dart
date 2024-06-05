import 'package:flutter/material.dart';
import 'package:todooapp/src/data/database_repository.dart';
import 'package:todooapp/src/data/mock_database.dart';
import 'package:todooapp/src/futures/presentation/todo.dart';

class TodoScreen extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  const TodoScreen({super.key, required this.databaseRepository});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final MockDatabase _database = MockDatabase();
  final TextEditingController _controller = TextEditingController();

  void _addTodo() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _database.addTodo(Todo(title: _controller.text));
        _controller.clear();
      }
    });
  }

  void _removeTodoAt(int index) {
    setState(() {
      _database.removeTodo(_database.getTodos()[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(115, 217, 209, 209),
        title: const Text('Todo Liste'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration:
                  const InputDecoration(labelText: 'Neuen Todo hinzufügen'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addTodo,
              child: const Text('Hinzufügen'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _database.getTodos().length,
                itemBuilder: (context, index) {
                  final todo = _database.getTodos()[index];
                  return ListTile(
                    title: Text(todo.title),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _removeTodoAt(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
