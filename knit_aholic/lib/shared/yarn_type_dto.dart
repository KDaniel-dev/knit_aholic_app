import 'package:knit_aholic/Models/yarn.dart';
import 'package:knit_aholic/Models/yarn_type.dart';

class YarnTypeDTO {
  final YarnType type;
  final List<Yarn> yarn;

  YarnTypeDTO({required this.type, required this.yarn});
}
