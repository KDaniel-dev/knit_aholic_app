import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'tabs/dashboard.dart';
import 'tabs/inventory.dart';
import 'tabs/profile.dart';
import 'tabs/projects.dart';
import 'tabs/stats.dart';

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
    const navBarItems = [
      Icon(Icons.person_outlined, color: Colors.white),
      Icon(Icons.list_outlined, color: Colors.white),
      Icon(Icons.home_outlined, color: Colors.white),
      Icon(Icons.auto_graph_outlined, color: Colors.white),
      Icon(Icons.bar_chart_outlined, color: Colors.white),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('KnitAholic',
            style: TextStyle(
                fontFamily: 'Sacramento', fontSize: 30, color: Colors.white)),
        centerTitle: true,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        items: navBarItems,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        height: 50.0,
        color: Theme.of(context).colorScheme.primary,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Theme.of(context).colorScheme.primary,
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
