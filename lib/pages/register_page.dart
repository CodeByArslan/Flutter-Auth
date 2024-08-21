import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthfirebase/components/my_TextField.dart';
import 'package:flutterauthfirebase/components/my_button.dart';

import '../helper/helper_functions.dart';
class RegisterPage extends StatefulWidget {
  void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPwdController = TextEditingController();

  void registerUser ()async{

    showDialog(
        context: context,
        builder: (context)=>const Center(
          child: CircularProgressIndicator(),
    ),
    );
    if (passwordController.text != confirmPwdController.text){
      Navigator.pop(context);
      displayMessageToUser("Password don't match",context);
    }
    else{
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        Navigator.pop(context);

      }
      on FirebaseAuthException catch (e){
        Navigator.pop(context);
        displayMessageToUser(e.code, context);
      }
    }


  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.inversePrimary,),
                const SizedBox(height: 25,),
                const Text("M I N I M A L",
                  style: TextStyle(fontSize: 20),),
                const SizedBox(height: 50,),
                MyTextField(
                    hintText: "Name",
                    obscureText: false,
                    controller: usernameController),
                const SizedBox(height: 10,),
                MyTextField(
                    hintText: "Email",
                    obscureText: false,
                    controller: emailController),
                const SizedBox(height: 10,),
                MyTextField(
                    hintText: "Password",
                    obscureText: true,
                    controller: passwordController),
                const SizedBox(height: 10,),
                MyTextField(
                    hintText: "Confirm",
                    obscureText: true,
                    controller: confirmPwdController),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot Password",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary
                      ),),
                  ],
                ),
                const SizedBox(height: 25,),
                MyButton(
                  text: "Register",
                  onTap: registerUser,
                ),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text("Login Here",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
