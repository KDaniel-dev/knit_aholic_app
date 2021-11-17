import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'inventory.dart';
import 'profile.dart';
import 'projects.dart';
import 'stats.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int currentIndex = 2;

  final tabs = const [Profile(), Inventory(), Dashboard(), Projects(), Stats()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KnitAholic',
            style: TextStyle(fontFamily: 'Sacramento', fontSize: 30)),
        centerTitle: true,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[300],
        selectedIconTheme: const IconThemeData(size: 30),
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: 'Profil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_outlined), label: 'Dit garn'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Hjem'),
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_graph_outlined), label: 'Projekter'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined), label: 'Stats')
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
