import 'package:flutter/material.dart';
import 'package:quizmaker/helper/functions.dart';
import 'package:quizmaker/helper/theme.dart';
import 'package:quizmaker/models/question_model.dart';
import 'package:quizmaker/services/database.dart';
import 'package:quizmaker/widgets/widgets.dart';

class AddQuestion extends StatefulWidget {
  final String quizId;
  final bool isNew;
  final QuestionModel questionModel;

  AddQuestion(
      {@required this.isNew, @required this.quizId, this.questionModel});

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  TextEditingController questionController = new TextEditingController();
  TextEditingController option1Controller = new TextEditingController();
  TextEditingController option2Controller = new TextEditingController();
  TextEditingController option3Controller = new TextEditingController();
  TextEditingController option4Controller = new TextEditingController();

  DatabaseService databaseService = new DatabaseService();

  uploadQuestionData() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      Map<String, String> questionMap = {
        "question": questionController.text,
        "option1": option1Controller.text,
        "option2": option2Controller.text,
        "option3": option3Controller.text,
        "option4": option4Controller.text
      };

      String userName = await HelperFunctions.getUserNameSharedPreference();

      await databaseService
          .addQuestionData(questionMap, widget.quizId, userName)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
        questionController.text = "";
        option1Controller.text = "";
        option2Controller.text = "";
        option3Controller.text = "";
        option4Controller.text = "";
      });
    }
  }

  @override
  void initState() {
    questionController.text =
        !widget.isNew ? widget.questionModel.question : "";
    option1Controller.text = !widget.isNew ? widget.questionModel.option1 : "";
    option2Controller.text = !widget.isNew ? widget.questionModel.option2 : "";
    option3Controller.text = !widget.isNew ? widget.questionModel.option3 : "";
    option4Controller.text = !widget.isNew ? widget.questionModel.option4 : "";
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
                      TextFormField(
                        controller: questionController,
                        style: MyThemeData.inputTextStyle(),
                        decoration: MyThemeData.themedecoration("Question"),
                        validator: (val) =>
                            val.isEmpty ? "Enter Question" : null,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        controller: option1Controller,
                        style: MyThemeData.inputTextStyle(),
                        decoration: MyThemeData.themedecoration(
                            "Option1 (Correct Answer)"),
                        validator: (val) =>
                            val.isEmpty ? "Enter Option1" : null,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        controller: option2Controller,
                        style: MyThemeData.inputTextStyle(),
                        decoration: MyThemeData.themedecoration("Option2"),
                        validator: (val) =>
                            val.isEmpty ? "Enter Option2" : null,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        controller: option3Controller,
                        style: MyThemeData.inputTextStyle(),
                        decoration: MyThemeData.themedecoration("Option3"),
                        validator: (val) =>
                            val.isEmpty ? "Enter Option3" : null,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        controller: option4Controller,
                        style: MyThemeData.inputTextStyle(),
                        decoration: MyThemeData.themedecoration("option4"),
                        validator: (val) =>
                            val.isEmpty ? "Enter option4" : null,
                      ),
                      Spacer(),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: blueButton(
                                context: context,
                                label: !widget.isNew ? "Cancel" : "Submit",
                                buttonWidth: MediaQuery.of(context).size.width >
                                        800
                                    ? 500 / 2 - (36)
                                    : MediaQuery.of(context).size.width / 2 -
                                        (36)),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          GestureDetector(
                            onTap: () {
                              uploadQuestionData();
                            },
                            child: blueButton(
                                context: context,
                                label: !widget.isNew
                                    ? "Update Question"
                                    : "Add Question",
                                buttonWidth: MediaQuery.of(context).size.width >
                                        800
                                    ? 500 / 2 - (36)
                                    : MediaQuery.of(context).size.width / 2 -
                                        (36)),
                          )
                        ],
                      ),
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
}
