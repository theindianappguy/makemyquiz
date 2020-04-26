import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizmaker/helper/functions.dart';
import 'package:quizmaker/helper/theme.dart';
import 'package:quizmaker/services/database.dart';
import 'package:quizmaker/views/addquestion.dart';
import 'package:quizmaker/views/search.dart';
import 'package:quizmaker/widgets/widgets.dart';
import 'package:random_string/random_string.dart';

class UpdateQuiz extends StatefulWidget {
  final bool isNew;
  final String title;
  final String desc;
  final String quizImageUrl;
  final String quizId;
  UpdateQuiz(
      {@required this.isNew,
      this.desc,
      this.title,
      this.quizImageUrl,
      this.quizId});

  @override
  _UpdateQuizState createState() => _UpdateQuizState();
}

class _UpdateQuizState extends State<UpdateQuiz> {
  final _formKey = GlobalKey<FormState>();
  String quizImageUrl, quizId;
  DatabaseService databaseService = new DatabaseService();

  bool _isLoading = false;

  //
  File selectedImage;
  Image selectedWebImage;

  TextEditingController quizTitleController = new TextEditingController();
  TextEditingController quizImageUrlController = new TextEditingController();
  TextEditingController quizDescController = new TextEditingController();

  var result;

  Future getImage(bool isCamera) async {
    var image = isCamera
        ? await ImagePicker.pickImage(source: ImageSource.camera)
        : await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = image;
    });
  }

  updateQuizOnline() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      quizId = widget.quizId;

      Map<String, String> quizMap = {
        "quizId": quizId,
        "quizImgurl": quizImageUrlController.text,
        "quizTitle": quizTitleController.text,
        "quizDesc": quizDescController.text
      };

      String userName = await HelperFunctions.getUserNameSharedPreference();

      await databaseService
          .updateQuizData(quizMap, quizId, userName)
          .then((value) {
        setState(() {
          _isLoading = false;
          Navigator.pop(context);
        });
      });
    }
  }

  creteQuizOnline() async {
    if (_formKey.currentState.validate() && quizImageUrlController.text != "") {
      setState(() {
        _isLoading = true;
      });
      quizId = randomAlphaNumeric(16);

      Map<String, String> quizMap = {
        "quizId": quizId,
        "quizImgurl": quizImageUrlController.text,
        "quizTitle": quizTitleController.text,
        "quizDesc": quizDescController.text
      };

      String userName = await HelperFunctions.getUserNameSharedPreference();

      await databaseService
          .updateQuizData(quizMap, quizId, userName)
          .then((value) {
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => AddQuestion(
                        quizId: quizId,
                        isNew: true,
                      )));
        });
      });
    } else if (quizImageUrlController.text == "") {
      print("error");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    !widget.isNew
        ? print(
            "${widget.quizImageUrl}, title : ${widget.title}, desc: ${widget.desc}")
        : print("bye");
    quizImageUrlController.text = !widget.isNew ? widget.quizImageUrl : "";
    quizTitleController.text = !widget.isNew ? widget.title : "";
    quizDescController.text = !widget.isNew ? widget.desc : "";
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
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Container(
                  width: 500,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      widget.isNew
                          ? quizImageUrl != null && quizImageUrl != ""
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    quizImageUrl,
                                    height: 150,
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                )
                              : selectedImage == null
                                  ? GestureDetector(
                                      onTap: () {
                                        kIsWeb
                                            ? searchAndGetUrl()
                                            : _settingModalBottomSheet(context);
                                      },
                                      child: Container(
                                        height: 150,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Icon(
                                          Icons.add_a_photo,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: Image.file(
                                            selectedImage,
                                            fit: BoxFit.cover,
                                          )),
                                    )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                widget.quizImageUrl,
                                height: 150,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                      SizedBox(
                        height: 8,
                      ),
                      result != null
                          ? TextFormField(
                              style: MyThemeData.inputTextStyle(),
                              decoration:
                                  MyThemeData.themedecoration("Quiz Image Url"),
                              controller: quizImageUrlController,
                              readOnly: true,
                              validator: (val) =>
                                  val.isEmpty ? "Enter Image Url" : null,
                              onChanged: (val) {
                                quizImageUrl = val;
                              },
                            )
                          : Container(),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        controller: quizTitleController,
                        style: MyThemeData.inputTextStyle(),
                        decoration: MyThemeData.themedecoration("Quiz Title"),
                        validator: (val) =>
                            val.isEmpty ? "Enter Quiz Title" : null,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        controller: quizDescController,
                        style: MyThemeData.inputTextStyle(),
                        validator: (val) =>
                            val.isEmpty ? "Enter Quiz Description" : null,
                        decoration:
                            MyThemeData.themedecoration("Quiz Description"),
                        //TODO
                        /*onChanged: (val) {
                          quizDescController.text = val;
                        },*/
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            widget.isNew
                                ? creteQuizOnline()
                                : updateQuizOnline();
                          },
                          child: blueButton(
                              context: context,
                              label: widget.isNew
                                  ? "Create Quiz"
                                  : "Update Quiz")),
                      SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void searchAndGetUrl() async {
    result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Search(),
          fullscreenDialog: true,
        ));

    if (result != null) {
      quizImageUrlController.text = result;
      quizImageUrl = result;
      setState(() {});
    }
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: EdgeInsets.only(bottom: 36),
            child: new Wrap(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    child: Text(
                      "Select Image From...",
                      style: TextStyle(fontSize: 16),
                    )),
                ListTile(
                    leading: Icon(Icons.camera),
                    title: Text(
                      'Camera',
                      style: TextStyle(fontSize: 14),
                    ),
                    onTap: () => {getImage(true)}),
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text(
                    'Gallery',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    getImage(false);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.burst_mode),
                  title: Text(
                    'Search Image Online',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    searchAndGetUrl();
                  },
                ),
              ],
            ),
          );
        });
  }
}
