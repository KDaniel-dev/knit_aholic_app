import 'package:flutter/material.dart';
import 'package:knit_aholic/components/tab_title_component.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  StatsState createState() => StatsState();
}

class StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          TabTitle(title: 'Dit forbrug'),
        ]);
  }
}
