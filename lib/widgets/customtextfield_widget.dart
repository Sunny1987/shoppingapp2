import 'package:flutter/material.dart';
import 'package:shoppingapp2/app_consts/app_var.dart';

class CustomEmailTextField extends StatefulWidget {
  final String text;
  final Function inputfn;

  CustomEmailTextField({this.text, this.inputfn});

  @override
  _CustomEmailTextFieldState createState() => _CustomEmailTextFieldState();
}

class _CustomEmailTextFieldState extends State<CustomEmailTextField> {
  FocusNode focusNode;
  // bool _isToggleVisibility = true;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.unfocus();
    print(focusNode.hasFocus);
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(focusNode.hasFocus);
    return TextFormField(
        focusNode: focusNode,
        decoration: InputDecoration(
          // suffixIcon: widget.text == 'Password'
          //     ? IconButton(
          //         icon: _isToggleVisibility
          //             ? Icon(Icons.visibility_off)
          //             : Icon(Icons.visibility),
          //         onPressed: () {
          //           setState(() {
          //             _isToggleVisibility = !_isToggleVisibility;
          //           });
          //         })
          //     : null,
          labelText: '${widget.text}',
          hoverColor: Colors.blueAccent,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Color(mywhite1),
              )),
          labelStyle:
              // focusNode.hasFocus
              //     ? TextStyle(
              //         color: Colors.blue,
              //       )
              //     :
              TextStyle(
            fontSize: 12,
            color: Color(mywhite1),
          ),
        ),
        cursorColor: Color(mywhite1),
        style: TextStyle(
          color: Color(mywhite1),
          fontFamily: 'Nexa',
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.emailAddress,
        //obscureText: widget.text == 'Password' ? _isToggleVisibility : false,
        onSaved: (input) => widget.inputfn(input),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter email id';
          }
          if (!(value.contains('@'))) {
            return 'Invalid Email Id';
          }
        });
  }
}

class CustomPasswordTextField extends StatefulWidget {
  final String text;
  final Function inputfn;

  CustomPasswordTextField({this.text, this.inputfn});

  @override
  _CustomPasswordTextFieldState createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  FocusNode focusNode;
  bool _isToggleVisibility = true;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.unfocus();
    print(focusNode.hasFocus);
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(focusNode.hasFocus);
    return TextFormField(
        focusNode: focusNode,
        decoration: InputDecoration(
          suffixIcon: widget.text == 'Password'
              ? IconButton(
                  icon: _isToggleVisibility
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _isToggleVisibility = !_isToggleVisibility;
                    });
                  })
              : null,
          labelText: '${widget.text}',
          hoverColor: Colors.blueAccent,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Color(mywhite1),
              )),
          labelStyle:
              // focusNode.hasFocus
              //     ? TextStyle(
              //         color: Colors.blue,
              //       )
              //     :
              TextStyle(
            fontSize: 12,
            color: Color(mywhite1),
          ),
        ),
        cursorColor: Color(mywhite1),
        style: TextStyle(
          color: Color(mywhite1),
          fontFamily: 'Nexa',
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.emailAddress,
        obscureText: _isToggleVisibility,
        onSaved: (input) => widget.inputfn(input),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter password';
          }
          if (value.length < 6) {
            return 'Length less than 6 characters';
          }
          // if (!(value.contains('@'))) {
          //   return 'Invalid Email Id';
          // }
        });
  }
}

class CustomUsernameTextField extends StatefulWidget {
  final String text;
  final Function inputfn;

  CustomUsernameTextField({this.text, this.inputfn});

  @override
  _CustomUsernameTextFieldState createState() =>
      _CustomUsernameTextFieldState();
}

class _CustomUsernameTextFieldState extends State<CustomUsernameTextField> {
  FocusNode focusNode;
  // bool _isToggleVisibility = true;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.unfocus();
    print(focusNode.hasFocus);
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(focusNode.hasFocus);
    return TextFormField(
        focusNode: focusNode,
        decoration: InputDecoration(
          labelText: '${widget.text}',
          hoverColor: Colors.blueAccent,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Color(mywhite1),
              )),
          labelStyle:
              // focusNode.hasFocus
              //     ? TextStyle(
              //         color: Colors.blue,
              //       )
              //     :
              TextStyle(
            fontSize: 12,
            color: Color(mywhite1),
          ),
        ),
        cursorColor: Color(mywhite1),
        style: TextStyle(
          color: Color(mywhite1),
          fontFamily: 'Nexa',
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.emailAddress,
        onSaved: (input) => widget.inputfn(input),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a username';
          }
        });
  }
}
