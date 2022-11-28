import 'package:flutter/material.dart';
import 'package:lista_tarefas_alura/components/difficulty.dart';
import 'package:lista_tarefas_alura/data/task_dao.dart';

class Task extends StatefulWidget {
  final String taskName;
  final String taskPhoto;
  final int taskDifficulty;

  Task(
      {required this.taskName,
      required this.taskPhoto,
      required this.taskDifficulty,
      Key? key})
      : super(key: key);

  int level = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetOrNetwork() {
    if (widget.taskPhoto.contains("http")) {
      return false;
    }
    return true;
  }

  late String color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).primaryColor,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.surface,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: assetOrNetwork()
                            ? Image.asset(
                                widget.taskPhoto,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.taskPhoto,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SizedBox(
                            width: 200,
                            child: Text(
                              widget.taskName,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                        ),
                        Difficulty(
                          taskDifficulty: widget.taskDifficulty,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                        onLongPress: () {
                          TaskDao().deleteTask(widget.taskName);
                        },
                        onPressed: () {
                          setState(() {
                            widget.level++;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.arrow_drop_up),
                            Text(
                              "UP",
                              style: Theme.of(context).primaryTextTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        value: (widget.taskDifficulty > 0)
                            ? (widget.level / widget.taskDifficulty) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Nível: ${widget.level}",
                      style: Theme.of(context).primaryTextTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
