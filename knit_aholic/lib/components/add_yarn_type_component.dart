import 'package:flutter/material.dart';

class AddYarnTypeButton extends StatefulWidget {
  const AddYarnTypeButton({Key? key}) : super(key: key);

  @override
  AddYarnTypeButtonState createState() => AddYarnTypeButtonState();
}

class AddYarnTypeButtonState extends State<AddYarnTypeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.add_circle_outline,
              color: Theme.of(context).colorScheme.primary),
          Text(" Tilføj ny garn type",
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        ]));
  }
}
