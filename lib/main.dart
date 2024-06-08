import 'package:flutter/material.dart';
import 'package:mobile_apps/Theme.dart';
import 'package:mobile_apps/screens/data_diri_page.dart';
import 'package:mobile_apps/screens/login.dart';
import 'package:mobile_apps/screens/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rentailers',
      theme: ThemeData(
          scaffoldBackgroundColor: primaryColor,
          appBarTheme: AppBarTheme(
              backgroundColor: lightBackgroundColor,
              centerTitle: false,
              elevation: 1,
              titleTextStyle: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
              iconTheme: IconThemeData(color: blackColor))),      
              
              home: const SplashPage(),
              //home: DataDiriPage(),

    );
  }
}

