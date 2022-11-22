import 'package:flutter/material.dart';
import 'package:lista_tarefas_alura/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool taskOpacity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Container(),
        title: const Text("Tarefas"),
      ),
      body: AnimatedOpacity(
        opacity: taskOpacity ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: ListView(
          children: const [
            Task(
                taskName: "Aprender Flutter",
                taskPhoto: "assets/images/flutter.jpg",
                taskDifficulty: 3),
            Task(
              taskName: "Aprender Arquitetura",
              taskPhoto:
              "assets/images/architecture.jpg",
              taskDifficulty: 2,
            ),
            Task(
              taskName: "Aprender Android",
              taskPhoto:
              "assets/images/android.jpg",
              taskDifficulty: 4,
            ),
            Task(
              taskName: "Aprender iOS",
              taskPhoto:
              "assets/images/ios.jpg",
              taskDifficulty: 4,
            ),
            Task(
                taskName: "Aprender Flutter",
                taskPhoto: "assets/images/flutter.jpg",
                taskDifficulty: 3),
            Task(
              taskName: "Aprender Arquitetura",
              taskPhoto:
              "assets/images/architecture.jpg",
              taskDifficulty: 2,
            ),
            Task(
              taskName: "Aprender Android",
              taskPhoto:
              "assets/images/android.jpg",
              taskDifficulty: 4,
            ),
            Task(
              taskName: "Aprender iOS",
              taskPhoto:
              "assets/images/ios.jpg",
              taskDifficulty: 4,
            ),
            Task(
                taskName: "Aprender Flutter",
                taskPhoto: "assets/images/flutter.jpg",
                taskDifficulty: 3),
            Task(
              taskName: "Aprender Arquitetura",
              taskPhoto:
              "assets/images/architecture.jpg",
              taskDifficulty: 2,
            ),
            Task(
              taskName: "Aprender Android",
              taskPhoto:
              "assets/images/android.jpg",
              taskDifficulty: 4,
            ),
            Task(
              taskName: "Aprender iOS",
              taskPhoto:
              "assets/images/ios.jpg",
              taskDifficulty: 4,
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            taskOpacity = !taskOpacity;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}