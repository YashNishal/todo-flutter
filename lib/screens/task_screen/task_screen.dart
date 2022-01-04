import 'package:flutter/material.dart';
import 'package:to_do/screens/add_task_screen/add_task_screen.dart';
import '../../constants.dart';
import 'components/body.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: const TaskScreenBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // add task screen
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                )),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                isScrollControlled: true,
                context: context,
                builder: (context) => const AddTaskScreen() );
          },
          child: const Icon(
            Icons.add,
            size: 32,
          ),
        ),
      ),
    );
  }
}



