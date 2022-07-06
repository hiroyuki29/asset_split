import 'package:asset_split/src/features/asset/presentation/asset_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asset Split',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AssetHomeScreen(),
    );
  }
}
