import 'package:project_mars/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'tasks.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TaskDao.sqlTable);
    },
    version: 1,
  );
}