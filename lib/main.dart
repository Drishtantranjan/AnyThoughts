import 'package:chat_gpt_integration/chat_screen.dart';
import 'package:chat_gpt_integration/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       useMaterial3: true,
        // primarySwatch: Colors.green, 
      ),
    
       initialRoute: '/',
       routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (context) =>  HomePage(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/second': (context) =>  ChatScreen(),
  },
    );
  }
}

