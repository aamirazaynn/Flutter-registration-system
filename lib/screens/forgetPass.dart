import 'package:flutter/material.dart';
import 'package:assignment3/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../models/entities/user_model.dart';
import '../providers/user_provider.dart';

class forgetPass extends StatefulWidget {
  forgetPass({super.key});
  static String id = "forgetPass";

  @override
  State<forgetPass> createState() => _forgetPassState();
}

class _forgetPassState extends State<forgetPass> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 59, 89, 152),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        child: Form(
          key: key,
          child: Column(
            children: [
              emailWidget(),
              passwordWidget(),
              confirmPasswordWidget(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (key.currentState!.validate()) {
                    String email = emailWidget.getEmail();
                    String password = passwordWidget.getPassword();
                    confirmPasswordWidget.resetConfirmPassword();
                    User? user = await provider.getOneUser(email);
                    if (email != user?.email || user == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("User not found"),
                      ));
                    } else {
                      user.password = password;
                      provider.edit(user.id!, user);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Password changed successfully"),
                      ));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please complete all the fields")));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 59, 89, 152),
                ),
                child: const Text("Change Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}