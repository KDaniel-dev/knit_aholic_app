import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  ProjectsState createState() => ProjectsState();
}

class ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Projects'));
  }
}
