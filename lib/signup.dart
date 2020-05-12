import 'package:chatapp/main.dart';
import 'package:chatapp/signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
/*import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';*/
//import 'chatpage.dart';
//import 'messagepage.dart';
// Signup Page

class SignUp extends StatefulWidget {
  static const String id = "SIGNUP";
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //calling firebase to authenticate
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email;
  String password;
  
  //function to actually register user
  Future<void> signUp() async {
    FirebaseUser user = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LogIn(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("Talk to me")),
      body: Container(
          height: MediaQuery.of(context).size.height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Hero(
                    tag: 'logo',
                    child: (Image.asset("images/chatapplogo.png",
                        width: 200, height: 200)),
                  ),
                ),
                Expanded(
                  child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Pick Username",
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Enter Your Phone number",
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
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
                      height: 10.0,
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
                      text: "Sign Up",
                      callback: () async {
                        await signUp();
                      },
                    ),
                  ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
