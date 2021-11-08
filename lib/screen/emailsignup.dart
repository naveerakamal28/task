// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deeveloper/component/textfield.dart';
import 'package:deeveloper/auth.dart';
import 'package:deeveloper/screen/logedin user.dart';
import 'package:deeveloper/screen/email login.dart';
import 'package:email_auth/email_auth.dart';


class EmailSignup extends StatefulWidget {
  static String id = 'emailin';
  const EmailSignup({Key key}) : super(key: key);

  @override

  _EmailSignupState createState() => _EmailSignupState();
}

class _EmailSignupState extends State<EmailSignup> {
  @override
  EmailAuth emailAuth;
  bool submitValid = false;
  bool otpValue = false;
  TextEditingController _emailText = TextEditingController();
  TextEditingController _otpText = TextEditingController();
  TextEditingController _passwordText = TextEditingController();

  void initState() {
    super.initState();
    // Initialize the package
    emailAuth = new EmailAuth(
      sessionName: "Sample session",
    );
  }
  void verify() {
   bool res =  emailAuth.validateOtp(
        recipientMail: _emailText.value.text,
        userOtp: _otpText.value.text);
   print(res);
   setState(() {
     otpValue = res;
   });
  }
  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: _emailText.value.text, otpLength: 5);
    if (result) {
      setState(() {
        submitValid = true;
      });
    }
  }




  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.only(left: 20,right: 20),
          children: [
            SizedBox(height: 150),
            Text('Email'),
            SizedBox(
              height: 10,
            ),
            TextFieldWithController(onPress:(value){}, controller: _emailText, textObsecure: false),
            Padding(padding: EdgeInsets.all(40),
              child: FlatButton(
                onPressed: sendOtp,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)
                  ),
                    color: Colors.black,

                  ),
                  child: Center(child: Text('Request Otp',style: TextStyle(color: Colors.white),

                  )
                  ),
                ),
              ),
            ),
            Text('OTP'),
            SizedBox(
              height: 10,
            ),
            TextFieldWithController(onPress:(value){}, controller: _otpText, textObsecure: false),
            Padding(padding: EdgeInsets.all(40),
              child: FlatButton(
                onPressed:verify,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)
                  ),
                    color: Colors.black,

                  ),
                  child: Center(child: Text('Verify',style: TextStyle(color: Colors.white),

                  )
                  ),
                ),
              ),
            ),

            if(otpValue)Text('Password'),
            if(otpValue)SizedBox(
              height: 10,
            ),
            if(otpValue)TextFieldWithController(onPress:(value){}, controller: _passwordText, textObsecure: true),
            if(otpValue)SizedBox(height: 20),
            if(otpValue)Padding(padding: EdgeInsets.all(40),
              child: FlatButton(
                onPressed: (){
                  AuthClass()
                      .createAccount(
                      email: _emailText.text.trim(),
                      password: _passwordText.text.trim(),

                  )
                      .then((value) {
                    if (value == "Account created") {
                      Navigator.pushNamed(context, LogedInuser.id);
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));
                    }
                  });
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)
                  ),
                    color: Colors.black,

                  ),
                  child: Center(child: Text('signup',style: TextStyle(color: Colors.white),

                  )
                  ),
                ),
              ),
            ),
            if(otpValue)FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, EmailLogin.id);
              },
              child: Text(
                'Already have an account, SignIn',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12
                ),
              ),
            )

          ],
        ),

      ),
    );
  }
}