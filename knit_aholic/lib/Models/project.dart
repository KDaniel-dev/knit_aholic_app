import 'package:knit_aholic/Models/project_status.dart';
import 'package:knit_aholic/Models/yarn.dart';

class Project {
  final int? id;
  final String title;
  final String note;
  final List<Yarn> yarn;
  final ProjectStatus status;
  final DateTime started;
  final DateTime ended;

  Project(
      {this.id,
      required this.title,
      required this.note,
      required this.yarn,
      required this.status,
      required this.started,
      required this.ended});
}
