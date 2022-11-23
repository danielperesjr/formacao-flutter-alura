import 'package:flutter/material.dart';
import 'package:lista_tarefas_alura/data/task_dao.dart';
import 'package:lista_tarefas_alura/screens/form_screen.dart';

import '../components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                });
              },
              icon: Icon(Icons.refresh),
          ),
        ],
        title: const Text("Tarefas"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
          future: TaskDao().readAll(),
          builder: (context, snapshot) {
            List<Task>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text("Carregando..."),
                    ],
                  ),
                );
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text("Carregando..."),
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text("Carregando..."),
                    ],
                  ),
                );
                break;
              case ConnectionState.done:
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Task task = items[index];
                        return task;
                      },
                    );
                  }
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 128,
                        ),
                        Text(
                          "Não há nenhuma tarefa",
                          style: TextStyle(fontSize: 32),
                        )
                      ],
                    ),
                  );
                }
                return Text(
                  "Erro ao carregar as tarefas",
                  style: TextStyle(fontSize: 32),
                );
                break;
            }
            return Text(
              "Erro desconhecido",
              style: TextStyle(fontSize: 32),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => FormScreen(taskContext: context),
              ),
            ).then((value) => setState(() {
                  print("Recarregando a tela inicial!");
                }));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
