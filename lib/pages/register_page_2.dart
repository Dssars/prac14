import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_text_field.dart';
import 'package:flutter_application_1/services/auth/auth_service_2.dart';
import 'package:provider/provider.dart';

class RegisterPage2 extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage2({super.key, this.onTap});

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {

  //controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //sign up
  void signUp() async{
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords do not match'),
        ),
      );
      return;
    }

    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailandPassword(emailController.text, passwordController.text);
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

              // create mess
              const Text(
                'Let`s create an account',
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

              const SizedBox(height: 10,),

              //confirm password
              MyTextField(controller: confirmPasswordController, hintText: 'Confirm password', obscureText: true),

              const SizedBox(height: 25,),

              //button
              MyButton(onTap: signUp, text: 'Sign Up'),

              const SizedBox(height: 50,),
          
              //register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already a member?'),
                  const SizedBox(width: 4,),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text('Login', style: TextStyle(fontWeight: FontWeight.bold),),
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