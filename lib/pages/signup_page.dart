import 'package:flutter/material.dart';
import 'package:foodies/components/input.dart';
import 'package:foodies/constants/constants.dart';
import 'package:foodies/pages/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFF),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/pattern2.webp'),
                  fit: BoxFit.cover,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.grey.shade100,
                    // Colors.white,
                    Colors.white,
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  SizedBox(
                    width: double.infinity,
                    height: 270,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 215,
                            width: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/logo.webp'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Text(
                            "Create an Account",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]),
                  ),
                  const SizedBox(height: 30),
                  InputComponent(
                    hintText: 'User name',
                    prefixIcon: const Icon(Icons.person, color: primaryColor),
                  ),
                  const SizedBox(height: 30),
                  InputComponent(
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon:
                        const Icon(Icons.email_outlined, color: primaryColor),
                  ),
                  const SizedBox(height: 20),
                  InputComponent(
                      hintText: 'Password',
                      isPassword: true,
                      prefixIcon:
                          const Icon(Icons.lock_outline, color: primaryColor)),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF53E88B),
                          Color(0xFF15BE77),
                        ],
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          maintainState: false,
                          builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      "Already have an account? Login",
                      style: TextStyle(
                        color: primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: primaryColor,
                      ),
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
