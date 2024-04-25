import 'package:flutter/material.dart';
import '../data/strings.dart';

class TaskFooter extends StatelessWidget {
  final int taskLevel;

  const TaskFooter({super.key, required this.taskLevel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                backgroundColor: Colors.black12,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                value: taskLevel / 10,
              )
          ),
          Text(
            "${Strings.level} $taskLevel",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
