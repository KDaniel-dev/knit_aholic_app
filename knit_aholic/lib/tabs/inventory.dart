import 'package:flutter/material.dart';
import 'package:knit_aholic/Models/yarn.dart';
import 'package:knit_aholic/components/add_yarn_type_component.dart';
import 'package:knit_aholic/components/tab_title_component.dart';
import 'package:knit_aholic/components/yarn_type_component.dart';
import 'package:knit_aholic/db/yarn_service.dart';
import 'package:knit_aholic/db/yarn_type_service.dart';
import 'package:knit_aholic/Shared/yarn_type_dto.dart';

import '../Models/yarn_type.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  InventoryState createState() => InventoryState();
}

class InventoryState extends State<Inventory> {
  final List<int> colors = [300, 400];
  List<YarnTypeDTO> yarnTypeCollections = [];

  @override
  void initState() {
    super.initState();
    loadYarn();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: yarnTypeCollections.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const TabTitle(title: "Dit garn");
        } else if (index == 1) {
          return GestureDetector(
              onTap: () => _displayAddYarnTypeDialog(context),
              child: const AddYarnTypeButton());
        } else {
          return YarnTypeContainer(
            yarnType: yarnTypeCollections[index - 2],
            color: (Theme.of(context).colorScheme.primary
                as MaterialColor)[colors[index % 2]] as Color,
          );
        }
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  void loadYarn() async {
    List<YarnTypeDTO> result = [];
    try {
      List<Yarn> yarn = await YarnService.readAll();
      List<YarnType> yarnTypes = await YarnTypeService.readAll();
      for (var yt in yarnTypes) {
        var yarnOfType = yarn.where((e) => e.typeId == yt.id);
        result.add(YarnTypeDTO(type: yt, yarn: yarnOfType.toList()));
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() => yarnTypeCollections = result);
    }
  }

  Future<void> _displayAddYarnTypeDialog(BuildContext context) async {
    String valueText = '';
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Tilføj ny garn type'),
            content: TextField(
              autofocus: true,
              onChanged: (value) {
                setState(() {
                  valueText = value;
                  debugPrint(valueText);
                });
              },
              decoration: const InputDecoration(hintText: "Indtast garn type"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.grey,
                textColor: Colors.white,
                child: const Text('Fortryd'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
                child: const Text('Ok'),
                onPressed: () {
                  setState(() {
                    addYarnType(valueText);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  void addYarnType(String typeName) async {
    var res = await YarnTypeService.create(YarnType(typeName: typeName));
    loadYarn();
  }
}
