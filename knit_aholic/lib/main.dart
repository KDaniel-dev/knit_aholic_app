import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import '../theme/theme_model.dart';
import '../theme/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
          builder: (context, ThemeModel themeNotifier, child) {
        return MaterialApp(
            theme: ThemeData(
                primarySwatch:
                    getColorValue(Themes.values[themeNotifier.theme]),
                fontFamily: 'OpenSans',
                dividerColor: Colors.transparent),
            home: const Home());
      }),
    );
  }
}
