import 'package:flutter/material.dart';
import 'package:to_do/screens/task_screen/components/tasks_list.dart';
import 'package:to_do/screens/task_screen/components/title_container.dart';


class TaskScreenBody extends StatelessWidget {
  const TaskScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        TitleContainer(),
        TasksList()
      ],
    );
  }
}