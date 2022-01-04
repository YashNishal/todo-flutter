import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/model/task.dart';
import 'package:to_do/model/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String testFieldValue = "";

    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.blueAccent),
          ),
          const SizedBox(height: 8),
          TextField(
            onChanged: (newText) {
              testFieldValue = newText;
            },
            autofocus: true,
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
          const SizedBox(height: 32),
          TextButton(
              onPressed: () {
                if (testFieldValue.isNotEmpty) {
                  Provider.of<TaskData>(context,listen: false)
                      .addTask(Task(name: testFieldValue));
                }
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueAccent),
              ),
              child: const Text(
                'Add',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ))
        ],
      ),
    );
  }
}
