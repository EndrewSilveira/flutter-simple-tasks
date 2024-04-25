import 'package:flutter/material.dart';
import 'package:project_mars/widgets/task_footer.dart';
import 'package:project_mars/widgets/task_header.dart';
import '../data/strings.dart';
import '../model/task.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  final VoidCallback onDeleteTask;

  const TaskItem({super.key, required this.task, required this.onDeleteTask});

  @override
  State<TaskItem> createState() => _TaskState();
}

class _TaskState extends State<TaskItem> {
  int _level = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 0,
      borderOnForeground: false,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      color: Colors.blue,
      child: InkWell(
        onLongPress: () => _showDeleteDialog(context),
        child: Column(
          children: [
            TaskHeader(
              taskTitle: widget.task.title,
              taskImage: widget.task.image,
              taskDifficulty: double.parse(widget.task.difficulty),
              onLevelUpPressed: () {
                setState(() {
                    if (_level < 10) {
                      _level++;
                    }
                  },
                );
              },
              onRatingUpdated: (rating) {},
            ),
            TaskFooter(taskLevel: _level)
          ],
        ),
      ),
    );
  }

  _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(Strings.deleteTask),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        surfaceTintColor: Colors.white,
        content: const Text(Strings.deleteTaskMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, Strings.no),
            child: const Text(Strings.no),
          ),
          TextButton(
            onPressed: () {
              widget.onDeleteTask();
              Navigator.pop(context, Strings.yes);
            },
            child: const Text(
              Strings.yes,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
