import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knit_aholic/Models/yarn.dart';
import 'package:knit_aholic/Models/yarn_type.dart';

class YarnTypeContainer extends StatefulWidget {
  final YarnType yarnType;
  const YarnTypeContainer({required YarnType yarnType}) : yarnType = yarnType;

  @override
  YarnTypeContainerState createState() => YarnTypeContainerState(yarnType);
}

class YarnTypeContainerState extends State<YarnTypeContainer> {
  YarnTypeContainerState(this.yarnType);
  final YarnType yarnType;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        yarnType.type,
        style: const TextStyle(fontSize: 22, color: Colors.white),
      ),
      subtitle: !_isExpanded
          ? Text(
              differentColors().toString() + "farver",
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
                  totalYarn().toString(),
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
          title: Text("garn her"),
        )
      ],
      onExpansionChanged: (bool expanded) {
        setState(() => _isExpanded = expanded);
      },
    );
  }

  int differentColors() {
    Set<int> colors = {};
    for (var element in yarnType.yarn) {
      colors.add(element.colorId);
    }
    return colors.length;
  }

  int totalYarn() {
    return yarnType.yarn.length;
  }
}
