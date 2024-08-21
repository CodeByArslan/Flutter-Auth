import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthfirebase/auth/auth.dart';
import 'package:flutterauthfirebase/firebase_options.dart';
import 'package:flutterauthfirebase/theme/dark_mode.dart';
import 'package:flutterauthfirebase/theme/light_mode.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: const AuthPage(),
     theme: lightMode,
     darkTheme: darkMode,
   );
  }
}
