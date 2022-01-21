import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YarnTypeContainer extends StatefulWidget {
  const YarnTypeContainer({Key? key}) : super(key: key);

  @override
  YarnTypeContainerState createState() => YarnTypeContainerState();
}

class YarnTypeContainerState extends State<YarnTypeContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ExpansionTile(title: Row()),
      ),
    );
  }
}
