import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seo/screens/auth/login_screen.dart';
import 'package:seo/screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController userName = new TextEditingController();

  bool _isShowPassword = false;
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
                      "Sign up",
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
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.01),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Username",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.04,
                                fontFamily: "Barlow",
                                fontWeight: FontWeight.bold,
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
                              controller: userName,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: width * 0.038,
                                fontFamily: "Barlow",
                                fontWeight: FontWeight.w900,
                              ),
                              decoration: InputDecoration(
                                hintText: "Your Username",
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
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "By signing up you agree to our",
                                style: TextStyle(
                                  color: Color.fromARGB(199, 255, 255, 255),
                                  fontSize: 15,
                                  fontFamily: "Barlow",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: " Terms & Condition",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 15,
                                  fontFamily: "Barlow",
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextSpan(
                                text: " and",
                                style: TextStyle(
                                  color: Color.fromARGB(188, 255, 255, 255),
                                  fontSize: 15,
                                  fontFamily: "Barlow",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: " Privacy Policy.",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 15,
                                  fontFamily: "Barlow",
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ])),
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
                                      // FirebaseAuth.instance
                                      //     .signInWithEmailAndPassword(
                                      //         email: email.text,
                                      //         password: password.text)
                                      //     .then((value) {
                                      //   Navigator.pushAndRemoveUntil(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //         builder: ((context) =>
                                      //             HomeScreen()),
                                      //       ),
                                      //       (route) => false);
                                      // });
                                      FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: email.text,
                                              password: password.text)
                                          .then((value) {
                                        FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.uid)
                                            .set({
                                          "name": userName.text,
                                          "email": email.text
                                        });
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()),
                                            (route) => false);
                                      });
                                    }
                                  },
                                  child: Text(
                                    "Signup",
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
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Already signed up?",
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
                                      builder: (context) => LoginScreen()),
                                  (route) => false);
                            },
                            child: Text(
                              "Login",
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
}
