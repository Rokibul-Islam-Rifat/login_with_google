# login_with_google

A new Flutter project that use as a google sign in .

## Getting Started

For implementing Facebook login First you need to create a project 2. You need to install 3 packages in pubspec.yml

firebase auth
firebase core
google_sign_in => command Flutter pub get in terminal.
On the browser then go and open the firebase console site with it, first go to the firebase console and click on create project, then give it a name, then click on the continue option, select any option in Configure Google Analytics until it comes to Configure Google Analytics. When the project is created, click on the flutter option, click on the Firebase CLI option and paste this code in the project's terminal and press enter

=> npm install -g firebase-tools

In firebase's Prepare your workspace, click on next

=> dart pub global activate flutterfire_cli 
=>flutterfire configure --project=asfds-f151f

Copy these 2 options and paste them in the terminal then again next 
=> Initialize Firebase and add plugins await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform, ); Copy this to the project main. dart 
void main() async { 
WidgetsFlutterBinding.ensureInitialized(); 
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); 
runApp(const MyApp()); 
} 
You have to paste it like this then next => After that, go to the project over video and build =>Authentication=>signin -Method =>Select Facebook Now you have to go to the facebook developer site => Select my app => Create app => Give a name to app details => Use case from others => business => Click create again and then give password => Facebook login with Facebook Login for Business setup => QuickStart => Select Android => Step 1 next =>In your project,
//=====================home page===========

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
//===========================Auth Service page================================

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<User?>signInWithGoogle()async{
    try{
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if(googleUser == null){
        return null;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential = await auth.signInWithCredential(credential);
      return userCredential.user;
    }
    catch(e){
      print("Error Durin Google Sign In: $e");
      return null;
    }
  }
  Future<void> signOut()async{
    await googleSignIn.signOut();
    await auth.signOut();
  }
}
//=========================================================
this is for google sign in video resourse 
https://www.loom.com/share/9d6ee9ecdaee48afb43421630ae4bcce?sid=6188e79e-eeeb-453f-9be1-ce5696570633
