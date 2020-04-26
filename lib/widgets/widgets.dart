import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizmaker/helper/functions.dart';
import 'package:quizmaker/helper/theme.dart';
import 'package:quizmaker/services/auth.dart';
import 'package:quizmaker/views/home_container.dart';
import 'package:quizmaker/views/signin.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: appBar(context),
    backgroundColor: Color(0xff2B4162),
    centerTitle: false,
    elevation: 0.0,
    brightness: Brightness.dark,
  );
}

Widget appBar(BuildContext context) {
  return Image.asset(
    "assets/images/logo.png",
    height: 40,
  ) /* Text("Makemyquiz",
      style: TextStyle(
          fontFamily: 'OverpassRegular',
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: Colors.white))*/
      ;
}

Widget blueButton({BuildContext context, String label, buttonWidth}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 18),
    decoration: BoxDecoration(
        gradient: MyThemeData.blueGradient,
        borderRadius: BorderRadius.circular(4)),
    alignment: Alignment.center,
    width: buttonWidth != null
        ? buttonWidth
        : MediaQuery.of(context).size.width - 48,
    child: Text(
      label,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
  );
}

class NoOfQuestionTile extends StatefulWidget {
  final String text;
  final int number;

  NoOfQuestionTile({this.text, this.number});

  @override
  _NoOfQuestionTileState createState() => _NoOfQuestionTileState();
}

class _NoOfQuestionTileState extends State<NoOfQuestionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                ),
                color: Colors.blue),
            child: Text(
              "${widget.number}",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
                color: Colors.black54),
            child: Text(
              widget.text,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}

Widget whiteButton({BuildContext context, String label, buttonWidth}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 18),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(4)),
    alignment: Alignment.center,
    width: buttonWidth != null
        ? buttonWidth
        : MediaQuery.of(context).size.width - 48,
    child: Text(
      label,
      style: TextStyle(color: Color(0xff071930), fontSize: 16),
    ),
  );
}

Widget menu(
    {@required context,
    @required double menuWidth,
    @required String myNameMain,
    @required String myAvatarMain,
    @required String myEmailMain}) {
  return Container(
    color: Color(0xff385F71),
    //color: Color(0xff3d6dfe),
    width: menuWidth,
    height: MediaQuery.of(context).size.height,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 100, bottom: 24, right: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(120)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: kIsWeb
                            ? Image.network(myAvatarMain)
                            : CachedNetworkImage(imageUrl: myAvatarMain))),
                SizedBox(
                  height: 16,
                ),
                Text(
                  myNameMain,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  myEmailMain,
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            )),
        SizedBox(
          height: 16,
        ),
        GestureDetector(
          onTap: () {
            selectedMenuItem = "Home";
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: Row(
              children: <Widget>[
                Opacity(
                  opacity: selectedMenuItem == "Home" ? 1 : 0.7,
                  child: Image.asset(
                    "assets/images/home.png",
                    height: 18,
                    width: 18,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "Home",
                  style: TextStyle(
                      color: selectedMenuItem == "Home"
                          ? Colors.white
                          : Colors.white70,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            selectedMenuItem = "About";
          },
          child: Opacity(
            opacity: 0.8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "assets/images/info.png",
                    height: 18,
                    width: 18,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "About",
                    style: TextStyle(
                        color: selectedMenuItem == "About"
                            ? Colors.white
                            : Colors.white70,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            AuthService().signOut();
            HelperFunctions.saveUserLoggedInSharedPreference(false);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          },
          child: Opacity(
            opacity: 0.8,
            child: Container(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    "assets/images/logout.png",
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Log out",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        )
      ],
    ),
  );
}
