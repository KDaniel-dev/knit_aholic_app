import 'package:flutter/material.dart';
import 'package:knit_aholic/Shared/yarn_type_dto.dart';

class YarnTypeContainer extends StatefulWidget {
  final Color color;
  final YarnTypeDTO yarnType;
  const YarnTypeContainer({required YarnTypeDTO yarnType, required Color color})
      : yarnType = yarnType,
        color = color;

  @override
  YarnTypeContainerState createState() =>
      YarnTypeContainerState(yarnType, color);
}

class YarnTypeContainerState extends State<YarnTypeContainer> {
  YarnTypeContainerState(this.yarnType, this.color);
  final Color color;
  final YarnTypeDTO yarnType;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: color,
        ),
        child: ExpansionTile(
          title: Text(
            yarnType.type.typeName,
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
          subtitle: !_isExpanded
              ? Text(
                  differentColors().toString() + " farver",
                  style: const TextStyle(color: Colors.white),
                )
              : null,
          trailing: SizedBox(
              width: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      yarnType.yarn.length.toString(),
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          " i alt",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ))
                  ])),
          children: const [
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: Text("Intet garn af denne type"),
            ),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() => _isExpanded = expanded);
          },
        ));
  }

  int differentColors() {
    Set<int> colors = {};
    for (var element in yarnType.yarn) {
      colors.add(element.colorId);
    }
    return colors.length;
  }
}
