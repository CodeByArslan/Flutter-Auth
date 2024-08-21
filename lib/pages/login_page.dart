import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthfirebase/components/my_TextField.dart';
import 'package:flutterauthfirebase/components/my_button.dart';

import '../helper/helper_functions.dart';
class LoginPage extends StatefulWidget {

   LoginPage({super.key, this.onTap});
   final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   final TextEditingController emailController = TextEditingController();

   final TextEditingController passwordController = TextEditingController();

   void login() async{
     showDialog(context: context,
         builder: (context)=>const Center(
           child: CircularProgressIndicator(),
         ),
     );
     try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
       if(context.mounted)Navigator.pop(context);
     }
     on FirebaseAuthException catch (e){
       Navigator.pop(context);
       displayMessageToUser(e.code, context);
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
                    hintText: "",
                    obscureText: false,
                    controller: emailController),
                const SizedBox(height: 10,),
                MyTextField(
                    hintText: "",
                    obscureText: true,
                    controller: passwordController),
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
                  text: "Login",
                  onTap: login,
                ),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text("Register Here",
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