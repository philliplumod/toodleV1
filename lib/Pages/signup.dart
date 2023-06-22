import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toddle/pages/signin.dart';
import 'package:toddle/controllers/signup_controller.dart';
import 'package:toddle/models/user_model.dart';
import 'package:toddle/utilities/colors.dart';
import 'package:toddle/utilities/image.dart';
import 'package:toddle/utilities/theme.dart';
import 'package:toddle/widgets/custombutton.dart';
import 'package:toddle/widgets/customoutlinebutton.dart';
import 'package:toddle/widgets/textfield_signin_up.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      // final screenWidth = constraints.maxWidth;
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
                  Text('Get On Board!', style: headingStyle),
                  Text('Your journey starts here.', style: textStyle),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: controller.fullName,
                            label: 'Full Name',
                            hint: 'Full Name',
                            icon: Icons.person_2_outlined,
                          ),
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
                            onPressed: () {},
                            suffixIcon: Icons.visibility_outlined,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomElevatedButton(
                    width: double.infinity,
                    color: customAccentColor3,
                    textColor: nightColor,
                    label: 'Sign up',
                    onPressed: () {
                      // if (formKey.currentState!.validate()) {
                      //   final user = UserModel(
                      //     fullName: controller.fullName.text.trim(),
                      //     email: controller.email.text.trim(),
                      //     password: controller.password.text.trim(),
                      //   );
                      //   SignUpController.instance.registerUser(
                      //       controller.email.text.trim(),
                      //       controller.password.text.trim());
                      // }

                      /// version 1
                      // if (formKey.currentState!.validate()) {
                      //   final user = UserModel(
                      //     fullName: controller.fullName.text.trim(),
                      //     email: controller.email.text.trim(),
                      //     password: controller.password.text.trim(),
                      //   );

                      //   SignUpController.instance.registerUser(
                      //     user.email,
                      //     user.password,
                      //   );

                      //   SignUpController.instance.createUser(user);
                      // }

                      /// version2
                      if (formKey.currentState!.validate()) {
                        final user = UserModel(
                          fullName: controller.fullName.text.trim(),
                          email: controller.email.text.trim(),
                          password: controller.password.text.trim(),
                        );

                        SignUpController.instance.registerUser(user);
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
                      Get.to(() => const SignIn(),
                          transition: Transition.fadeIn);
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Already have an account?',
                        style: textStyle,
                        children: [
                          TextSpan(
                              text: ' Sign in',
                              style: textStyle.copyWith(color: custombtnColor))
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
    });
  }
}
