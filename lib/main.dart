import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todotick/loginRegister/login_screen.dart';
import 'package:todotick/loginRegister/register_screen.dart';
import 'Assets/AppState.dart';
import 'Homepage/homepage.dart';


final navigatorKey = GlobalKey<NavigatorState>();


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey : navigatorKey,
        home: LoginScreen(),
        routes: {
          '/home' : (context) => Homepage(),
          '/login' : (context) => LoginScreen(),
          '/register' : (context) => RegisterScreen(),
      }
    );
  }
}
