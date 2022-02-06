import 'package:knit_aholic/Models/yarn.dart';

final String tableYarnType = 'yarnType';

class YarnTypeFields {
  static final List<String> values = [id, typeName];
  static final String id = '_id';
  static final String typeName = 'typeName';
}

class YarnType {
  final int? id;
  final String typeName;

  YarnType({this.id, required this.typeName});

  YarnType copy({int? id, String? typeName}) =>
      YarnType(id: id ?? this.id, typeName: typeName ?? this.typeName);

  Map<String, Object?> toJson() =>
      {YarnTypeFields.id: id, YarnTypeFields.typeName: typeName};

  static YarnType fromJson(Map<String, Object?> json) => YarnType(
      id: json[YarnTypeFields.id] as int?,
      typeName: json[YarnTypeFields.typeName] as String);
}
