// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = (prefs.getString("name") ?? "...");
    });
  }

  void changeName(String newName) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("name", newName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Text(
            "Personlig\ntilpasning",
            style: TextStyle(
              fontSize: 50,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          height: 200,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
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
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
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
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink(
                      width: 30,
                      height: 30,
                      decoration: ShapeDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: const CircleBorder(
                          side: BorderSide(width: 2, color: Colors.black),
                        ),
                      ),
                      child: IconButton(
                        iconSize: 0,
                        splashRadius: 25,
                        icon: const Icon(Icons.android),
                        color: Colors.white,
                        onPressed: () {
                          debugPrint("GreenTheme");
                        },
                      ),
                    ),
                    Ink(
                      width: 30,
                      height: 30,
                      decoration: const ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: CircleBorder(
                          side: BorderSide(width: 2, color: Colors.black),
                        ),
                      ),
                      child: IconButton(
                        iconSize: 0,
                        splashRadius: 25,
                        icon: const Icon(Icons.android),
                        color: Colors.white,
                        onPressed: () {
                          debugPrint("BlueTheme");
                        },
                      ),
                    ),
                    Ink(
                      width: 30,
                      height: 30,
                      decoration: const ShapeDecoration(
                        color: Colors.orange,
                        shape: CircleBorder(
                          side: BorderSide(width: 2, color: Colors.black),
                        ),
                      ),
                      child: IconButton(
                        iconSize: 0,
                        splashRadius: 25,
                        icon: const Icon(Icons.android),
                        color: Colors.white,
                        onPressed: () {
                          debugPrint("OrangeTheme");
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
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
