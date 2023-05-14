import 'package:flutter/material.dart';
import 'package:toddle/controllers/signup_controller.dart';
import 'package:toddle/widgets/textfield_signin_up.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.controller,
  });

  final GlobalKey<FormState> formKey;
  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
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
    );
  }
}
