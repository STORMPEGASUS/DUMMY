import 'package:chat/screens/chat_screen.dart';
import 'package:chat/screens/login_screen.dart';
import 'package:chat/screens/registration_screen.dart';
import 'package:chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FlashChat());

class FlashChat extends StatelessWidget {
  const FlashChat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.routename,
      routes: {
        LoginScreen.routename: (context) =>  LoginScreen(),
        ChatScreen.routename: (context) =>  ChatScreen(),
        RegistrationScreen.routename: (context) =>  RegistrationScreen(),
        WelcomeScreen.routename: (context) =>  WelcomeScreen(),
      },
    );
  }
}
