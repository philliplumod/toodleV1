import 'package:flutter/material.dart';
import 'package:toddle/utilities/theme.dart';

import 'button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 30.0 - 10),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_rounded),
                labelText: 'Email',
                hintText: 'Email',
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 30.0 - 10,
          ),
          TextFormField(
              decoration: const InputDecoration(
            prefixIcon: Icon(Icons.password_rounded),
            labelText: 'Password',
            hintText: 'Password',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.visibility_off_rounded,
                )),
          )),
          const SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forget Password',
                    style: textStyle,
                  ))),
          const SizedBox(
              width: double.infinity,
              child: CustomButton(label: 'Login', onTap: null))
        ],
      ),
    ));
  }
}
