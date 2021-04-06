import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'register-page';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                      Icons.app_registration,
                    ),
                    Text(
                      'Register',
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
