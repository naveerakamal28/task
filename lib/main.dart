import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deeveloper/screen/emailsignup.dart';
import 'package:deeveloper/screen/emailsignup.dart';
import 'package:deeveloper/screen/email login.dart';
import 'package:deeveloper/screen/logedin user.dart';
import 'package:deeveloper/screen/phoneLogin.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        EmailLogin.id: (context) => EmailLogin(),
        EmailSignup.id : (context)=>EmailSignup(),
        LogedInuser.id : (context)=>LogedInuser(),
        LoginScreen.id: (context)=>LoginScreen(),

      },

    );
  }
}

class MyHomePage extends StatefulWidget {
  static String id = 'myhome';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(30),
            child: FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, EmailSignup.id);
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(20)),
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    'Continue with email',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white60,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(30),
            child: FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, LoginScreen.id);
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(20)),
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    'Continue with phone number',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white60,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
