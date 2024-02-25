import 'package:amc_2023/Screens/accounts.dart';
import 'package:amc_2023/Screens/addaccount.dart';
import 'package:amc_2023/Screens/notification.dart';
import 'package:amc_2023/homePage.dart';
import 'package:amc_2023/login/login.dart';
import 'package:amc_2023/login/startupScreen.dart';
import 'package:amc_2023/login/welcomeScreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/Material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartupScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
              bodyLarge: TextStyle(
                  color: Colors.black, fontSize: 18, fontFamily: "Schyler"),
              displayLarge: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontFamily: "Schyler")),
          primarySwatch: Colors.blue),
    );
  }
}
