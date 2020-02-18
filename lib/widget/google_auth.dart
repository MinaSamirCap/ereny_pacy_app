import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginGoogle extends StatefulWidget {
  final Function afterSingin;
  final Widget child;
  LoginGoogle({@required this.afterSingin, @required this.child});
  @override
  LoginGoogleState createState() => LoginGoogleState();
}

class LoginGoogleState extends State<LoginGoogle> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isUserSignedIn = false;

  @override
  void initState() {
    super.initState();

    checkIfUserIsSignedIn();
  }

  void checkIfUserIsSignedIn() async {
    var userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onGoogleSignIn(context);
      },
      child: widget.child,
    );
  }

  Future<void> _handleSignIn() async {
    bool userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });

    if (isUserSignedIn) {
    } else {
      try {
        final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // final AuthCredential credential = GoogleAuthProvider.getCredential(
        //   accessToken: googleAuth.accessToken,
        //   idToken: googleAuth.idToken,
        // );
        print("object");
        print(googleAuth.accessToken);

        userSignedIn = await _googleSignIn.isSignedIn();
        setState(() {
          isUserSignedIn = userSignedIn;
        });
      } catch (e) {
        print(e);
      }
    }

    return;
  }

  void onGoogleSignIn(BuildContext context) async {
    await _handleSignIn();
    if (isUserSignedIn) {
      // _googleSignIn.signOut();

      // widget.afterSingin();
    } else {
      print("error");
    }
  }
}
