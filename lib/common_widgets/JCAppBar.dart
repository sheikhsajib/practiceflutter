import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class JCAppBar extends StatefulWidget implements PreferredSizeWidget {
  const JCAppBar({required this.title, required this.centerTitle, Key? key})
      : super(key: key);

  final String title;
  final bool centerTitle;

  @override
  State<JCAppBar> createState() => _JCAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);
  //Size get preferredSize => throw UnimplementedError();
}

class _JCAppBarState extends State<JCAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      //leading: Icon(Icons.message),
      title: Text(widget.title),
      centerTitle: widget.centerTitle,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.green, Colors.blue])),
      ),
      actions: [Icon(Icons.search), Icon(Icons.notifications)],
      //give a space between two Icons.
    );
  }
}
