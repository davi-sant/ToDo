import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:to_do_list/widgets/app_bar.dart';
import 'package:to_do_list/widgets/text_field_widget.dart';
import '../models/model_todo.dart';
import '../widgets/post_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerText = TextEditingController();

  List<Todo> postTask = [];

  Todo? saveDeletedTask;
  int? taskPosition;

  getDate() {
    DateFormat typeFormatDate = DateFormat("dd/MMM - HH:mm");
    String date = typeFormatDate.format(DateTime.now()).toString();
    return date;
  }

  void addTask() {
    String text = controllerText.text;

    bool emptyField = text.isEmpty;
    Function addTask = postTask.add;
    setState(() {
      Todo newTodo = Todo(title: text, timeDate: getDate());
      emptyField ? null : addTask(newTodo);
    });
    controllerText.clear();
  }

  void onDelet(Todo task) {
    saveDeletedTask = task;
    taskPosition = postTask.indexOf(task);
    setState(() {
      postTask.remove(task);
    });

    menssageOfDelete();
  }

  void menssageOfDelete() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: const [
            Icon(
              Icons.delete,
              size: 16,
              color: Colors.blue,
            ),
            SizedBox(width: 5.0),
            Text("a tarefa foi deletada"),
          ],
        ),
        action: SnackBarAction(
          onPressed: () => restoreDeletion(),
          label: "Desfazer",
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  restoreDeletion() {
    void restoringData = postTask.insert(taskPosition!, saveDeletedTask!);
    setState(() {
      restoringData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarWidget(),
            Expanded(
              child: ListView(
                children: [
                  for (Todo task in postTask)
                    PostTask(postTask: task, onDelet: onDelet),
                ],
              ),
            ),
            TextFieldWidget(
              controller: controllerText,
              press: addTask,
              hinText: "Add Task",
            ),
          ],
        ),
      ),
    );
  }
}
