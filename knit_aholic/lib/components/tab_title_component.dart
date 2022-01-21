import 'package:flutter/material.dart';

class TabTitle extends StatefulWidget {
  final String title;
  const TabTitle({required String title}) : title = title;

  @override
  TabTitleState createState() => TabTitleState(title);
}

class TabTitleState extends State<TabTitle> {
  TabTitleState(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 50,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
