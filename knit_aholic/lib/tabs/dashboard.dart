import 'package:flutter/material.dart';
import 'package:knit_aholic/components/tab_title_component.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          TabTitle(title: 'Goddag'),
        ]);
  }
}
