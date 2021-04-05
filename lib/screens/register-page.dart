import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  static const id = 'register-page';

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
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your Username'),
            ),
            TextFormField(
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
