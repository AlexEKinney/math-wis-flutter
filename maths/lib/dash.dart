import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class DashPage extends StatelessWidget {
  const DashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      Get.offAll(() => const SignInPage2());
    }
    String? CheckUserName() {
      if (FirebaseAuth.instance.currentUser!.displayName != null) {
        return FirebaseAuth.instance.currentUser?.displayName;
      } else {
        return "Failed To Load Name";
      }
    }

    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                const SliverAppBar(
                  expandedHeight: 0,
                  floating: true,
                  pinned: true,
                  snap: true,
                  stretch: false,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    collapseMode: CollapseMode.parallax,
                    title: Text("Maths In Wisconsin",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                        )),
                  ),
                ),
              ];
            },
            body: Center(
              child: Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: const SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(
                      child: Text(
                    'No Upcoming Assignments!',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
            )));
  }
}
