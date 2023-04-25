import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:maths_in_wisconsin/doTask.dart';

import 'login.dart';

class startTask extends StatelessWidget {
  const startTask({super.key, required this.taskId});
  final String taskId;
  //   if (FirebaseAuth.instance.currentUser == null) {
  //   Get.offAll(() => const SignInPage2());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Debug rememeber to remove taskid: $taskId"),
          automaticallyImplyLeading: false,
        ),
        body: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          Column(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Task $taskId - ADDING\n todo;add text for start button",
                textScaleFactor: 2,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Container(
                    color: Colors.green,
                    child: Center(
                      child: InkWell(
                          splashColor: Colors.grey, // Splash color
                          onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          doTask(taskId: taskId)),
                                )
                              } // Handle your onTap here.

                          ),
                    ),
                  )),
            ),
          ])
        ]));
  }
}
