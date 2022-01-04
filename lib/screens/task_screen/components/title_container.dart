import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/model/task_data.dart';

import '../../../constants.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 84, left: 48, bottom: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: Icon(
                  Icons.list,
                  size: 70,
                  color: backgroundColor,
                )),
          ),
          const Text(
            "Todo",
            style: TextStyle(
                fontSize: 64, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "${Provider.of<TaskData>(context).taskCount} Tasks",
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}