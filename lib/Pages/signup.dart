import 'package:flutter/material.dart';
import 'package:toddle/utilities/colors.dart';
import 'package:toddle/utilities/image.dart';
import 'package:toddle/utilities/theme.dart';
import 'package:toddle/widgets/customButton.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                  height: size.height * 0.2,
                ),
                Text('Get On Board!', style: headingStyle),
                Text('Your journey starts here.', style: textStyle),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Form(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline_rounded,
                              color: nightColor,
                            ),
                            hintText: 'Full Name',
                            labelText: 'Full Name',
                            border: const OutlineInputBorder()),
                      ),
                      SizedBox(height: size.height * 0.02),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: nightColor,
                            ),
                            hintText: 'Email',
                            labelText: 'Email',
                            border: const OutlineInputBorder()),
                      ),
                      SizedBox(height: size.height * 0.02),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.fingerprint_outlined,
                              color: nightColor,
                            ),
                            hintText: 'Password',
                            labelText: 'Password',
                            border: const OutlineInputBorder()),
                      ),
                      SizedBox(height: size.height * 0.03),
                      CustomElevatedButton(label: 'Sign up', onPressed: () {}),
                      SizedBox(height: size.height * 0.03),
                      Center(
                        child: Text(
                          'Or ',
                          style: textStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
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
                    ],
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
