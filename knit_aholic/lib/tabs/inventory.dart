import 'package:flutter/material.dart';
import 'package:knit_aholic/Models/yarn.dart';
import 'package:knit_aholic/Models/yarn_type.dart';
import 'package:knit_aholic/Models/yarn_status.dart';
import 'package:knit_aholic/components/tab_title_component.dart';
import 'package:knit_aholic/components/yarn_type_component.dart';
import 'package:knit_aholic/db/yarn_service.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  InventoryState createState() => InventoryState();
}

class InventoryState extends State<Inventory> {
  late List<Yarn> yarn;

  List<Yarn> test = [
    Yarn(
        type: 'Øko',
        colorId: 1,
        status: YarnStatus.available,
        dateAdded: DateTime.now()),
    Yarn(
        type: 'Alpaca',
        colorId: 1,
        status: YarnStatus.available,
        dateAdded: DateTime.now()),
    Yarn(
        type: 'Silke',
        colorId: 2,
        status: YarnStatus.available,
        dateAdded: DateTime.now()),
    Yarn(
        type: 'Bomuld',
        colorId: 1,
        status: YarnStatus.available,
        dateAdded: DateTime.now()),
    Yarn(
        type: 'Blødt',
        colorId: 4,
        status: YarnStatus.available,
        dateAdded: DateTime.now()),
    Yarn(
        type: 'Hårdt',
        colorId: 2,
        status: YarnStatus.available,
        dateAdded: DateTime.now()),
    Yarn(
        type: 'Sejt',
        colorId: 2,
        status: YarnStatus.available,
        dateAdded: DateTime.now()),
    Yarn(
        type: 'Grimt',
        colorId: 2,
        status: YarnStatus.available,
        dateAdded: DateTime.now()),
  ];

  @override
  void initState() {
    super.initState();

    try {
      // loadYarn();
    } catch (e) {
      yarn = [];
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<YarnType> yarnTypes = toYarnTypes();
    final List<int> colors = [300, 400];
    // https://api.flutter.dev/flutter/widgets/ListView-class.html
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: yarnTypes.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const TabTitle(title: "Dit garn");
        } else {
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: (Theme.of(context).colorScheme.primary
                  as MaterialColor)[colors[index % 2]],
            ),
            child: YarnTypeContainer(
              yarnType: yarnTypes[index - 1],
            ),
          );
        }
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  void loadYarn() async {
    yarn = await YarnService.readAll();
  }

  List<YarnType> toYarnTypes() {
    Map<String, List<Yarn>> dictionary = {};
    for (var y in test) {
      if (dictionary.containsKey(y.type)) {
        dictionary[y.type]!.add(y);
      } else {
        dictionary[y.type] = [y];
      }
    }
    return dictionary.entries.map((element) {
      return YarnType(type: element.key, yarn: element.value);
    }).toList();
  }
}
