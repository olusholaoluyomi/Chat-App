import 'package:chatapp/messagepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'chatpage.dart';
//import 'messagepage.dart';
import 'signin.dart';
import 'signup.dart';

void main(){
  SystemChrome.setEnabledSystemUIOverlays([]);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat App',
      theme: ThemeData.light(),
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        SignUp.id: (context) => SignUp(),
        LogIn.id: (context) => LogIn(),
        ChatPage.id: (context) => ChatPage(),
        MessagePage.id: (context) => MessagePage()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const String id = "HOMEPAGE";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset("images/chatapplogo.png",
                      width: 200, height: 200),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          CustomButton(
            text: "Log In",
            callback: () {
              Navigator.of(context).pushNamed(LogIn.id);
            },
          ),
          CustomButton(
            text: "Sign Up",
            callback: () {
              Navigator.of(context).pushNamed(SignUp.id);
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CustomButton({Key key, this.callback, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 6.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200.0,
          height: 45,
          child: Text(text),
        ),
      ),
    );
  }
}
