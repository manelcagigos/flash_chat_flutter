import 'package:flutter/material.dart';
import '/screens/welcome_screen.dart';
import '/screens/login_screen.dart';
import '/screens/registration_screen.dart';
import '/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id, // Set the initial route to '/'
      routes: {
        WelcomeScreen.id: (context) =>
            const WelcomeScreen(), // Define the '/' route for WelcomeScreen
        LoginScreen.id: (context) =>
            const LoginScreen(), // Define the '/login' route for LoginScreen
        RegistrationScreen.id: (context) =>
            const RegistrationScreen(), // Define the '/registration' route for RegistrationScreen
        ChatScreen.id: (context) =>
            const ChatScreen(), // Define the '/chat' route for ChatScreen
      },
    );
  }
}