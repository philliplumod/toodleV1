import 'package:flutter/material.dart';
import 'package:toddle/utilities/image.dart';
import 'package:toddle/utilities/theme.dart';
import 'package:toddle/widgets/custombutton.dart';
import 'package:toddle/widgets/customoutlinebutton.dart';
import 'package:toddle/widgets/textfield_signin_up.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: size.height * 0.1),
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(splashLogo),
                  height: size.height * 0.2,
                ),
                Text('Get On Board!', style: headingStyle),
                Text('Your journey starts here.', style: textStyle),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Form(
                    child: Column(
                      children: [
                        const CustomTextField(
                          label: 'Full Name',
                          hint: 'Full Name',
                          icon: Icons.person_2_outlined,
                        ),
                        const CustomTextField(
                          label: 'Email',
                          hint: 'Email',
                          icon: Icons.email_outlined,
                        ),
                        CustomTextField(
                          label: 'Password',
                          hint: 'Password',
                          icon: Icons.fingerprint_outlined,
                          onPressed: () {},
                          suffixIcon: Icons.visibility_outlined,
                        ),
                        SizedBox(height: size.height * 0.03),
                        CustomElevatedButton(
                          label: 'Sign up',
                          onPressed: () {},
                        ),
                        SizedBox(height: size.height * 0.03),
                        Center(
                          child: Text(
                            'Or Continue with',
                            style: textStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        const SizedBox(
                          width: double.infinity,
                          child: CustomOutlineButton(),
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
  }
}
