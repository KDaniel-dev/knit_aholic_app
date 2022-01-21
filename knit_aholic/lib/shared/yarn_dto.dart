import 'package:knit_aholic/Models/yarn_status.dart';

class YarnDTO {
  final int id;
  final int typeId;
  final int colorId;
  final YarnStatus status;
  final DateTime dateAdded;
  final DateTime? dateDeleted;

  YarnDTO(
      {required this.id,
      required this.typeId,
      required this.colorId,
      required this.status,
      required this.dateAdded,
      required this.dateDeleted});
}
