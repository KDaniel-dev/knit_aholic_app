import 'package:flutter/material.dart';
import 'package:knit_aholic/components/tab_title_component.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  InventoryState createState() => InventoryState();
}

class InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          TabTitle(title: 'Dit garn'),
        ]);
  }
}
