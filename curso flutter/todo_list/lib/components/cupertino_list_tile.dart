import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoListTile extends StatefulWidget {
  final Widget? leading;
  final String? title;
  final String? subtitle;
  final Widget? trailing;

  const CupertinoListTile(
      {Key? key, this.leading, this.title, this.subtitle, this.trailing})
      : super(key: key);

  @override
  _StatefulStateCupertino createState() => _StatefulStateCupertino();
}

class _StatefulStateCupertino extends State<CupertinoListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                widget.leading != null
                    ? Padding(
                        padding:
                            EdgeInsets.only(left: 20, top: 20, bottom: 20.0),
                        child: widget.leading)
                    : Container(),
                Column(
                  children: [
                    Container(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20),
                        child: Text(widget.title ?? '', style: TextStyle(fontSize: 22),),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(widget.subtitle ?? '', style: TextStyle(fontSize: 16, color: Colors.grey.shade700),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            widget.trailing != null
                ? Padding(padding: EdgeInsets.all(20), child: widget.trailing)
                : Container()
          ],
        ),
      ],
    );
  }
}
