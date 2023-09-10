import 'package:flutter/material.dart';

class home extends StatefulWidget {
  home({super.key});
  static String id = "home";

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String? q1;
  String? q2;
  String? q3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 59, 89, 152),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 160,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 59, 89, 152),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      "x + 1 = 1, x = ?",
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(children: [
                      Radio(
                          value: "1",
                          groupValue: q1,
                          onChanged: (value) {
                            setState(() {
                              q1 = value.toString();
                            });
                          }),
                      const Text("1"),
                    ]),
                    Row(children: [
                      Radio(
                          value: "2",
                          groupValue: q1,
                          onChanged: (value) {
                            setState(() {
                              q1 = value.toString();
                            });
                          }),
                      const Text("2"),
                    ]),
                    Row(children: [
                      Radio(
                          value: "3",
                          groupValue: q1,
                          onChanged: (value) {
                            setState(() {
                              q1 = value.toString();
                            });
                          }),
                      const Text("3"),
                    ]),
                    Row(children: [
                      Radio(
                          value: "4",
                          groupValue: q1,
                          onChanged: (value) {
                            setState(() {
                              q1 = value.toString();
                            });
                          }),
                      const Text("4"),
                    ]),
                  ],
                )),
            
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 160,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 59, 89, 152),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      "SDK represents ........",
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(children: [
                      Radio(
                          value: "Software Development Kit",
                          groupValue: q2,
                          onChanged: (value) {
                            setState(() {
                              q2 = value.toString();
                            });
                          }),
                      const Text("Software Development Kit"),
                    ]),
                    Row(children: [
                      Radio(
                          value: "Software Database Kit",
                          groupValue: q2,
                          onChanged: (value) {
                            setState(() {
                              q2 = value.toString();
                            });
                          }),
                      const Text("Software Database Kit"),
                    ]),
                    Row(children: [
                      Radio(
                          value: "Software Data Kit",
                          groupValue: q2,
                          onChanged: (value) {
                            setState(() {
                              q2 = value.toString();
                            });
                          }),
                      const Text("Software Data Kit"),
                    ]),
                    Row(children: [
                      Radio(
                          value: "Software Development Knowledge",
                          groupValue: q2,
                          onChanged: (value) {
                            setState(() {
                              q2 = value.toString();
                            });
                          }),
                      const Text("Software Development Knowledge"),
                    ]),
                  ],
                )),
            
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 160,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 59, 89, 152),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      "What are the advantages Flutter?",
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(children: [
                      Radio(
                          value: "Cross-platform Development",
                          groupValue: q3,
                          onChanged: (value) {
                            setState(() {
                              q3 = value.toString();
                            });
                          }),
                      const Text("Cross-platform Development"),
                    ]),
                    Row(children: [
                      Radio(
                          value: "Faster Development",
                          groupValue: q3,
                          onChanged: (value) {
                            setState(() {
                              q3 = value.toString();
                            });
                          }),
                      const Text("Faster Development"),
                    ]),
                    Row(children: [
                      Radio(
                          value: "UI Focused",
                          groupValue: q3,
                          onChanged: (value) {
                            setState(() {
                              q3 = value.toString();
                            });
                          }),
                      const Text("UI Focused"),
                    ]),
                    Row(children: [
                      Radio(
                          value: "All of the above",
                          groupValue: q3,
                          onChanged: (value) {
                            setState(() {
                              q3 = value.toString();
                            });
                          }),
                      const Text("All of the above"),
                    ]),
                  ],
                )),
            
            ElevatedButton(
              onPressed: () {
                if (q1 != null && q2 != null && q3 != null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Thank you for your answer")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please answer all the questions")));
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
    );
  }
}
