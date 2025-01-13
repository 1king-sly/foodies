import 'package:flutter/material.dart';
import 'package:foodies/constants/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        foregroundDecoration: const BoxDecoration(
          color: Color.fromARGB(50, 21, 190, 120),
        ),
      ),
    );
  }
}
