import 'package:assignment3/providers/user_provider.dart';
import 'package:assignment3/screens/login.dart';
import 'package:assignment3/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/entities/user_model.dart';

class registation extends StatefulWidget {
  registation({super.key});
  static String id = "registation";
  @override
  State<registation> createState() => _registationState();
}

class _registationState extends State<registation> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  String? gender;
  String? grade;
  String? uni;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
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
              phoneWidget(),
              passwordWidget(),
              confirmPasswordWidget(),
              const SizedBox(height: 20),
              Row(children: [
                const Text("Gender:"),
                Radio(
                    value: "Male",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    }),
                const Text("Male"),
                Radio(
                    value: "Female",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    }),
                const Text("Female"),
              ]),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text("Grade:"),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: grade,
                    onChanged: (value) {
                      setState(() {
                        grade = value.toString();
                      });
                    },
                    items: const [
                      DropdownMenuItem(value: "A", child: Text("A")),
                      DropdownMenuItem(value: "B", child: Text("B")),
                      DropdownMenuItem(value: "C", child: Text("C")),
                      DropdownMenuItem(value: "D", child: Text("D")),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text("University:"),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: uni,
                    onChanged: (value) {
                      setState(() {
                        uni = value.toString();
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                          value: "Cairo University",
                          child: Text("Cairo University")),
                      DropdownMenuItem(
                          value: "Al-Azhar University",
                          child: Text("Al-Azhar University")),
                      DropdownMenuItem(
                          value: "Ain Shams University",
                          child: Text("Ain Shams University")),
                      DropdownMenuItem(
                          value: "Helwan University",
                          child: Text("Helwan University")),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (key.currentState!.validate() &&
                      gender != null &&
                      uni != null &&
                      grade != null) {
                    String email = emailWidget.getEmail();
                    String phone = phoneWidget.getPhone();
                    String password = passwordWidget.getPassword();
                    User? user = await provider.getOneUser(email);
                    if (email != user?.email || user == null) {
                      provider.add(User(
                        email: email,
                        password: password,
                        phone: phone,
                        gender: gender!,
                        grade: grade!,
                        uni: uni!,
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("User added successfully"),
                      ));
                      Navigator.pushNamed(context, login.id);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("This email already exists"),
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
                child: const Text("Register"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, login.id);
                  },
                  child: const Text(
                    "Already have an account? Login",
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
