import 'package:flutter/material.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/components/my_button.dart';
import 'package:minimal_chat_app/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  //email, pw and conf pw controllers
  final TextEditingController _confirmPwController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  //login method
  void register(BuildContext context) async {
    //Define login method
    final auth = AuthService();
    //passwords match then create user
    if (_pwController.text == _confirmPwController.text) {
      try {
        auth.signUpWithEmailPassword(_emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }
    //if passwords do not match then show user an error
    else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Passwords do not match please try again!"),
              ));
    }
  }

  //tap to go to register now page
  final void Function() onTap;

  RegisterPage({super.key, required this.onTap});

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
              "Let's create an account for you",
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
                hintText: 'Password'),

            const SizedBox(height: 10),

            //conf pw textfield
            MyTextfield(
                controller: _confirmPwController,
                obscureText: true,
                hintText: 'Confirm password'),

            const SizedBox(height: 25),
            //register button

            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),

            const SizedBox(
              height: 25,
            ),
            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
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
