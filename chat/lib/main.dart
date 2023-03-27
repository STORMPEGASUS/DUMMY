import 'package:chat/screens/chat_screen.dart';
import 'package:chat/screens/login_screen.dart';
import 'package:chat/screens/registration_screen.dart';
import 'package:chat/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black87),
        ),
      ),
      initialRoute: WelcomeScreen.routename,
      routes: {
        LoginScreen.routename: (context) => LoginScreen(),
        ChatScreen.routename: (context) => ChatScreen(),
        RegistrationScreen.routename: (context) => RegistrationScreen(),
        WelcomeScreen.routename: (context) => WelcomeScreen(),
      },
    );
  }
}
