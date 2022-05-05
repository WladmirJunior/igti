import 'package:flutter/material.dart';
import '../pages/home_page_android.dart';
import '../pages/new_task_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.purple,
            secondary: Colors.green,
          ),
          textTheme: TextTheme(
            headline5: TextStyle(fontWeight: FontWeight.bold),
            headline6: TextStyle(
                fontStyle: FontStyle.italic, color: Colors.purple.shade400),
          ),
    ),
    debugShowCheckedModeBanner: false,
    home: HomePage());
  }
}
