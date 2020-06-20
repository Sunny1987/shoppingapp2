import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shoppingapp2/app_consts/app_var.dart';
import 'package:shoppingapp2/views/homepage_view.dart';
import 'package:shoppingapp2/widgets/customtextfield_widget.dart';

class AuthenticationView extends StatefulWidget {
  static String id = 'authenticationpage';

  @override
  _AuthenticationViewState createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  String _email, _password;
  GlobalKey<FormState> _globalFormKey = GlobalKey();
  bool _isLogin = true;

  getInput(String input) {
    if (input.contains('@')) {
      _email = input.trim();
    } else {
      _password = input.trim();
    }
  }

  _submit() {
    if (_globalFormKey.currentState.validate()) {
      _globalFormKey.currentState.save();
      print(_email);
      print(_password);
      Navigator.pushNamed(context, HomePage.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(welcomepic),
                fit: BoxFit.cover,
                //colorFilter: Color
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 8.0,
                sigmaY: 8.0,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Container(
                          //padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Center(
                            child: Text(
                              appname,
                              style: TextStyle( 
                                color: Color(mywhite1),
                                fontSize: 22.0,
                                fontFamily: 'Nexa',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 4,
                        child: Container(
                          child: Form(
                            key: _globalFormKey,
                            child: Column(
                              children: <Widget>[
                                CustomEmailTextField(
                                  text: 'Email Id',
                                  inputfn: getInput,
                                ),
                                SizedBox(height: 10.0),
                                _isLogin == false
                                    ? Column(
                                        children: <Widget>[
                                          //SizedBox(height: 10.0),
                                          CustomUsernameTextField(
                                            text: 'Username',
                                            inputfn: getInput,
                                          ),
                                          SizedBox(height: 10.0),
                                        ],
                                      )
                                    : SizedBox(),
                                CustomPasswordTextField(
                                  text: 'Password',
                                  inputfn: getInput,
                                ),
                                SizedBox(height: 20.0),
                                _isLogin
                                    ? GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            color: Color(mywhite1),
                                            fontFamily: 'Nexa',
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      )
                                    : Text(''),
                                SizedBox(height: 30.0),
                                InkWell(
                                  onTap: () => _submit(),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.9,
                                    height:
                                        MediaQuery.of(context).size.width *
                                            0.2,
                                    decoration: BoxDecoration(
                                      color: Color(myyellow),
                                      borderRadius:
                                          BorderRadius.circular(40.0),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0.0, 2.0),
                                            color: Colors.black38,
                                            blurRadius: 2.0),
                                      ],
                                    ),
                                    child: _isLogin
                                        ? Center(
                                            child: Text(
                                            'Sign In',
                                            style: TextStyle(
                                              color: Color(mywhite1),
                                              fontFamily: 'Nexa',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                            ),
                                          ))
                                        : Center(
                                            child: Text(
                                            'Sign Up',
                                            style: TextStyle(
                                              color: Color(mywhite1),
                                              fontFamily: 'Nexa',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                            ),
                                          )),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  child: _isLogin
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Don\'t have an account?',
                                              style: TextStyle(
                                                color: Color(mywhite1),
                                                fontFamily: 'Nexa',
                                                fontSize: 10.0,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _isLogin = !_isLogin;
                                                });
                                              },
                                              child: Text(
                                                'Sign Up',
                                                style: TextStyle(
                                                  color: Color(mywhite1),
                                                  fontFamily: 'Nexa',
                                                  fontSize: 12.0,
                                                  decoration: TextDecoration
                                                      .underline,
                                                  //textBaseline:
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Already have an account?',
                                              style: TextStyle(
                                                color: Color(mywhite1),
                                                fontFamily: 'Nexa',
                                                fontSize: 10.0,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _isLogin = !_isLogin;
                                                });
                                              },
                                              child: Text(
                                                'Sign In',
                                                style: TextStyle(
                                                  color: Color(mywhite1),
                                                  fontFamily: 'Nexa',
                                                  fontSize: 12.0,
                                                  decoration: TextDecoration
                                                      .underline,
                                                  //textBaseline:
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
