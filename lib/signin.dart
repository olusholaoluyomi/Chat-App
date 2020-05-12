import 'package:chatapp/messagepage.dart';
import 'package:flutter/material.dart';
//import 'chatpage.dart';
import 'package:chatapp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';


//Login Page
class LogIn extends StatefulWidget {
  static const String id = "LOGIN";
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  //calling firebase to authenticate
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email;
  String password;
  //function to actually register user
  Future<void> loginUser() async {
    FirebaseUser user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MessagePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("Talk to me")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: (Image.asset("images/chatapplogo.png",
                          width: 200, height: 200)),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40.0,
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) => email = value,
                          decoration: InputDecoration(
                            hintText: "Enter Your Email ...",
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          autocorrect: false,
                          obscureText: true,
                          onChanged: (value) => password = value,
                          decoration: InputDecoration(
                            hintText: "Set a password",
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        CustomButton(
                          text: "Log In",
                          callback: () async {
                            await loginUser();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
