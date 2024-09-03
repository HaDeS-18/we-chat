import 'package:flutter/material.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/components/my_button.dart';
import 'package:minimal_chat_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  //email and pw controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  //login method
  Future<void> login(BuildContext context) async {
    // auth service
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _pwController.text);
    }
    //catch any exception\
    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  //tap to go to register now page
  final void Function() onTap;

  LoginPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(
              height: 50,
            ),
            //welcome back message
            Text(
              'Welcome back, you have been missed!',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            //email textfield

            MyTextfield(
                controller: _emailController,
                obscureText: false,
                hintText: 'Email'),

            const SizedBox(height: 10),

            //pw textfield
            MyTextfield(
                controller: _pwController,
                obscureText: true,
                hintText: 'password'),

            const SizedBox(height: 25),
            //login button

            MyButton(
              text: "Login",
              onTap: () => login(context),
            ),

            const SizedBox(
              height: 25,
            ),
            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
