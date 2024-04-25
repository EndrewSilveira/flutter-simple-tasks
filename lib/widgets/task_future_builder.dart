import 'package:flutter/material.dart';
import 'package:project_mars/data/strings.dart';
import 'package:project_mars/data/task_dao.dart';
import 'package:project_mars/model/task.dart';
import 'package:project_mars/widgets/no_tasks_tile.dart';
import 'package:project_mars/widgets/task_item.dart';

class TaskFutureBuilder extends StatefulWidget {
  const TaskFutureBuilder({super.key});

  @override
  State<StatefulWidget> createState() => _TaskFutureBuilderState();
}

class _TaskFutureBuilderState extends State<TaskFutureBuilder> {
  TaskDao taskDao = TaskDao();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: taskDao.findAll(),
      builder: (context, snapshot) {
        List<Task>? items = snapshot.data;
        switch (snapshot.connectionState) {

          case ConnectionState.none:
            return const Center(
              child: ListTile(
                title: Text(Strings.theresNoTasksYet),
              ),
            );

          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());

          case ConnectionState.active:
            return const NoTasksTile();

          case ConnectionState.done:
            return snapshot.hasData && items != null && items.isNotEmpty
                ? ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (_, index) {
                      return TaskItem(
                        task: items[index],
                        onDeleteTask: () => setState(() {
                          taskDao.delete(items[index].id);
                        }),
                      );
                    },
                  )
                : const NoTasksTile();
        }
      },
    );
  }
}
