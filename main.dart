import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();

  void addTask() {
    String text = taskController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        tasks.add(text);
      });
      taskController.clear();
    }
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do App"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(hintText: "Enter task"),
                  ),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: addTask,
                  child: Text("Add"),
                )
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]),
                  onTap: () {
                    removeTask(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
