import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

import 'login.dart';

class shopPage extends StatelessWidget {
  //   if (FirebaseAuth.instance.currentUser == null) {
  //   Get.offAll(() => const SignInPage2());
  // }

  const shopPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Colours",
                textScaleFactor: 2,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Card(
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            "50 Coins",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Card(
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            "150 Coins",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Card(
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            "250 Coins",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Card(
                        color: Colors.yellow,
                        child: Center(
                          child: Text(
                            "500 Coins",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Profile Pictures",
                textScaleFactor: 2,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Card(
                        color: Colors.white70,
                        child: Row(
                          children: [
                            Center(
                              child: Image(
                                image: NetworkImage(
                                    'http://194.163.173.4/v1/storage/buckets/64281b299b3b30d2f853/files/6429610b571d36e3189d/view?project=6428190391cc63f38311'),
                                width: 150,
                                height: 150,
                              ),
                            ),
                            Center(
                                child: Text(
                              "50 Coins",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ))
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Card(
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            "150 Coins",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Card(
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            "250 Coins",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Card(
                        color: Colors.yellow,
                        child: Center(
                          child: Text(
                            "500 Coins",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        )),
                  ),
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}
