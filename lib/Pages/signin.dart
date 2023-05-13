import 'package:flutter/material.dart';
import 'package:toddle/utilities/colors.dart';
import 'package:toddle/utilities/sizes.dart';
import 'package:toddle/utilities/theme.dart';
import 'package:toddle/widgets/login_form.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utilities/image.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
          color: defaultColor,
          padding: const EdgeInsets.all(defaultSize),
          child: Column(
            children: [
              Image(
                image: const AssetImage(splashLogo),
                height: size.height * 0.2,
              ),
              const SizedBox(
                height: 10,
              ),
              const LoginForm(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Or'),
                  const SizedBox(height: 30.0 - 10),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          color: nightColor,
                          size: 20.0,
                        ),
                        onPressed: () {},
                        label: Text('Sign in with Google', style: textStyle)),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text.rich(TextSpan(
                          text: 'Already have an account?',
                          style: textStyle,
                          children: [
                            TextSpan(
                                text: ' Sign in',
                                style:
                                    textStyle.copyWith(color: custombtnColor))
                          ])))
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
