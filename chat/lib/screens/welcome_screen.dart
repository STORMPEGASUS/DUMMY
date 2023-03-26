// ignore_for_file: library_private_types_in_public_api

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat/screens/login_screen.dart';
import 'package:chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../widget/RoundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  static const routename = "/WelcomeScreen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation =
        ColorTween(begin: Color.fromARGB(255, 31, 81, 104), end: Colors.white)
            .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: animation.value,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: "logo",
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                      child: SizedBox(
                        height: 100.0,
                        child: Image.asset('images/cat.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  TypewriterAnimatedTextKit(
                    speed: Duration(milliseconds: 100),
                    text: ['Cat Chat'],
                    textStyle: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 48.0,
              ),
              RoundedButton(
                title: "Log In",
                colour: Colors.lightBlueAccent,
                ontap: () {
                  Navigator.of(context).pushNamed(LoginScreen.routename);
                },
              ),
              RoundedButton(
                  title: "Register",
                  colour: Colors.blueAccent,
                  ontap: () {
                    Navigator.of(context)
                        .pushNamed(RegistrationScreen.routename);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
