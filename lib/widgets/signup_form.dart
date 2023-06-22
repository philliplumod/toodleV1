import 'package:flutter/material.dart';
import 'package:toddle/controllers/signup_controller.dart';
import 'package:toddle/widgets/textfield_signin_up.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
    required this.formKey,
    required this.controller,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final SignUpController controller;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool obscurePassword = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: widget.controller.fullName,
            label: 'Full Name',
            hint: 'Full Name',
            icon: Icons.person_2_outlined,
          ),
          CustomTextField(
            controller: widget.controller.email,
            label: 'Email',
            hint: 'Email',
            icon: Icons.email_outlined,
          ),
          CustomTextField(
            controller: widget.controller.password,
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
    );
  }
}
