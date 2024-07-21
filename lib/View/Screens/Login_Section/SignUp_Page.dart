import 'package:flutter/material.dart';
import 'package:student_management/View/Screens/Login_Section/Login_Page.dart';
import 'package:student_management/View/Screens/navigation.dart';
import 'package:student_management/View/Widgets/Custom_button.dart';
import 'package:student_management/View/constants.dart';
import 'package:student_management/View/Widgets/Custom_text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _signup() {
    // Implement signup logic here
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;
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
              'Signup Page',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 50, color: buttonClr1),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _firstNameController,
                    labelText: 'First Name',
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(width: 20.0),
                //   const SizedBox(width: 20.0),
                Expanded(
                  child: CustomTextField(
                    controller: _firstNameController,
                    labelText: 'Last Name',
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            CustomTextField(
              controller: _emailController,
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 30.0),
            CustomTextField(
              controller: _passwordController,
              labelText: 'Password',
            ),
            const SizedBox(height: 30.0),
            CustomTextField(
              controller: _confirmPasswordController,
              labelText: 'Confirm Password',
            ),
            const SizedBox(height: 30.0),
            CustomButton(text: 'Sign Up', onPressed: _signup),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 227, 239, 250),
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () => navigateToPage(context, LoginPage()),
                  child: const Text(
                    'Sign In',
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
