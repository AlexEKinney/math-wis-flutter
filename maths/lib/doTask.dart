import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:appwrite/appwrite.dart';
import 'package:dialogs/dialogs.dart';
import 'package:get/get.dart';

import 'login.dart';

class doTask extends StatefulWidget {
  doTask({super.key, required this.taskId});
  final String taskId;

  @override
  State<doTask> createState() => _doTaskState();
}

class _doTaskState extends State<doTask> {
  //   if (FirebaseAuth.instance.currentUser == null) {
  final TextEditingController emailController = TextEditingController();

  double _progress = 0.0;
  String _question = "What is 1+1";
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Let's placeholder, Andrew!"),
        automaticallyImplyLeading: false,
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 50,
            animation: true,
            lineHeight: 20.0,
            animationDuration: 1500,
            percent: _progress,
            center: const Text("Your Progress"),
            // ignore: deprecated_member_use
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.blueGrey,
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Text(
              _question,
              textScaleFactor: 3,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: emailController,
            validator: (value) {
              // add email validation
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              bool emailValid = RegExp("^[0-9]").hasMatch(value);
              if (!emailValid) {
                return 'Please enter a valid email';
              }

              return null;
            },
            decoration: InputDecoration(
              enabled: _enabled,
              labelText: 'Answer',
              hintText: 'Answer',
              prefixIcon: Icon(Icons.question_answer_outlined),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: FloatingActionButton.extended(
              onPressed: () async {
                print(emailController.text);
                if (_progress < 0.2) {
                  print(_progress);
                  if (emailController.text == "2") {
                    ProgressDialog progressDialog = ProgressDialog(
                      context: context,
                      loadingText: "You are a winner!",
                      backgroundOverlay: Colors.green,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    );
// show dialog
                    progressDialog.show();

                    await 1500.milliseconds.delay();

                    progressDialog.dismiss();
                    setState(() {
                      _question = "What is 8+2";
                      _progress = _progress + 0.33;
                      emailController.text = "";
                    });
                  } else {
                    const AlertDialog(
                      title: Text("Success"),
                      content: Text("Saved successfully"),
                    );
                    print("issue");
                    //Create an instance of ProgressDialog
                    ProgressDialog progressDialog = ProgressDialog(
                      context: context,
                      loadingText: "Incorrect, please try again",
                      backgroundOverlay: Colors.red,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    );
// show dialog
                    progressDialog.show();

                    await 1500.milliseconds.delay();

                    progressDialog.dismiss();
                  }
                } else if (_progress == 0.33) {
                  if (emailController.text == "10") {
                    ProgressDialog progressDialog = ProgressDialog(
                      context: context,
                      loadingText: "You are a winner!",
                      backgroundOverlay: Colors.green,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    );
// show dialog
                    progressDialog.show();

                    await 1500.milliseconds.delay();

                    progressDialog.dismiss();
                    setState(() {
                      _question = "What is 4+1";
                      _progress = _progress = 0.66;
                      emailController.text = "";
                    });
                  } else {
                    const AlertDialog(
                      title: Text("Success"),
                      content: Text("Saved successfully"),
                    );
                    print("issue");
                    //Create an instance of ProgressDialog
                    ProgressDialog progressDialog = ProgressDialog(
                      context: context,
                      loadingText: "Incorrect, please try again",
                      backgroundOverlay: Colors.red,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    );
// show dialog
                    progressDialog.show();

                    await 1500.milliseconds.delay();

                    progressDialog.dismiss();
                  }
                } else if (_progress == 0.66) {
                  if (emailController.text == "5") {
                    ProgressDialog progressDialog = ProgressDialog(
                      context: context,
                      loadingText:
                          "You completed the task and earned 100 coins!",
                      backgroundOverlay: Colors.green,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    );
// show dialog
                    progressDialog.show();

                    await 1500.milliseconds.delay();

                    progressDialog.dismiss();
                    setState(() {
                      _question = "Finished!\nPlease Wait.";
                      _enabled = false;
                      _progress = _progress = 1;
                      emailController.text = "";
                    });

                    await 500.milliseconds.delay();
                    Navigator.pushReplacementNamed(context, "/base");
                    // ignore: use_build_context_synchronously
                    ProgressDialog progressDialog2 = ProgressDialog(
                      context: context,
                      loadingText:
                          "You successfully completed the task!\n100 coins have been added to your account!\nPlease wait while we redirect you to the home page.",
                      backgroundOverlay: Colors.green,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    );
// show dialog
                    progressDialog2.show();

                    await 1500.milliseconds.delay();

                    progressDialog2.dismiss();
                  } else {
                    const AlertDialog(
                      title: Text("Success"),
                      content: Text("Saved successfully"),
                    );
                    print("issue");
                    //Create an instance of ProgressDialog
                    ProgressDialog progressDialog = ProgressDialog(
                      context: context,
                      loadingText: "Incorrect, please try again",
                      backgroundOverlay: Colors.red,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    );
// show dialog
                    progressDialog.show();

                    await 1500.milliseconds.delay();

                    progressDialog.dismiss();
                  }
                }
              },
              label: Text('Check Answer'),
              icon: Icon(Icons.check_circle_outline_rounded),
            )),
      ]),
    );
  }
}
