import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class HwPage extends StatefulWidget {
  //   if (FirebaseAuth.instance.currentUser == null) {
  //   Get.offAll(() => const SignInPage2());
  // }

  const HwPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homework"),
        automaticallyImplyLeading: false,
      ),
      body: Column(children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "QUIZ IDS - 0 - 2 (add, sub, mul)",
            textScaleFactor: 0.75,
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Your Current Homework",
            textScaleFactor: 2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            textDirection: TextDirection.ltr,
            defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            border: TableBorder.symmetric(inside: const BorderSide(width: 0.1)),
            children: [
              const TableRow(children: [
                Text(
                  "Task",
                  textScaleFactor: 1.5,
                ),
                Text("Teacher", textScaleFactor: 1.5),
                Text("Action", textScaleFactor: 1.5),
              ]),
              TableRow(children: [
                const Text("Addition", textScaleFactor: 1.5),
                const Text("Mr Brooks", textScaleFactor: 1.5),
                ButtonBar(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        throw ("Not Implemented");
                      },
                      child: const Text("Complete"),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                const Text("Subtraction", textScaleFactor: 1.5),
                const Text("Mr WISCONSIN", textScaleFactor: 1.5),
                ButtonBar(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        throw ("Not Implemented");
                      },
                      child: const Text("Complete"),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                const Text("Multiplication", textScaleFactor: 1.5),
                const Text("Mrs Kinney", textScaleFactor: 1.5),
                ButtonBar(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignInPage2(),
                          ),
                        );
                      },
                      child: const Text("Complete"),
                    ),
                  ],
                ),
              ]),
            ],
          ),
        ),
      ]),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
