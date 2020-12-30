import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/task_data.dart';

class TaskLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.taskCount,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              taskData.deleteTask(index);
            },
            direction: DismissDirection.startToEnd,
            background: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.delete,
                    color: Colors.black54,
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                '${taskData.taskList[index].title}',
                style: TextStyle(
                  fontSize: 20,
                  decoration: taskData.taskList[index].isChecked
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              trailing: Checkbox(
                value: taskData.taskList[index].isChecked,
                onChanged: (value) {
                  taskData.toogle(index, value);
                },
              ),
              contentPadding: EdgeInsets.only(left: 40),
            ),
          );
        },
      );
    });
  }
}
