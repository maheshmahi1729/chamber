import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:seo/screens/auth/signup_screen.dart';
import 'package:seo/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isShowPassword = false;

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff222222),
      body: SizedBox(
        height: height,
        width: width,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: height,
              width: width,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.08,
                        fontFamily: "Barlow",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "E-mail",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.04,
                              fontFamily: "Barlow",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            width: width * 0.95,
                            height: 43,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Color(0xffa2a2a6),
                                width: 1,
                              ),
                              color: Color(0xff262626),
                            ),
                            // padding: const EdgeInsets.symmetric(
                            //   horizontal: 12,
                            //   vertical: 6,
                            // ),
                            child: TextFormField(
                              controller: email,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: width * 0.038,
                                fontFamily: "Barlow",
                                fontWeight: FontWeight.w900,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                  color: Color(0xff747980),
                                ),
                                hintText: "Your Email",
                                hintStyle: TextStyle(
                                  color: Color(0xff747980),
                                  fontSize: width * 0.03,
                                  fontFamily: "Barlow",
                                  fontWeight: FontWeight.w800,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.01),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Password",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.04,
                                fontFamily: "Barlow",
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            width: width * 0.95,
                            height: 43,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Color(0xffa2a2a6),
                                width: 1,
                              ),
                              color: Color(0xff262626),
                            ),
                            // padding: const EdgeInsets.symmetric(
                            //   horizontal: 12,
                            //   vertical: 6,
                            // ),
                            child: TextFormField(
                              obscureText: _isShowPassword,
                              controller: password,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: width * 0.038,
                                fontFamily: "Barlow",
                                fontWeight: FontWeight.w900,
                              ),
                              decoration: InputDecoration(
                                suffixIcon: !_isShowPassword
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isShowPassword = !_isShowPassword;
                                          });
                                        },
                                        child: Icon(Icons.visibility_outlined))
                                    : GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isShowPassword = !_isShowPassword;
                                          });
                                        },
                                        child: Icon(
                                            Icons.visibility_off_outlined)),
                                prefixIcon: Icon(
                                  Icons.lock_outline_rounded,
                                  color: Color(0xff747980),
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Color(0xff747980),
                                  fontSize: width * 0.03,
                                  fontFamily: "Barlow",
                                  fontWeight: FontWeight.w800,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.04,
                                  fontFamily: "Barlow",
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.05),
                          child: Container(
                            width: width * 0.8,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: [Color(0xff437ed6), Color(0xff33a6df)],
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: MaterialButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email: email.text,
                                              password: password.text)
                                          .then((value) {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: ((context) =>
                                                  HomeScreen()),
                                            ),
                                            (route) => false);
                                      });
                                    }
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.04,
                                      fontFamily: "Barlow",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 3,
                          width: width * 0.25,
                          decoration: BoxDecoration(
                              color: Color(0xff747980),
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        Text(
                          "or continue with",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff747980),
                            fontSize: width * 0.04,
                            fontFamily: "Barlow",
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Container(
                          height: 3,
                          width: width * 0.25,
                          decoration: BoxDecoration(
                              color: Color(0xff747980),
                              borderRadius: BorderRadius.circular(2)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: width * 0.2,
                            width: width * 0.20,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white70),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: MaterialButton(
                                onPressed: () {
                                  signInWithFacebook();
                                },
                                child: Center(
                                  child: Image.asset(
                                      'assets/images/auth/facebook.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: width * 0.2,
                            width: width * 0.20,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white70),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: MaterialButton(
                                onPressed: () {
                                  signInWithGoogle();
                                },
                                child: Center(
                                  child: Image.asset(
                                      'assets/images/auth/google.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Don,t have an account?",
                            style: TextStyle(
                              color: Color(0xff747980),
                              fontSize: width * 0.04,
                              fontFamily: "Barlow",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()),
                                  (route) => false);
                            },
                            child: Text(
                              "Signup",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.04,
                                fontFamily: "Barlow",
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  signInWithFacebook() async {
    final fb = FacebookLogin();
    // Log in
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    // Check result status
    switch (res.status) {
      case FacebookLoginStatus.success:
        // The user is suceessfully logged in
        // Send access token to server for validation and auth
        final FacebookAccessToken? accessToken = res.accessToken;
        final AuthCredential authCredential =
            FacebookAuthProvider.credential(accessToken!.token);
        final result = await FirebaseAuth.instance
            .signInWithCredential(authCredential)
            .then((value) async {
          var profile = fb.getUserProfile();
          FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set({
            "name": value.additionalUserInfo!.username,
            "email": value.user!.email,
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false);
        });
        // Get profile data from facebook for use in the app
        final profile = await fb.getUserProfile();
        // Get user profile image url
        final imageUrl = await fb.getProfileImageUrl(width: 100);
        print('Your profile image: $imageUrl');
        // fetch user email
        final email = await fb.getUserEmail();
        // But user can decline permission

        if (email != null) print('And your email is $email');
        break;
      case FacebookLoginStatus.cancel:
        // In case the user cancels the login process
        break;
      case FacebookLoginStatus.error:
        // Login procedure failed
        print('Error while log in: ${res.error}');
        break;
    }
  }

  signInWithGoogle() async {
    // Initiate the auth procedure
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();
    // fetch the auth details from the request made earlier
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    // Create a new credential for signing in with google
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential).then(
      (value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      },
    );
  }
}
