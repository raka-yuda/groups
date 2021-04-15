import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:groups/screens/login-page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'register-page';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  // String email, password;
  final _auth = FirebaseAuth.instance;

  bool _isInAsyncCall = false;

  Future<UserCredential> createNewUser(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  void setAsyncCall() {
    if (_isInAsyncCall) {
      _isInAsyncCall = false;
    } else {
      _isInAsyncCall = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _isInAsyncCall,
        child: Stack(children: [
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
                          'Register',
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
                          controller: email,
                          // The validator receives the text that the user has entered.
                          keyboardType: TextInputType.emailAddress,
                          // onChanged: (value) {
                          //   email = value;
                          // },
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
                          controller: password,
                          // The validator receives the text that the user has entered.
                          // onChanged: (value) {
                          //   password = value;
                          // },
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
                                  side:
                                      BorderSide(width: 1, color: Colors.grey),
                                  primary: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 46, vertical: 32),
                                  textStyle: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () async {
                                setState(() {
                                  setAsyncCall();
                                });
                                try {
                                  final newUser =
                                      createNewUser(email.text, password.text);
                                  if (newUser != null) {
                                    Navigator.pushNamed(context, LoginPage.id);
                                  }
                                  setState(() {
                                    setAsyncCall();
                                  });
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
                                      'Register',
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
      ),
    );
  }
}
