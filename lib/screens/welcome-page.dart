import 'package:flutter/material.dart';
import 'package:groups/screens/login-page.dart';

class WelcomePage extends StatelessWidget {
  static const String id = 'welcome-page';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 96,
                    width: 96,
                    child: Center(
                      child: Text('G',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              color: Colors.black38)),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 16,
                          offset: Offset(5, 5), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  Text(
                    'A flutter live chat application to make a \n new relationship with a stranger',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 64,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      side: BorderSide(width: 1, color: Colors.grey),
                      primary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 46, vertical: 32),
                      textStyle:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.id);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.app_registration,
                        color: Colors.blueAccent,
                      ),
                      Expanded(
                        child: Text(
                          'Login with Email',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        ),
                      )
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      side: BorderSide(width: 1, color: Colors.grey),
                      primary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 46, vertical: 32),
                      textStyle:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.app_registration,
                        color: Colors.blueAccent,
                      ),
                      Expanded(
                        child: Text(
                          'Register with Email',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 64,
            ),
          ],
        ),
      ),
    );
  }
}
