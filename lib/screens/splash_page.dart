// ignore: duplicate_ignore
// ignore_for_file: unused_import, duplicate_import, prefer_typing_uninitialized_variables

import 'package:mobile_apps/Screens/blank_page.dart';
import 'package:mobile_apps/screens/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile_apps/Theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var keyLogin;
  var token;
  @override
  void initState() {
    //
    super.initState();
    Timer(const Duration(seconds: 2), () => checktoken()
        );
  }

  Future<void> checktoken() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    keyLogin = prefs.getString('keyLogin');
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
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
        // home: const NavigationPage(),
        // routes: {
        //   '/': (context) => const SplashPage(),
        //   // '/': (context) => const NavigationPage(),
        //   '/onboarding': (context) => const OnBoardingPage(),
        //   '/sign-in': (context) => const SignInPage(),
        //   '/Sign-Up': (context) => const SignUpPage(),
        //   '/navigation-page': (context) => const NavigationPage(),
        //   '/breeding-page': (context) => const BreedingPage(),
        //   '/dombaTersedia': (context) => const DombaTersediaPage(),
        //   '/detailDomba': (context) => const DetailDomba(),
        //   '/detailPaketQurban': (context) => const DetailPaketQurbanPage(),
        //   '/akad': (context) => const AkadPage(),
        //   '/TermsAndConditions': (context) => const TermsAndConditions(),
        //   '/dombasaya': (context) => const DombaSaya(),
        //   '/monitoring': (context) => const Monitoring(),
        //   '/akun-page': (context) => const AkunPage(),
        //   '/edit-akun-page': (context) => const EditAkunPage(),
        //   '/ubah-password-page': (context) => const UbahPasswordPage(),
        //   '/keranjang-page': (context) => const KeranjangPage(),
        //   '/detailbreed': (context) => const DetailBreed(),
        //   '/invoice': (context) => const invoice(),
        // },
        home: token == null ? const BlankPage() : MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/nobg.png'))),
        ),
      ),
    );
  }
}
