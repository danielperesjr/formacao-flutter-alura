import 'package:lista_tarefas_alura/components/task.dart';
import 'package:lista_tarefas_alura/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = "CREATE TABLE $_tableName("
      "$_name TEXT, "
      "$_difficulty INTEGER, "
      "$_image TEXT)";

  static const String _tableName = "tbTask";
  static const String _name = "name";
  static const String _difficulty = "difficulty";
  static const String _image = "image";

  Future<int> saveTask(Task task) async {
    print("Iniciando o save...");

    final Database dbTask = await getDatabase();
    var itemExists = await read(task.taskName);

    Map<String, dynamic> taskMap = toMap(task);

    if (itemExists.isEmpty) {
      print("A tarefa não existe!");
      return await dbTask.insert(_tableName, taskMap);
    } else {
      print("A tarefa já existe!");
      return await dbTask.update(
        _tableName,
        taskMap,
        where: "$_name = ?",
        whereArgs: [task.taskName],
      );
    }
  }

  Future<List<Task>> readAll() async {
    print("Acessando o readAll...");

    final Database dbTask = await getDatabase();
    final List<Map<String, dynamic>> result = await dbTask.query(_tableName);
    print("Procurando dados no dbTask...encontrado: $result");

    return toList(result);
  }

  Future<List<Task>> read(String taskName) async {
    print("Acessando read: ");

    final Database dbTask = await getDatabase();
    final List<Map<String, dynamic>> result = await dbTask.query(
      _tableName,
      where: "$_name = ?",
      whereArgs: [taskName],
    );
    print("Tarefa encontrada: ${toList(result)}");
    return toList(result);
  }

  Future<int> deleteTask(String taskName) async {
    print("Deletando tarefa: $taskName");

    final Database dbTask = await getDatabase();
    return dbTask.delete(
      _tableName,
      where: "$_name = ?",
      whereArgs: [taskName],
    );
  }

  List<Task> toList(List<Map<String, dynamic>> taskMap) {
    print("Convertendo to List:");
    final List<Task> tasks = <Task>[];

    for (Map<String, dynamic> line in taskMap) {
      final Task task = Task(
          taskName: line[_name],
          taskPhoto: line[_image],
          taskDifficulty: line[_difficulty]);
      tasks.add(task);
    }

    print("Lista de Tarefas: $tasks");

    return tasks;
  }

  Map<String, dynamic> toMap(Task task) {
    print("Convertando tarefa em Map: ");

    final Map<String, dynamic> taskMap = {};
    taskMap[_name] = task.taskName;
    taskMap[_difficulty] = task.taskDifficulty;
    taskMap[_image] = task.taskPhoto;

    print("Mapa de Tarefas: $taskMap");

    return taskMap;
  }

}
