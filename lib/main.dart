import 'package:flutter/material.dart';
import 'package:users_app/src/widgets/appbar.dart';
import 'package:users_app/src/widgets/mainPage_container.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, secondary: Colors.white),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xAAD9D9D9)),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUsers().build(),
      body: MainPageContainer(),
    );
  }
}
