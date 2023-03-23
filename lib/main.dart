import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zigy_assignment/services/services.dart';

import 'Screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ApiServices(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Zigy Assignment',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ));
  }
}
