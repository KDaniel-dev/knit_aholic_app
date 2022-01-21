import 'package:knit_aholic/Models/yarn_status.dart';

class YarnDTO {
  final int id;
  final String type;
  final int colorId;
  final YarnStatus status;
  final DateTime dateAdded;
  final DateTime? dateDeleted;

  YarnDTO(
      {required this.id,
      required this.type,
      required this.colorId,
      required this.status,
      required this.dateAdded,
      required this.dateDeleted});
}
