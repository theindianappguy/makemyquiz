import 'package:flutter/material.dart';
import 'package:quizmaker/aboutdev/data/general_data.dart';
import 'package:quizmaker/aboutdev/model/project_model.dart';
import 'package:quizmaker/aboutdev/model/testimonial_model.dart';
import 'package:quizmaker/helper/functions.dart';
import 'package:quizmaker/helper/responsive_widget.dart';
import 'package:quizmaker/helper/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutView extends StatefulWidget {
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  List<ProjectModel> projects1 = new List<ProjectModel>();
  List<ProjectModel> projects2 = new List<ProjectModel>();
  List<TestimonialModel> testimonials = new List<TestimonialModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    projects1 = getProjects1();
    projects2 = getProjects2();
    testimonials = getTestimonials();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width - 300,
        color: MyThemeData.backgroundColor,
        child: Column(
          children: <Widget>[
            /// Top Intro Container
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 46),
                decoration: BoxDecoration(gradient: MyThemeData.badamiGradient),
                child: ResponsiveWidget(
                  largeScreen: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            width: 170,
                            height: 170,
                            margin: EdgeInsets.only(left: 10, top: 10),
                            color: Colors.white,
                          ),
                          Image.asset(
                            "assets/images/profilepic.jpg",
                            width: 170,
                            height: 170,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/logo.png",
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  " is made by Sanskar Tiwari",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: 'OverpassRegular',
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Text(
                                desc,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              height: 23,
                            ),
                            GestureDetector(
                              onTap: () {
                                HelperFunctions.launchURL(
                                    "https://www.linkedin.com/in/lamsanskar/");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Text(
                                  "Download CV",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  smallScreen: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            height: 50,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            " is made by Sanskar Tiwari",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'OverpassRegular',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            width: 170,
                            height: 170,
                            margin: EdgeInsets.only(left: 10, top: 10),
                            color: Colors.white,
                          ),
                          Image.asset(
                            "assets/images/profilepic.jpg",
                            width: 170,
                            height: 170,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "I'm Sanskar Tiwari",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'OverpassRegular',
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "I like building Awesome Software",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'OverpassRegular',
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              child: Text(
                                desc,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'OverpassRegular',
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 24),
                            ),
                            SizedBox(
                              height: 23,
                            ),
                            GestureDetector(
                              onTap: () {
                                HelperFunctions.launchURL(
                                    "https://www.linkedin.com/in/lamsanskar/");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Text(
                                  "Download CV",
                                  style: TextStyle(
                                    color: Color(0xff8F754F),
                                    fontFamily: 'OverpassRegular',
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Container(
              padding: EdgeInsets.only(bottom: 40),
              color: MyThemeData.backgroundColor,
              child: ClipPath(
                clipper: TrapeziumClipper(),
                child: Container(
                  decoration:
                      BoxDecoration(gradient: MyThemeData.badamiGradient),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),

            /// -----------

            /// Projects
            Container(
              width: MediaQuery.of(context).size.width,
              color: MyThemeData.backgroundColor,
              child: Column(
                children: <Widget>[
                  Text(
                    "My Projects",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87.withOpacity(0.8),
                      fontFamily: 'OverpassRegular',
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    "Imaginations converted to real world apps/website",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87.withOpacity(0.8),
                      fontWeight: FontWeight.w300,
                      fontFamily: 'OverpassRegular',
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: MyThemeData.backgroundColor,
                    child: ResponsiveWidget(
                        smallScreen: Container(
                          child: ListView.builder(
                              itemCount: projects1.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ProjectsTile(
                                  title: projects1[index].getTitle(),
                                  description: projects1[index].getDesc(),
                                  buttonText: projects1[index].getButtonText(),
                                  projectUrl: projects1[index].getProjectUrl(),
                                  techStack: projects1[index].getTechStack(),
                                  isSmall: true,
                                );
                              }),
                        ),
                        largeScreen: Container(
                          height: 280,
                          child: ListView.builder(
                              itemCount: projects1.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ProjectsTile(
                                  title: projects1[index].getTitle(),
                                  description: projects1[index].getDesc(),
                                  buttonText: projects1[index].getButtonText(),
                                  projectUrl: projects1[index].getProjectUrl(),
                                  techStack: projects1[index].getTechStack(),
                                  isSmall: false,
                                );
                              }),
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: MyThemeData.backgroundColor,
                    child: ResponsiveWidget(
                        smallScreen: Container(
                          child: ListView.builder(
                              itemCount: projects2.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ProjectsTile(
                                  title: projects2[index].getTitle(),
                                  description: projects2[index].getDesc(),
                                  buttonText: projects2[index].getButtonText(),
                                  projectUrl: projects2[index].getProjectUrl(),
                                  techStack: projects2[index].getTechStack(),
                                  isSmall: true,
                                );
                              }),
                        ),
                        largeScreen: SizedBox(
                          height: 280,
                          child: ListView.builder(
                              itemCount: projects2.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ProjectsTile(
                                  title: projects2[index].getTitle(),
                                  description: projects2[index].getDesc(),
                                  buttonText: projects2[index].getButtonText(),
                                  projectUrl: projects2[index].getProjectUrl(),
                                  techStack: projects2[index].getTechStack(),
                                  isSmall: false,
                                );
                              }),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          HelperFunctions.launchURL(
                              "https://github.com/theindianappguy");
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: <Widget>[
                              Opacity(
                                  opacity: 0.7,
                                  child: Image.asset(
                                    "assets/images/github_logo.png",
                                    height: 20,
                                    width: 20,
                                  )),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                "View more on Github",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OverpassRegular',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration:
                        BoxDecoration(gradient: MyThemeData.badamiGradient),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 40),
                      child: ClipPath(
                        clipper: TrapeziumClipper(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: MyThemeData.backgroundColor,
                          ),
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        BoxDecoration(gradient: MyThemeData.badamiGradient),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Client Testimonials",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: 'OverpassRegular',
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          "What my clients have to say about me",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.white70,
                            fontFamily: 'OverpassRegular',
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        ResponsiveWidget(
                            smallScreen: Container(
                              child: ListView.builder(
                                  itemCount: testimonials.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return TestimonialTile(
                                      name: testimonials[index].getName(),
                                      description:
                                          testimonials[index].getDesc(),
                                      buttonText:
                                          testimonials[index].getButtonText(),
                                      creditsUrl:
                                          testimonials[index].getCreditUrl(),
                                      isSmall: true,
                                    );
                                  }),
                            ),
                            largeScreen: SizedBox(
                              height: 350,
                              child: ListView.builder(
                                  itemCount: testimonials.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return TestimonialTile(
                                      name: testimonials[index].getName(),
                                      description:
                                          testimonials[index].getDesc(),
                                      buttonText:
                                          testimonials[index].getButtonText(),
                                      creditsUrl:
                                          testimonials[index].getCreditUrl(),
                                      isSmall: false,
                                    );
                                  }),
                            )),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Connect with me",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: 'OverpassRegular',
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Let's get social, i like meeting like minded people",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white70,
                            fontFamily: 'OverpassRegular',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  HelperFunctions.launchURL(
                                      "https://dribbble.com/theindianappguy");
                                },
                                child: Image.asset(
                                  "assets/images/dribble.png",
                                  width: 20,
                                  height: 20,
                                )),
                            SizedBox(
                              width: 16,
                            ),
                            GestureDetector(
                                onTap: () {
                                  HelperFunctions.launchURL(
                                      "https://www.linkedin.com/in/lamsanskar/");
                                },
                                child: Image.asset(
                                  "assets/images/linkedin.png",
                                  width: 20,
                                  height: 20,
                                )),
                            SizedBox(
                              width: 16,
                            ),
                            GestureDetector(
                                onTap: () {
                                  HelperFunctions.launchURL(
                                      "https://www.facebook.com/lamsanskar");
                                },
                                child: Image.asset(
                                  "assets/images/facebook.png",
                                  width: 20,
                                  height: 20,
                                )),
                            SizedBox(
                              width: 16,
                            ),
                            GestureDetector(
                                onTap: () {
                                  HelperFunctions.launchURL(
                                      "https://www.instagram.com/indianappguy/");
                                },
                                child: Image.asset(
                                  "assets/images/instagram.png",
                                  width: 20,
                                  height: 20,
                                )),
                            SizedBox(
                              width: 16,
                            ),
                            GestureDetector(
                                onTap: () {
                                  HelperFunctions.launchURL(
                                      "https://twitter.com/Theindianappguy");
                                },
                                child: Image.asset(
                                  "assets/images/twitter.png",
                                  width: 20,
                                  height: 20,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )

            /// ---------
          ],
        ),
      ),
    );
  }
}

class ProjectsTile extends StatefulWidget {
  final String title, description, buttonText, projectUrl, techStack;
  final bool isSmall;

  ProjectsTile(
      {@required this.title,
      @required this.description,
      @required this.isSmall,
      @required this.buttonText,
      this.projectUrl,
      @required this.techStack});

  @override
  _ProjectsTileState createState() => _ProjectsTileState();
}

class _ProjectsTileState extends State<ProjectsTile> {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (!widget.isSmall ?? true)
          ? MediaQuery.of(context).size.width / 3
          : MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          /*boxShadow: [new BoxShadow(
            color: Colors.black,
            blurRadius: 2.0,
          ),]*/
          ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 16,
          ),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black87.withOpacity(0.8),
              fontFamily: 'OverpassRegular',
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            widget.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.black87.withOpacity(0.8),
              fontFamily: 'OverpassRegular',
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            widget.techStack,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.black87.withOpacity(0.8),
              fontFamily: 'OverpassRegular',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              _launchURL(
                  widget.projectUrl ?? "https://gradientbazaar.web.app/");
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Text(
                widget.buttonText,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OverpassRegular',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TestimonialTile extends StatefulWidget {
  final String description, buttonText, creditsUrl, name;
  final bool isSmall;

  TestimonialTile(
      {@required this.description,
      @required this.isSmall,
      @required this.buttonText,
      @required this.creditsUrl,
      @required this.name});

  @override
  _TestimonialTileState createState() => _TestimonialTileState();
}

class _TestimonialTileState extends State<TestimonialTile> {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (!widget.isSmall ?? true)
          ? MediaQuery.of(context).size.width / 2
          : MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          /*boxShadow: [new BoxShadow(
            color: Colors.black,
            blurRadius: 2.0,
          ),]*/
          ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 16,
          ),
          Text(
            widget.description,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.white70),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "- ${widget.name}",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.white70),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              _launchURL(widget.creditsUrl);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white70, width: 2),
              ),
              child: Text(
                widget.buttonText,
                style: TextStyle(color: Colors.white60),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, 40);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TrapeziumClipper oldClipper) => false;
}
