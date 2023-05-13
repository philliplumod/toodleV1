import 'package:flutter/material.dart';
import 'package:toddle/utilities/colors.dart';
import 'package:toddle/widgets/customButton.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon:  Icon(Icons.email_outlined),
                hintText: 'Email',
                labelText: 'Email',
                border: OutlineInputBorder()),
          ),
          const SizedBox(height: 20),
          TextFormField(
              decoration: InputDecoration(
            prefixIcon: const Icon(Icons.fingerprint_outlined),
            hintText: 'Password',
            labelText: 'Password',
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove_red_eye_outlined)),
          )),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.red),
                )),
          ),
          CustomElevatedButton(
            label: 'Sign in',
            onPressed: () {},
          )
        ],
      ),
    ));
  }
}
