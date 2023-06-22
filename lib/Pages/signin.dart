import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toddle/Pages/signup.dart';

import '../controllers/signin_controller.dart';
import '../utilities/colors.dart';
import '../utilities/image.dart';
import '../utilities/theme.dart';
import '../widgets/custombutton.dart';
import '../widgets/customoutlinebutton.dart';
import '../widgets/textfield_signin_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final formKey = GlobalKey<FormState>();

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final screenHeight = constraints.maxHeight;
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: const AssetImage(splashLogo),
                      height: screenHeight * 0.20,
                    ),
                    Text('Welcome to Toodle!', style: headingStyle),
                    Text('Your journey starts here.', style: textStyle),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: controller.email,
                              label: 'Email',
                              hint: 'Email',
                              icon: Icons.email_outlined,
                            ),
                            CustomTextField(
                              controller: controller.password,
                              label: 'Password',
                              hint: 'Password',
                              icon: Icons.fingerprint_outlined,
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                              suffixIcon: obscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              obscureText: obscurePassword,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    CustomElevatedButton(
                      width: double.infinity,
                      textColor: nightColor,
                      color: customAccentColor3,
                      label: 'Sign up',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          SignInController.instance.loginUser(
                            controller.email.text.trim(),
                            controller.password.text.trim(),
                          );
                        }
                      },
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Center(
                      child: Text(
                        'Or Continue with',
                        style: textStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const SignUp(),
                            transition: Transition.fadeIn);
                      },
                      child: Text.rich(
                        TextSpan(
                          text: 'Already have an account?',
                          style: textStyle,
                          children: [
                            TextSpan(
                              text: ' Sign in',
                              style: textStyle.copyWith(color: custombtnColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
