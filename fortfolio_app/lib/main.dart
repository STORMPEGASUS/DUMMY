import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 99, 70, 70),
                Color.fromARGB(255, 0, 255, 247),
                Color.fromARGB(255, 14, 241, 131),
              ],
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('images/MOON.png'),
                ),
                const Text(
                  'Utsav Kumar',
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Pacifico',
                  ),
                ),
                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade100,
                      fontFamily: 'SourceSansPro',
                      letterSpacing: 2.5),
                ),
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Divider(
                    color: Colors.teal.shade100,
                    thickness: 2,
                  ),
                ),
                Card(
                  //padding: const EdgeInsets.all(10),
                  elevation: 20,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  color: Colors.white,
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone_android,
                      size: 30,
                      color: Colors.teal,
                    ),
                    title: Text(
                      '+91-7903013832',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[800],
                      ),
                    ),
                  ),
                ),
                Card(
                  //padding: const EdgeInsets.all(10),
                  elevation: 20,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  color: Colors.white,
                  child: ListTile(
                    leading: const Icon(
                      Icons.email,
                      size: 30,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'utsavkumar24x7@gmail.com',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[800],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
