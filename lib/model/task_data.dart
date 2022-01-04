import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/model/task.dart';

class TaskData extends ChangeNotifier {

  TaskData() {
    setup();
  }

  List<Task> _tasks = [
    Task(name: "task 1 ✌️"),
    Task(name: "task 2❤️"),
    Task(name: "task 3🤞"),
  ];


  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }
  int get taskCount => _tasks.length;

  void addTask(Task task) {
    _tasks.add(task);
    save();
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    save();
    notifyListeners();
  }


  void deleteTask(Task task) {
    _tasks.remove(task);
    save();
    notifyListeners();
  }

  void setup() async {
    final prefs = await SharedPreferences.getInstance();
    final String tasksString = prefs.getString('taskList') ?? "";
    if(tasksString != "") {
      _tasks = Task.decode(tasksString);
    }
  }

  void save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('taskList', Task.encode(_tasks));
  }

}
