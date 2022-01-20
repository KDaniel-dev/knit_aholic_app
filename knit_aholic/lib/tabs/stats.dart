import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  StatsState createState() => StatsState();
}

class StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Stats'));
  }
}
