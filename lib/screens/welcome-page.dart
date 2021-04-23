import 'package:flutter/material.dart';
import 'package:groups/components/button.dart';
import 'package:groups/screens/login-page.dart';
import 'package:groups/screens/register-page.dart';

class WelcomePage extends StatelessWidget {
  static const String id = 'welcome-page';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Color(0xFFFAFAFA),
        child: Column(
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 96,
                    width: 96,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF00979B), Color(0xFF31CD9D)]),
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 16,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text('G',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  Text(
                    'Welcome to Groups',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Color(0xFF2F4858),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'A flutter live chat application to make a \n new relationship with a stranger',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Color(0xFF2F4858),
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Flexible(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: ButtonPrimary(
                    text: 'Login with Email',
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: ButtonPrimary(
                    text: 'Register with Email',
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterPage.id);
                    },
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
