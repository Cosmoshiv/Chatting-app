import 'package:flutter/material.dart';
import 'package:chattingfriend/screens/welcome_screen.dart';
import 'package:chattingfriend/screens/login_screen.dart';
import 'package:chattingfriend/screens/registration_screen.dart';
import 'package:chattingfriend/screens/chat_screen.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "welcome_screen",
        routes: {
          "welcome_screen": (context) => WelcomeScreen(),
          "login_screen": (context) => LoginScreen(),
          "registration_screen": (context) => RegistrationScreen(),
          "chat_screen": (context) => ChatScreen(),
        });
  }
}
