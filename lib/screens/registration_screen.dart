import 'package:flutter/material.dart';
import 'package:chattingfriend/components/rounded_button.dart';
import 'package:chattingfriend/constanta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlurryModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: "logo",
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextfieldDecoration.copyWith(
                      hintText: "Enter your email"),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextfieldDecoration.copyWith(
                      hintText: "Enter your password"),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: "Register",
                  colour: Colors.blueAccent,
                  onpressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: password)
                        .then((value) {
                      print("Created New Account");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatScreen()));
                      setState(() {
                        showSpinner = false;
                      });
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                    // try {
                    //   final newUser = await _auth.createUserWithEmailAndPassword(
                    //       email: email, password: password);
                    //   if (newUser != null) {
                    //     Navigator.pushNamed(context, "chat_screen");
                    //   }
                    // } catch (e) {
                    //   print(e);
                    // }

                    // try {
                    //   final credential = await FirebaseAuth.instance
                    //       .createUserWithEmailAndPassword(
                    //     email: email,
                    //     password: password,
                    //   );
                    //   print("hello");
                    //   if (credential != null) {
                    //     Navigator.pushNamed(context, "chat_screen");
                    //   }
                    // } on FirebaseAuthException catch (e) {
                    //   if (e.code == 'weak-password') {
                    //     print('The password provided is too weak.');
                    //   } else if (e.code == 'email-already-in-use') {
                    //     print('The account already exists for that email.');
                    //   }
                    // } catch (e) {
                    //   print(e);
                    // }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
