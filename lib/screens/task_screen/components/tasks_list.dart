import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/model/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Consumer<TaskData>(
          builder: (BuildContext context, taskData, Widget? child) {
            return ListView.builder(
              itemCount: taskData.taskCount,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              itemBuilder: (context, index) {
                final task = taskData.tasks[index];
                return Dismissible(
                  key: Key(Provider.of<TaskData>(context).tasks[index].name),
                  background: Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.red,
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "DELETE",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    taskData.deleteTask(task);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Item deleted")));
                  },
                  child: TaskTile(
                      taskTitle: task.name,
                      isChecked: task.isDone,
                      checkboxCallback: (newState) {
                        taskData.updateTask(task);
                      }),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallback,
  }) : super(key: key);

  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      onChanged: checkboxCallback,
      title: Text(taskTitle,
          style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              decoration: isChecked ? TextDecoration.lineThrough : null)),
    );
  }
}
