import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quizmaker/secret/data.dart';
import 'package:quizmaker/helper/functions.dart';
import 'package:quizmaker/helper/theme.dart';
import 'package:quizmaker/services/auth.dart';
import 'package:quizmaker/services/database.dart';
import 'package:quizmaker/views/home_container.dart';
import 'package:quizmaker/views/signin.dart';
import 'package:quizmaker/widgets/widgets.dart';

String selectedAvatarUrl;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String name, email, password;
  AuthService authService = new AuthService();
  bool _isLoading = false;

  List<String> avatarUrls = new List();

  signUp() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      authService.signUpWithEmailAndPassword(email, password).then((value) {
        if (value != null) {
          /// uploading user info to Firestore
          Map<String, String> userInfo = {
            "userName": name,
            "email": email,
            "avatarUrl": selectedAvatarUrl,
          };
          DatabaseService().addUseData(userInfo).then((result) {});

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(name);
          print("$name username saved");
          HelperFunctions.saveUserAvatarSharedPreference(selectedAvatarUrl);
          print("$selectedAvatarUrl user avatar saved");
          HelperFunctions.saveUserEmailSharedPreference(email);
          print("$email user email saved");

          setState(() {
            _isLoading = false;
          });
          HelperFunctions.saveUserLoggedInSharedPreference(true);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomeContainer()));
        }
      });
    }
  }

  Widget avatarTile(String avatarUrl, _SignUpState context, int index) {
    return GestureDetector(
        onTap: () {
          selectedAvatarUrl = avatarUrl;
          setState(() {});
        },
        child: Container(
          margin: EdgeInsets.only(
            right: 14,
          ),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              border: selectedAvatarUrl == avatarUrl
                  ? Border.all(color: Color(0xff007EF4), width: 4)
                  : Border.all(color: Colors.transparent, width: 10),
              color: Colors.white,
              borderRadius: BorderRadius.circular(120)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: Image.network(avatarUrl)),
        ));
  }

  @override
  void initState() {
    avatarUrls = getAvatarUrls();
    avatarUrls.shuffle();
    selectedAvatarUrl = avatarUrls[0].toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  children: [
                    Spacer(),
                    Container(
                      height: 100,
                      margin: EdgeInsets.only(bottom: 40),
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          itemCount: avatarUrls.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return avatarTile(avatarUrls[index], this, index);
                          }),
                    ),
                    Container(
                      width: 500,
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          TextFormField(
                            style: MyThemeData.inputTextStyle(),
                            validator: (val) {
                              return val.isEmpty ? "Enter Name" : null;
                            },
                            decoration: MyThemeData.themedecoration("Name"),
                            onChanged: (val) {
                              name = val;
                            },
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          TextFormField(
                            style: MyThemeData.inputTextStyle(),
                            validator: (val) {
                              return val.isEmpty ? "Enter Emailid" : null;
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
                              signUp();
                            },
                            child:
                                blueButton(context: context, label: "Sign Up"),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                              onTap: () async {
                                await authService.signInWithGoogle(context);
                              },
                              child: whiteButton(
                                  context: context,
                                  label: "Sign Up with Google")),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
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
                                            child: SignIn()));
                                  },
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontSize: 15.5,
                                      color: Colors.black54,
                                      fontFamily: 'OverpassRegular',
                                    ),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
