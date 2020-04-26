import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quizmaker/helper/functions.dart';
import 'package:quizmaker/helper/theme.dart';
import 'package:quizmaker/services/auth.dart';
import 'package:quizmaker/services/database.dart';
import 'package:quizmaker/views/home_container.dart';
import 'package:quizmaker/views/signup.dart';
import 'package:quizmaker/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  AuthService authService = new AuthService();
  DatabaseService _databaseMethods = DatabaseService();

  bool _isLoading = false;

  signIn() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService.signInEmailAndPass(email, password).then((val) async {
        if (val != null) {
          setState(() {
            _isLoading = false;
          });

          QuerySnapshot userInfoSnapshot =
              await _databaseMethods.getUserInfo(email);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              userInfoSnapshot.documents[0].data["userName"]);
          HelperFunctions.saveUserAvatarSharedPreference(
              userInfoSnapshot.documents[0].data["avatarUrl"]);
          HelperFunctions.saveUserEmailSharedPreference(email);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomeContainer()));
        }
        /*else{
          setState(() {
            _isLoading = false;
          });
        }*/
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("we are inside sign in");
    return Scaffold(
      backgroundColor: MyThemeData.backgroundColor,
      appBar: appBarMain(context),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Container(
                  width: 500,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Spacer(),
                      Image.asset(
                        "assets/images/playquiz_illustration.png",
                        height: 300,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        style: MyThemeData.inputTextStyle(),
                        validator: (val) {
                          return val.isEmpty ? "Enter Email id" : null;
                        },
                        decoration: MyThemeData.themedecoration("Email"),
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        style: MyThemeData.inputTextStyle(),
                        obscureText: true,
                        validator: (val) {
                          return val.isEmpty ? "Enter Password" : null;
                        },
                        decoration: MyThemeData.themedecoration("Password"),
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          signIn();
                        },
                        child: blueButton(context: context, label: "Sign In"),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                          onTap: () async {
                            await authService.signInWithGoogle(context);
                          },
                          child: whiteButton(
                              context: context, label: "Sign In with Google")),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 15.5,
                              color: Colors.black54,
                              fontFamily: 'OverpassRegular',
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: SignUp()));
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 15.5,
                                  color: Colors.black54,
                                  fontFamily: 'OverpassRegular',
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
