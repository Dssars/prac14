import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_text_field.dart';
import 'package:flutter_application_1/services/auth/auth_service_2.dart';
import 'package:provider/provider.dart';

class LoginPage2 extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage2({super.key, this.onTap});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {

  //controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in
  void signIn() async{
    // get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailandPassword(
        emailController.text,
        passwordController.text
      );
      // print('1111');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50,),
              // logo
              Image.asset('../2.webp', width: 150, height: 150,),

              const SizedBox(height: 50,),

              // welcome back
              const Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25,),

              //email
              MyTextField(controller: emailController, hintText: 'Email', obscureText: false),

              const SizedBox(height: 10,),

              //password
              MyTextField(controller: passwordController, hintText: 'Password', obscureText: true),

              const SizedBox(height: 25,),

              //button
              MyButton(onTap: signIn, text: 'Sign In'),

              const SizedBox(height: 50,),
          
              //register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a member?'),
                  const SizedBox(width: 4,),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text('Register', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}