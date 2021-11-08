// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deeveloper/screen/emailsignup.dart';
import 'package:deeveloper/main.dart';
import 'package:deeveloper/component/textfield.dart';
import 'package:deeveloper/screen/planList.dart';


import '../auth.dart';

class LogedInuser extends StatefulWidget {
  static String id = 'loggedin';
  const LogedInuser({Key key}) : super(key: key);

  @override
  _LogedInuserState createState() => _LogedInuserState();
}

class _LogedInuserState extends State<LogedInuser> {
  CollectionReference plan = FirebaseFirestore.instance.collection('plan');
  TextEditingController _planName = TextEditingController();
  TextEditingController _planPrice = TextEditingController();
  TextEditingController _plandes = TextEditingController();
  TextEditingController _plandur = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            height: 80,
            width: double.infinity,
            color: Colors.grey[900],
            alignment: Alignment.centerRight,
            child: FlatButton(
              onPressed: (){
                AuthClass().signOut();
              },
              child: Container(
                height: 40,
                width: 100,
                color: Colors.black,
                alignment: Alignment.center,
                child: Text(
                  'SignOut',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ),
       body: ListView(
         padding: EdgeInsets.only(left: 20,right: 20),
         children: [
           SizedBox(height: 20,),
           Text(
             'Plan Name',
             style: TextStyle(
               color: Colors.black
             ),
           ),
           SizedBox(height: 15,),
           TextFieldWithController(
               onPress: (value){},
               controller: _planName,
               textObsecure: false
           ),
           SizedBox(height: 30,),
           Text(
             'Plan Price',
             style: TextStyle(
                 color: Colors.black
             ),
           ),
           SizedBox(height: 15,),
           TextFieldWithController(
               onPress: (value){},
               controller: _planPrice,
               textObsecure: false
           ),
           SizedBox(height: 30,),
           Text(
             'Plan Description',
             style: TextStyle(
                 color: Colors.black
             ),
           ),
           SizedBox(height: 15,),
           TextFieldWithController(
               onPress: (value){},
               controller: _plandes,
               textObsecure: false
           ),
           SizedBox(height: 30,),
           Text(
             'Plan Duration',
             style: TextStyle(
                 color: Colors.black
             ),
           ),
           SizedBox(height: 15,),
           TextFieldWithController(
               onPress: (value){},
               controller: _plandur,
               textObsecure: false
           ),
           SizedBox(height: 30,),
           Padding(padding: EdgeInsets.all(40),
             child: FlatButton(
               onPressed: (){
                 plan.add({
                   'name' : _planName.text,
                   'des'  : _plandes.text,
                   'dur'  : _plandur.text,
                   'price'  : _planPrice.text
                 });

               },
               child: Container(
                 height: 40,
                 decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)
                 ),
                   color: Colors.black,
                 ),
                 child: Center(child: Text('Upload Details',style: TextStyle(color: Colors.white),
                 )
                 ),
               ),
             ),
           ),


         ],
       ),
      ),
    );

  }
}