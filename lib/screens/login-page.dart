import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login-page';
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.width,
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            Text(
              'Groups',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 48,
                  fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your Username'),
            ),
            TextFormField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your Password'),
            ),
            FlatButton(
                onPressed: null,
                child: Row(
                  children: [
                    Icon(
                      Icons.login,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 48,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
