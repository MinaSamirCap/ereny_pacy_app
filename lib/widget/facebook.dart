import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginFB extends StatefulWidget {
  final Function afterSingin;
  final Widget child;

  LoginFB({this.afterSingin, this.child});

  @override
  _LoginFBState createState() => new _LoginFBState();
}

class _LoginFBState extends State<LoginFB> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  bool isUserSignedIn = false;
  String _message = 'Log in/out by pressing the buttons below.';

  void initState() {
    super.initState();
    checkIfUserIsSignedIn();
  }

  void checkIfUserIsSignedIn() async {
    var userSignedIn = await facebookSignIn.isLoggedIn;

    setState(() {
      isUserSignedIn = userSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onFacebookSignIn(context);
        },
        child: widget.child);
  }

  Future<void> handleSignIn() async {
    bool userSignedIn = await facebookSignIn.isLoggedIn;

    setState(() {
      isUserSignedIn = userSignedIn;
    });

    if (isUserSignedIn) {
    } else {
      final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          final FacebookAccessToken accessToken = result.accessToken;
          _showMessage('''
           Logged in!

           Token: ${accessToken.token}
           User id: ${accessToken.userId}
           Expires: ${accessToken.expires}
           Permissions: ${accessToken.permissions}
           Declined permissions: ${accessToken.declinedPermissions}
           ''');

          userSignedIn = await facebookSignIn.isLoggedIn;
          setState(() {
            isUserSignedIn = userSignedIn;
          });
          break;
        case FacebookLoginStatus.cancelledByUser:
          _showMessage('Login cancelled by the user.');
          break;
        case FacebookLoginStatus.error:
          _showMessage('Something went wrong with the login process.\n'
              'Here\'s the error Facebook gave us: ${result.errorMessage}');
          break;
      }
    }

    return;
  }

  void onFacebookSignIn(BuildContext context) async {
    await handleSignIn();
    if (isUserSignedIn) {
      widget.afterSingin();
    } else {
      print("error");
    }
  }

  void _showMessage(String message) {
    _message = message;
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ));
    print(_message);
  }
}
