import 'package:flutter/material.dart';
import 'package:quizmaker/helper/functions.dart';
import 'package:quizmaker/helper/responsive_widget.dart';
import 'package:quizmaker/helper/theme.dart';
import 'package:quizmaker/views/about_us.dart';
import 'package:quizmaker/views/home.dart';
import 'package:quizmaker/widgets/widgets.dart';

import 'create_quiz.dart';

class HomeContainer extends StatefulWidget {
  @override
  _HomeContainerState createState() => _HomeContainerState();
}

/// Global Variables

String selectedMenuItem = "Home";

String _myName = "";

/// Stream
Stream infoStream;

class _HomeContainerState extends State<HomeContainer> {
  String _myAvatar = "", _myEmail = "";

  Widget getMainWidget() {
    if (selectedMenuItem == "Home") {
      return Home();
    } else if (selectedMenuItem == "About") {
      return AboutView();
    } else {
      return Home();
    }
  }

  getMyInfoAndQuiz() async {
    _myAvatar = await HelperFunctions.getUserAvatarSharedPreference();
    _myName = await HelperFunctions.getUserNameSharedPreference();
    _myEmail = await HelperFunctions.getUserEmailSharedPreference();
    print("this is uservavatar $_myName");
    print("Filling up some dat $_myName");
  }

  @override
  void initState() {
    getMyInfoAndQuiz();

    if (infoStream == null) {
      infoStream = Stream<String>.periodic(Duration(milliseconds: 100), (x) {
        return selectedMenuItem;
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    infoStream = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: infoStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ResponsiveWidget(
                largeScreen: Scaffold(
                  backgroundColor: MyThemeData.backgroundColor,
                  appBar: appBarMain(context),
                  body: Row(
                    children: [
                      menu(
                          context: context,
                          menuWidth: 300,
                          myNameMain: _myName,
                          myAvatarMain: _myAvatar,
                          myEmailMain: _myEmail),
                      getMainWidget()
                    ],
                  ),
                  floatingActionButton: selectedMenuItem == "Home"
                      ? FloatingActionButton(
                          child: Icon(Icons.add),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateQuiz(
                                          isNew: true,
                                        )));
                          },
                        )
                      : Container(),
                ),
                smallScreen: Scaffold(
                  backgroundColor: MyThemeData.backgroundColor,
                  appBar: appBarMain(context),
                  drawer: Drawer(
                      child: menu(
                          context: context,
                          menuWidth: MediaQuery.of(context).size.width,
                          myNameMain: _myName,
                          myAvatarMain: _myAvatar,
                          myEmailMain: _myEmail)),
                  body: getMainWidget(),
                  floatingActionButton: selectedMenuItem == "Home"
                      ? FloatingActionButton(
                          child: Icon(Icons.add),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateQuiz(
                                          isNew: true,
                                        )));
                          },
                        )
                      : Container(),
                ),
              )
            : Container(
                child: Center(
                child: CircularProgressIndicator(),
              ));
      },
    ));
  }
}
