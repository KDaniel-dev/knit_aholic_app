import 'package:knit_aholic/Models/yarn_status.dart';

final String tableYarn = 'yarn';

class YarnFields {
  static final List<String> values = [
    id,
    type,
    colorId,
    status,
    dateAdded,
    dateDeleted,
    projectId
  ];
  static final String id = '_id';
  static final String type = 'type';
  static final String colorId = 'colorId';
  static final String status = 'status';
  static final String dateAdded = 'dateAdded';
  static final String dateDeleted = 'dateDeleted';
  static final String projectId = 'projectId';
}

class Yarn {
  final int? id;
  final String type;
  final int colorId;
  final YarnStatus status;
  final DateTime dateAdded;
  final DateTime? dateDeleted;
  final int? projectId;

  Yarn(
      {this.id,
      required this.type,
      required this.colorId,
      required this.status,
      required this.dateAdded,
      this.dateDeleted,
      this.projectId});

  Yarn copy(
          {int? id,
          String? type,
          int? colorId,
          YarnStatus? status,
          DateTime? dateAdded,
          DateTime? dateDeleted,
          int? projectId}) =>
      Yarn(
          id: id ?? this.id,
          type: type ?? this.type,
          colorId: colorId ?? this.colorId,
          status: status ?? this.status,
          dateAdded: dateAdded ?? this.dateAdded,
          dateDeleted: dateDeleted ?? this.dateDeleted,
          projectId: projectId ?? this.projectId);

  Map<String, Object?> toJson() => {
        YarnFields.id: id,
        YarnFields.type: type,
        YarnFields.colorId: colorId,
        YarnFields.status: YarnStatus.values.indexOf(status),
        YarnFields.dateAdded: dateAdded.toIso8601String(),
        YarnFields.dateDeleted: dateDeleted!.toIso8601String(),
        YarnFields.projectId: projectId
      };

  static Yarn fromJson(Map<String, Object?> json) => Yarn(
      id: json[YarnFields.id] as int?,
      type: json[YarnFields.type] as String,
      colorId: json[YarnFields.colorId] as int,
      status: YarnStatus.values[[YarnFields.status] as int],
      dateAdded: DateTime.parse(json[YarnFields.dateAdded] as String),
      dateDeleted: DateTime.parse(json[YarnFields.dateDeleted] as String),
      projectId: json[YarnFields.projectId] as int?);
}
