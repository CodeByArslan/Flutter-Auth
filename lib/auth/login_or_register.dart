import 'package:flutter/material.dart';
import 'package:flutterauthfirebase/pages/login_page.dart';
import 'package:flutterauthfirebase/pages/register_page.dart';
class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  bool showLoginPage = true;
  void togglepages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(
        onTap: togglepages,
      );
    }
    else {
      return RegisterPage(onTap: togglepages);

    }

  }
}
