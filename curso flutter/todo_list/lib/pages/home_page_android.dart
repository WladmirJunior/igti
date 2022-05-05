
import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/data/task.dart';
import 'package:lista_de_tarefas/pages/new_task_page.dart';
import 'package:lista_de_tarefas/repository/task_repository.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TaskRepository repository = TaskRepository();
  List<Task> rowItems = [];

  @override
  void initState() {
    repository.getTasks().then((value) => rowItems.addAll(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas para hoje'),
      ),
      body: ListView.separated(
        itemCount: rowItems.length,
        itemBuilder: (BuildContext context, int position) {
          final task = rowItems[position];
          return RowItem(
            task: task,
            onDeleteItem: () => _deleteTask(position, task, context),
            onValueChanged: () {
              rowItems[position].isDone = !rowItems[position].isDone;
              _saveList();
            },
          );
        },
        separatorBuilder: (BuildContext context, int position) => Divider(
          color: Colors.grey.shade600,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createTask(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _createTask(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewTaskPage())).then((task) {
      setState(() {
        if (task != null) {
          rowItems.add(task);
          _saveList();
        }
      });
    });
  }

  void _deleteTask(int position, Task task, BuildContext context) {
    setState(() {
      rowItems.removeAt(position);
      _saveList();

      final snackBar = SnackBar(
        content: Text('Tarefa ${task.title} excluida!'),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              rowItems.insert(position, task);
              _saveList();
            });
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void _saveList() {
    repository.saveTasks(rowItems);
  }
}

class RowItem extends StatefulWidget {
  RowItem(
      {Key? key,
      required this.task,
      required this.onValueChanged,
      required this.onDeleteItem})
      : super(key: key);

  Task task;
  VoidCallback onValueChanged;
  VoidCallback onDeleteItem;

  @override
  _RowItemState createState() => _RowItemState();
}

class _RowItemState extends State<RowItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        widget.onDeleteItem();
      },
      background: Container(
        color: Colors.red,
        child: Align(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          alignment: Alignment.centerRight,
        ),
      ),
      child: ListTile(
        title: Text(
          widget.task.title,
          style: Theme.of(context).textTheme.headline5,
        ),
        subtitle: Text(
          widget.task.description,
          style: Theme.of(context).textTheme.headline6,
        ),
        trailing: widget.task.isDone ? Icon(Icons.done) : null,
        enabled: true,
        selected: true,
        onTap: () {
          setState(() {
            widget.task.isDone = !widget.task.isDone;
            widget.onValueChanged();
          });
        },
      ),
    );
  }
}
