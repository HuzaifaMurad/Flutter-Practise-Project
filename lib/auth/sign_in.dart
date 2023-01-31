import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:food_delivery/providers/user_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../screens/Home/homescreen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  UserProvider? userProvider;
  Future<User?> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final User? users = (await _auth.signInWithCredential(credential)).user;

      await userProvider?.addUserData(
        currentUser: users!,
        userEmail: users.email,
        userImage: users.photoURL,
        userName: users.displayName,
      );

      return users;
    } catch (e) {
      print('this is error :$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/wallpaper2.jpeg'), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 400,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "sign In to Continue",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const Text(
                      "Foodie ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          shadows: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.green,
                              spreadRadius: 10,
                              offset: Offset(2, 2),
                            )
                          ]),
                    ),
                    Column(
                      children: [
                        SignInButton(
                          Buttons.Apple,
                          text: "Sign in with Apple",
                          onPressed: () async {
                            await _googleSignUp();
                          },
                        ),
                        SignInButton(
                          Buttons.Google,
                          text: "Sign in with Google",
                          onPressed: () {
                            _googleSignUp().then((value) {
                              log("signing into the account asked by the user " +
                                  '${value?.email}');
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            }).onError((error, stackTrace) {
                              log(error.toString());
                            });
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          "By signing in ur are agreeing to our ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              shadows: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                )
                              ]),
                        ),
                        Text(
                          "Terms and Policy ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              shadows: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                )
                              ]),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
