import 'package:assignment3/screens/forgetPass.dart';
import 'package:flutter/material.dart';
import 'package:assignment3/screens/home.dart';
import 'package:provider/provider.dart';
import '../models/entities/user_model.dart';
import '../models/handler/shared_preference_handler.dart';
import '../providers/user_provider.dart';
import '../widgets/widgets.dart';

class login extends StatefulWidget {
  const login({super.key});
  static String id = "login";

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (key.currentState!.validate()) {
                    String email = emailWidget.getEmail();
                    String password = passwordWidget.getPassword();
                    User? user = await provider.getOneUser(email);
                    if (email != user?.email || user == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("User not found"),
                      ));
                    } else {
                      if (password == user.password) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("User Logged in successfully"),
                        ));
                        await SharedPreferencesHandler()
                            .saveEmailToPreferences(email);
                        Navigator.pushNamedAndRemoveUntil(
                            context, home.id, (route) => false);
                      }
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please complete all the fields")));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 59, 89, 152),
                ),
                child: const Text("Login"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, forgetPass.id);
                  },
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(
                        color: Color.fromARGB(255, 59, 89, 152),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
