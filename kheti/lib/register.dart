import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kheti/main.dart';

// ignore: must_be_immutable
class Registration extends StatelessWidget {
  static const String idScreen = 'register';
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 1.8),
              TextField(
                controller: nameTextEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(fontSize: 14.8),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10.8),
                ),
                style: TextStyle(fontSize: 14.8),
              ),
              SizedBox(height: 1.8),
              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(fontSize: 14.8),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10.8),
                ),
                style: TextStyle(fontSize: 14.8),
              ),
              SizedBox(height: 1.8),
              TextField(
                controller: phoneTextEditingController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone",
                  labelStyle: TextStyle(fontSize: 14.8),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10.8),
                ),
                style: TextStyle(fontSize: 14.8),
              ),
              SizedBox(height: 1.8),
              TextField(
                controller: passwordTextEditingController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 14.8),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10.8),
                ),
                style: TextStyle(fontSize: 14.8),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Container(
                  height: 58.8,
                  child: Center(
                    child: Text(
                      "Create account",
                      style:
                          TextStyle(fontSize: 18.0, fontFamily: "Brand Bold"),
                    ),
                  ),
                ),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(24.0),
                ),
                onPressed: () {
                  if (nameTextEditingController.text.length < 3) {
                    displayToastMessage(
                        "Name must be at least 3 characters.", context);
                  } else if (!emailTextEditingController.text.contains('@')) {
                    displayToastMessage("Email address is not valid.", context);
                  } else if (phoneTextEditingController.text.isEmpty &&
                      phoneTextEditingController.text.length < 10 &&
                      phoneTextEditingController.text.length > 10) {
                    displayToastMessage(
                        "Please type in the correct phone number.", context);
                  } else if (passwordTextEditingController.text.length < 5) {
                    displayToastMessage(
                        "Password myst be atleast 5 character", context);
                  } else {
                    registerNewUser(context);
                  }
                },
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  "already have an account? login here",
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  registerNewUser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      displayToastMessage("Error: " + errMsg.toString(), context);
    }))
        .user;
    if (firebaseUser != null) {
      usersRef.child(firebaseUser.uid);
      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "emai.": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
        "password": passwordTextEditingController.text.trim(),
      };
      usersRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage("Account created Successfully!!", context);
      Navigator.pushNamed(context, '/home');

      print("save info to database");
    } else {
      print("error occured!!");
      displayToastMessage("User not created!!", context);
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
