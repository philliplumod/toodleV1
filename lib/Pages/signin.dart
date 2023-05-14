import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toddle/utilities/colors.dart';
import 'package:toddle/utilities/image.dart';
import 'package:toddle/utilities/theme.dart';
import 'package:toddle/widgets/custombutton.dart';
import 'package:toddle/widgets/customoutlinebutton.dart';
import 'package:toddle/widgets/textfield_signin_up.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: size.height * 0.04),
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(splashLogo),
                  height: size.height * 0.25,
                ),
                Text('Welcome to Toodle!', style: headingStyle),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomTextField(
                          hint: 'Email',
                          label: 'Email',
                          icon: Icons.email_outlined,
                        ),
                        CustomTextField(
                          hint: 'Password',
                          label: 'Password',
                          icon: Icons.fingerprint_outlined,
                          suffixIcon: Icons.visibility_outlined,
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: TextButton(
                        //     onPressed: () {},
                        //     child: Text('Forget Password?',
                        //         style:
                        //             textStyle.copyWith(color: custombtnColor)),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: size.height * 0.02,
                        // ),
                        CustomElevatedButton(
                          label: 'Sign in',
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Center(
                          child: Text(
                            'Or Continue with',
                            style: textStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              CustomOutlineButton(
                                label: 'Facebook',
                                imageAsset: 'images/icons8-facebook-24.png',
                              ),
                              CustomOutlineButton(
                                label: 'Google',
                                imageAsset: 'images/icons8-google-24.png',
                              ),
                              CustomOutlineButton(
                                label: 'Twitter',
                                imageAsset: 'images/icons8-twitter-24.png',
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text.rich(
                            TextSpan(
                              text: 'Already have an account?',
                              style: textStyle,
                              children: [
                                TextSpan(
                                    text: ' Sign in',
                                    style: textStyle.copyWith(
                                        color: custombtnColor))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
