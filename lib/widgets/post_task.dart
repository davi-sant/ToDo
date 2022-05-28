import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/model_todo.dart';

class PostTask extends StatelessWidget {
  const PostTask({
    Key? key,
    required this.onDelet,
    required this.postTask,
  }) : super(key: key);

  final Todo postTask;
  final Function(Todo) onDelet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                onDelet(postTask);
              },
              spacing: 0.20,
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.task_alt, color: Colors.blue),
            Expanded(
              child: ListTile(
                title: Text(
                  postTask.title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  postTask.timeDate,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
*/