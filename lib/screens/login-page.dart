import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groups/screens/chat-page.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login-page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final TextEditingController email = TextEditingController();
  // final TextEditingController password = TextEditingController();

  String email, password;
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> loginWithEmail(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'login-screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(children: [
        Container(
            height: size.height,
            width: size.width,
            color: Colors.white38,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 64, vertical: size.height * 0.20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Groups',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'A flutter live chat application',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black38,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ))),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
              height: size.height * 0.46,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36, vertical: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      TextFormField(
                        // controller: email,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        // controller: password,
                        // The validator receives the text that the user has entered.
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                ),
                                side: BorderSide(width: 1, color: Colors.grey),
                                primary: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 46, vertical: 32),
                                textStyle: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                            onPressed: () async {
                              try {
                                final userLogin =
                                    loginWithEmail(email, password);
                                if (userLogin != null) {
                                  Navigator.pushNamed(context, ChatPage.id);
                                }
                              } catch (e) {
                                print(e);
                              }
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
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ],
                  ))),
        )
      ]),
    );
  }
}
