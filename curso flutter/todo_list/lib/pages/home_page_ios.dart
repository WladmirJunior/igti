import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/components/cupertino_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _editingController = TextEditingController();
  List<Widget> rowItems = [];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Tarefas de Hoje'),
          trailing: CupertinoButton(
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title: Text('Nova tarefa'),
                  content: Card(
                    elevation: 0.0,
                    child: Column(
                      children: [
                        CupertinoTextField(
                          controller: _editingController,
                          placeholder: 'Título da tarefa',
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          rowItems.add(RowItem(title: _editingController.text));
                          _editingController.text = '';
                        });
                      },
                      child: Text('Ok'),
                    ),
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              );
            },
            child: Icon(CupertinoIcons.add),
            padding: EdgeInsets.zero,
          ),
        ),
        child: ListView.builder(
          itemCount: rowItems.length,
            itemBuilder: (context, position) => rowItems[position]
        )
    );
  }
}

class RowItem extends StatefulWidget {
  RowItem({Key? key, required this.title, this.isDone = false}) : super(key: key);

  String title;
  bool isDone;

  @override
  _RowItemState createState() => _RowItemState();
}

class _RowItemState extends State<RowItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isDone = !widget.isDone;
        });
      },
      child: CupertinoListTile(
        title: '${widget.title}',
        trailing: widget.isDone ? Icon(CupertinoIcons.check_mark) : null,
        subtitle: 'Tarefa a ser concluida',
        leading: Icon(CupertinoIcons.star),
      ),
    );
  }
}

