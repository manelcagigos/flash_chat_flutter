import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_flutter/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import '../components/rounded_button.dart';
import '../constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.black),
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                style: const TextStyle(color: Colors.black),
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                buttonColor: Colors.lightBlueAccent,
                buttonTitle: 'Log In',
                functionOnpressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    Navigator.pushNamed(context, ChatScreen.id);

                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    '';
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
