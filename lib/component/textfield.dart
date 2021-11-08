// @dart=2.9
import 'package:flutter/material.dart';

class TextFieldWithController extends StatefulWidget {
  TextFieldWithController({@required this.onPress , @required this.controller, @required this.textObsecure});

  final Function onPress;
  final TextEditingController controller;
  final bool textObsecure;

  @override
  State<TextFieldWithController> createState() => _TextFieldWithControllerState();
}

class _TextFieldWithControllerState extends State<TextFieldWithController> {
  @override
  Widget build(BuildContext context) {
    final appTheme = MediaQuery.of(context).platformBrightness == Brightness.dark ? 'darkTheme' : 'LightTheme';
    return TextField(
      // inputFormatters: [BlacklistingTextInputFormatter(RegExp("^[ ]*\$"))],
      // enabled: true,
      // autofocus: true,
      obscureText: widget.textObsecure,
      controller: widget.controller,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.black,
      ),
      // selectionWidthStyle: ui.BoxWidthStyle.tight,
      onChanged: widget.onPress,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color:Colors.black ,width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.5),
              borderRadius: BorderRadius.circular(25.0)
          )
      ),
    );
  }
}