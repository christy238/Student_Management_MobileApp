import 'package:flutter/material.dart';
import 'package:student_management/View/Screens/Login_Section/SignUp_Page.dart';
import 'package:student_management/View/Screens/Student_Section/Student_Profile_Page.dart';
import 'package:student_management/View/Screens/navigation.dart';
import 'package:student_management/View/Widgets/Bottom_navBar.dart';
import 'package:student_management/View/Widgets/Custom_text_field.dart';
import 'package:student_management/View/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;
    print('Email: $email');
    print('Password: $password');
    navigateToPage(context, Bottom_bar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            const SizedBox(height: 40),
            const Text('Welcome Back',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: Colors.white)),
            const SizedBox(height: 40),
            CustomTextField(
                controller: _emailController, labelText: 'Password'),
            const SizedBox(height: 30.0),
            CustomTextField(
              controller: _passwordController,
              labelText: 'Password',
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: null,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 227, 239, 250),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonClr1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Do not have an account ? ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 227, 239, 250),
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () => navigateToPage(context, SignupPage()),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Color.fromARGB(255, 6, 23, 39),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
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
