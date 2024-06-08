import 'package:flutter/material.dart';
import 'package:mobile_apps/Theme.dart';
import 'package:mobile_apps/screens/dashboard.dart';
import 'package:mobile_apps/screens/home.dart';
import 'package:mobile_apps/screens/main_page.dart';
import 'package:mobile_apps/screens/signup.dart';
import 'package:mobile_apps/widgets/custom_textformfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text('LOGIN',
              style: bluetogreenTextStyle.copyWith(
                  fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: Column(
                            children: [
                              const SizedBox(height: 50),
                              SizedBox(
                                  height: 300,
                                  width: 300,
                                  child: Image.asset(
                                    "assets/login.png",
                                    fit: BoxFit.contain,
                                  )),
                              const SizedBox(height: 20),
                              Text("Login dengan akun yang terdaftar",
                                  style: blackTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      RegisterField(
                          controller: nameController,
                          keyType: TextInputType.emailAddress,
                          hint: 'Masukkan Username',
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Kolom Username harus diisi';
                            }
                            if (!val.contains('@')) {
                              return 'Username tidak valid';
                            }
                            return null;
                          },
                          prefixIcon: Icons.mail),
                      const SizedBox(
                        height: 50,
                      ),
                      RegisterField(
                        controller: passwordController,
                        prefixIcon: Icons.key,
                        hint: 'Masukkan Password',
                        isPassword: true,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Kolom Password harus diisi';
                          }
                          if (val.length < 8) {
                            return 'Password harus 8 karakter';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              disabledBackgroundColor: bluetogreenColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: Text(
                            "Masuk",
                            style: whitekTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 17,
                            ),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Belum memiliki akun?', style: blackTextStyle),
                          TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpPage()),
                                    (route) => false);
                              },
                              child: Text('Daftar',
                                  style: bluetogreenTextStyle.copyWith(
                                      fontWeight: bold))),
                        ],
                      ),
                    ],
                  ),
                ))));
  }
}
