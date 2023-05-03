// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maths_in_wisconsin/emailAuth.dart';
import 'package:maths_in_wisconsin/main.dart';

class SignInPage2 extends StatelessWidget {
  const SignInPage2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
        body: Center(
            child: isSmallScreen
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      _Logo(),
                      _FormContent(),
                    ],
                  )
                : Container(
                    padding: const EdgeInsets.all(32.0),
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Row(
                      children: const [
                        Expanded(child: _Logo()),
                        Expanded(
                          child: Center(child: _FormContent()),
                        ),
                      ],
                    ),
                  )));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Image(
          image: AssetImage('assets/images/math.png'),
          height: 250,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Welcome to Maths In Wisconsin!",
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context).textTheme.headlineSmall
                : Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.black),
          ),
        ),
        const Text(
          "Please Sign In To Continue",
          textAlign: TextAlign.center,
        ),
        const Padding(padding: EdgeInsets.only(bottom: 8))
      ],
    );
  }
}

class _FormContent extends StatefulWidget {
  const _FormContent({Key? key}) : super(key: key);

  @override
  State<_FormContent> createState() => __FormContentState();
}

class __FormContentState extends State<_FormContent> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: FloatingActionButton(
                      child: const Icon(FontAwesomeIcons.google),
                      onPressed: () async {
                        FirebaseService service = FirebaseService();
                        try {
                          await service.signInwithGoogle().then(
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const MyHomePage(
                                            title: 'A',
                                          ))) as FutureOr Function(
                                  String? value));
                        } catch (e) {
                          if (kDebugMode) {
                            print(e);
                          }
                        }
                      },
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(8.0)),
                  SizedBox(
                    child: FloatingActionButton(
                      child: Icon(FontAwesomeIcons.microsoft),
                      onPressed: () async {
                        FirebaseService service = FirebaseService();
                        try {
                          await service.signInwithGoogle().then(
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const MyHomePage(
                                            title: 'A',
                                          ))) as FutureOr Function(
                                  String? value));
                        } catch (e) {
                          if (kDebugMode) {
                            print(e);
                          }
                        }
                      },
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(8.0)),
                  SizedBox(
                    child: FloatingActionButton(
                      child: Icon(FontAwesomeIcons.yahoo),
                      onPressed: () async {
                        FirebaseService service = FirebaseService();
                        try {
                          await service.signInwithGoogle().then(
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const MyHomePage(
                                            title: 'A',
                                          ))) as FutureOr Function(
                                  String? value));
                        } catch (e) {
                          if (kDebugMode) {
                            print(e);
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
            SizedBox(
              width: double.infinity,
              child: FloatingActionButton.extended(
                label: Text("Sign in with Email"),
                icon: const Icon(FontAwesomeIcons.solidEnvelope),
                onPressed: () async {
                  FirebaseService service = FirebaseService();
                  try {
                    Get.to(() => const emailAuthPage());
                  } catch (e) {
                    if (kDebugMode) {
                      print(e);
                    }
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
