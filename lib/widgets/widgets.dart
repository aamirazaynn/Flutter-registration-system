import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class emailWidget extends StatelessWidget {
  emailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: "example@gmail.com",
        label: Text("Email"),
      ),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "You must add your email";
        }
        if (!EmailValidator.validate(value!)) {
          return "Email is not valid";
        }
        return null;
      },
    );
  }
}

class phoneWidget extends StatelessWidget {
  phoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        hintText: "01234567899",
        label: Text("Phone Number"),
      ),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "You must add your phone number";
        }
        return null;
      },
    );
  }
}

String? pass;

class passwordWidget extends StatefulWidget {
  passwordWidget({super.key});

  @override
  State<passwordWidget> createState() => _passwordWidgetState();
}

class _passwordWidgetState extends State<passwordWidget> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: show,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          label: const Text("Password"),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  show = !show;
                });
              },
              icon: const Icon(Icons.remove_red_eye_outlined))),
      validator: (value) {
        if (value.toString().length < 8) {
          return "Password is too short";
        } else {
          pass = value;
          return null;
        }
      },
    );
  }
}

class confirmPasswordWidget extends StatefulWidget {
  const confirmPasswordWidget({super.key});

  @override
  State<confirmPasswordWidget> createState() => _confirmPasswordWidgetState();
}

class _confirmPasswordWidgetState extends State<confirmPasswordWidget> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: show,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          label: const Text("Confirm Password"),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  show = !show;
                });
              },
              icon: const Icon(Icons.remove_red_eye_outlined))),
      validator: (value) {
        if (value.toString() != pass) {
          return "Password Doesn't Match";
        } else {
          return null;
        }
      },
    );
  }
}
