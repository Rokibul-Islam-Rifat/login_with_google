import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_with_google/auth_service.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final AuthService authService = AuthService();
  Future<void> signIn(BuildContext context) async {
    User? user = await authService.signInWithGoogle();
    if (user != null) {
      print("signed in as ${user.displayName}");
    } else {
      print("sign in failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Sign-In")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => signIn(context),
          child: Text("Sign in with google"),
        ),
      ),
    );
  }
}
