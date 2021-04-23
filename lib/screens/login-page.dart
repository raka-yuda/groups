import 'package:flutter/material.dart';
import 'package:groups/components/button.dart';
import 'package:groups/screens/chat-page.dart';
import 'package:groups/screens/register-page.dart';
import 'package:groups/services/authentication-service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login-page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool _isInAsyncCall = false;

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
              color: Color(0xFFFAFAFA),
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 48, vertical: size.height * 0.18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Groups',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            color: Color(0xFF31CD9D),
                            fontSize: 48,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Login',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: Color(0xFF2F4858),
                          fontSize: 32,
                        ),
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
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Padding(
                    padding: EdgeInsets.only(
                      top: 28,
                      left: 28,
                      right: 28,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: Color(0xFF2F4858),
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: BorderSide(
                                color: Color(0xFFC4C4C4),
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: BorderSide(
                                color: Color(0xFFC4C4C4),
                                width: 1.0,
                              ),
                            ),
                          ),
                          controller: email,
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
                        Text(
                          'Password',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: Color(0xFF2F4858),
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: BorderSide(
                                color: Color(0xFFC4C4C4),
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: BorderSide(
                                color: Color(0xFFC4C4C4),
                                width: 1.0,
                              ),
                            ),
                          ),
                          controller: password,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ButtonPrimary(
                          text: 'Login with Email',
                          onPressed: () async {
                            // print({
                            //   email.text,
                            //   password.text,
                            // });
                            setState(() {
                              setAsyncCall();
                            });
                            final res = await context
                                .read<AuthenticationService>()
                                .signIn(
                                  email.text.trim(),
                                  password.text.trim(),
                                );
                            setState(() {
                              setAsyncCall();
                            });
                            if (res == 'success') {
                              email.clear();
                              password.clear();
                              Navigator.pushNamed(context, ChatPage.id);
                            } else {
                              final snackBar = SnackBar(
                                content: Text(res),
                                backgroundColor: Color(0xFF2F4858),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not registered yet?',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                color: Color(0xFF2F4858),
                                fontSize: 16,
                              ),
                            ),
                            ButtonText(
                              text: 'Register',
                              onPressed: () {
                                Navigator.pushNamed(context, RegisterPage.id);
                              },
                            )
                          ],
                        ),
                      ],
                    ))),
          )
        ]),
      ),
    );
  }
}
