// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:knit_aholic/components/tab_title_component.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/theme_model.dart';
import 'package:provider/provider.dart';
import '../theme/themes.dart';
import '../theme/theme_changer.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  String name = '';

  @override
  void initState() {
    super.initState();
    loadName();
  }

  void loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '...';
    });
  }

  void changeName(String newName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', newName);
    setState(() {
      name = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const TabTitle(title: 'Personlig\ntilpasning'),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Navn",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {
                    _displayNameChangeDialog(context);
                  },
                  child: Text('Skift navn',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary)),
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      side: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.primary)),
                )
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            padding: const EdgeInsets.all(8),
            height: 75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tema",
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(
                  width: Themes.values.length * 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: Themes.values
                        .map((e) =>
                            ThemeChanger(theme: e, themeModel: themeNotifier))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }

  Future<void> _displayNameChangeDialog(BuildContext context) async {
    String valueText = name;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Skift navn'),
            content: TextField(
              controller: TextEditingController()..text = name,
              autofocus: true,
              onChanged: (value) {
                setState(() {
                  valueText = value;
                  debugPrint(valueText);
                });
              },
              decoration: const InputDecoration(hintText: "Indtast dit navn"),
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
                    changeName(valueText);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }
}
