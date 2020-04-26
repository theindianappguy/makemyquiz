import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizmaker/models/question_model.dart';
import 'package:quizmaker/services/database.dart';
import 'package:quizmaker/views/addquestion.dart';
import 'package:quizmaker/widgets/widgets.dart';

class EditQuestions extends StatefulWidget {
  final String quizId, myAwesomeName;
  EditQuestions({@required this.quizId, @required this.myAwesomeName});

  @override
  _EditQuestionsState createState() => _EditQuestionsState();
}

class _EditQuestionsState extends State<EditQuestions> {
  QuerySnapshot questionsSnapshot;
  DatabaseService databaseService = new DatabaseService();

  Widget questionList() {
    return Container(
      child: questionsSnapshot != null
          ? ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: questionsSnapshot.documents.length,
              itemBuilder: (context, index) {
                return QuestionListTile(
                  questionModel: getQuestionModelFromDatasnapshot(
                      questionsSnapshot.documents[index]),
                  number: "${index + 1}",
                  quizId: widget.quizId,
                );
              })
          : Container(
              height: MediaQuery.of(context).size.height - 150,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }

  @override
  void initState() {
    print("${widget.quizId}, this is name ${widget.myAwesomeName}");
    databaseService
        .getQuizData(widget.quizId, widget.myAwesomeName)
        .then((value) {
      questionsSnapshot = value;
      print("this is length ${questionsSnapshot.documents.length}");
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
              child: Text("Click on the question to edit",
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'OverpassRegular',
                      fontWeight: FontWeight.w400)),
            ),
            SizedBox(
              height: 8,
            ),
            questionList()
          ],
        ),
      ),
    );
  }
}

QuestionModel getQuestionModelFromDatasnapshot(
    DocumentSnapshot questionSnapshot) {
  QuestionModel questionModel = new QuestionModel();

  questionModel.question = questionSnapshot.data["question"];

  questionModel.option1 = questionSnapshot.data["option1"];
  questionModel.option2 = questionSnapshot.data["option2"];
  questionModel.option3 = questionSnapshot.data["option3"];
  questionModel.option4 = questionSnapshot.data["option4"];
  questionModel.correctOption = questionSnapshot.data["option1"];
  questionModel.answered = false;

  return questionModel;
}

class QuestionListTile extends StatelessWidget {
  final QuestionModel questionModel;
  final String number;
  final String quizId;

  QuestionListTile(
      {@required this.questionModel,
      @required this.number,
      @required this.quizId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddQuestion(
                      isNew: false,
                      quizId: quizId,
                      questionModel: questionModel,
                    )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
        child: Row(
          children: <Widget>[
            Text(
              "Q$number ${questionModel.question}",
              style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'OverpassRegular',
                  fontWeight: FontWeight.w400),
            ),
            Spacer(),
            Icon(Icons.navigate_next)
          ],
        ),
      ),
    );
  }
}
