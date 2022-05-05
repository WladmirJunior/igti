import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/data/task.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({Key? key}) : super(key: key);

  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  String? _titleError;
  String? _descError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nova Tarefa'),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                      hintText: 'Título',
                      errorText: _titleError,
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  controller: _descController,
                  decoration: InputDecoration(
                      hintText: 'Digite aqui a descrição da tarefa',
                      errorText: _descError,
                      border: OutlineInputBorder()
                  ),
                  maxLines: 6,
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 40.0,
                  child: ElevatedButton(onPressed: () => _createClick(context),
                      child: Text('Criar'.toUpperCase())),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _createClick(BuildContext context) {
    String title = _titleController.text.toString();
    String desc = _descController.text.toString();

    setState(() {
      _titleError = title.isEmpty ? 'Preencha a descrição da tarefa' : null;
      _descError = desc.isEmpty ? 'Preencha a descrição da tarefa' : null;
    });

    if (title.isEmpty || desc.isEmpty) { return; }

    final task = Task(title: title, description: desc);
    Navigator.pop(context, task);
  }
}
