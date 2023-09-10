import 'package:assignment3/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:assignment3/widgets/widgets.dart';

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
              const SizedBox(height: 20),
              
              ElevatedButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, home.id);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please complete all the fields")));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 59, 89, 152),
                ),
                child: const Text("Confirm"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}