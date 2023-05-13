import 'package:flutter/material.dart';
import 'package:toddle/utilities/colors.dart';
import 'package:toddle/utilities/customtextform.dart';
import 'package:toddle/utilities/image.dart';
import 'package:toddle/utilities/theme.dart';

import '../widgets/customButton.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                const Image(
                  image: AssetImage(splashIcon),
                  width: 300,
                  height: 300,
                ),
                Text(
                  'Welcome back to Toddle',
                  style: subHeadingStyle,
                ),
                const SizedBox(height: 20),
                const LoginForm(),
                Text(
                  'Or ',
                  style: textStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Image(
                        height: 20,
                        image: AssetImage('images/google.png'),
                      )),
                ),
                const SizedBox(height: 20),
                TextButton(
                    onPressed: () {},
                    child: Text.rich(TextSpan(
                        text: 'Don\'t have an account? ',
                        style: textStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: textStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          )
                        ])))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
