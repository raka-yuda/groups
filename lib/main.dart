import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groups/screens/chat-page.dart';
import 'package:groups/screens/home-page.dart';
import 'package:groups/screens/login-page.dart';
import 'package:groups/screens/register-page.dart';
import 'package:groups/screens/welcome-page.dart';
import 'package:groups/services/authentication_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance)),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChange,
            initialData: null)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          WelcomePage.id: (context) => WelcomePage(),
          ChatPage.id: (context) => ChatPage(),
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          HomePage.id: (context) => HomePage(),
        },
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loggedInUser = context.watch<User>();
    if (loggedInUser != null) {
      return ChatPage();
    }

    return WelcomePage();
  }
}
