import 'package:flutter/material.dart';
import 'package:quizmaker/helper/functions.dart';
import 'package:quizmaker/models/question_model.dart';
import 'package:quizmaker/widgets/widgets.dart';

class Results extends StatefulWidget {
  final int correct, incorrect, total;
  final List<QuestionModel> questionsAndAnswers;

  Results(
      {@required this.correct,
      @required this.incorrect,
      @required this.total,
      @required this.questionsAndAnswers});

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  int notAttemptd;

  @override
  void initState() {
    notAttemptd = widget.total - (widget.correct + widget.incorrect);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 24),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            InfoHeader(
              correct: widget.correct,
              incorrect: widget.incorrect,
              total: widget.total,
              notAttempted: notAttemptd,
            ),
            SizedBox(
              height: 14,
            ),
            ListView.builder(
                itemCount: widget.questionsAndAnswers.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 24),
                itemBuilder: (context, index) {
                  return QuestionsAndAnswersTile(
                    index: index,
                    questionModel: widget.questionsAndAnswers[index],
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class QuestionsAndAnswersTile extends StatelessWidget {
  final int index;
  final QuestionModel questionModel;
  QuestionsAndAnswersTile({@required this.index, @required this.questionModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: 'Q${index + 1}  ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text: questionModel.userResponse != ""
                        ? questionModel.userResponse ==
                                questionModel.correctOption
                            ? 'Correct'
                            : "Incorrect"
                        : "Not Attempted",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: questionModel.userResponse != ""
                          ? questionModel.userResponse ==
                                  questionModel.correctOption
                              ? Colors.green
                              : Colors.red
                          : Colors.grey,
                      fontSize: 16,
                      fontFamily: 'OverpassRegular',
                    )),
              ],
            ),
          ),
          Text(
            "${HelperFunctions.makeFirstLetterUpperCase(questionModel.question)}",
            style: TextStyle(
                fontSize: 17,
                fontFamily: 'OverpassRegular',
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            width: 450,
            height: 0.7,
            color: Colors.grey.withOpacity(0.6),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "${HelperFunctions.makeFirstLetterUpperCase(questionModel.correctOption)}",
            style: TextStyle(
                fontSize: 17,
                fontFamily: 'OverpassRegular',
                fontWeight: FontWeight.w500,
                color: Colors.grey),
          ),
          SizedBox(
            height: 22,
          )
        ],
      ),
    );
  }
}

class InfoHeader extends StatefulWidget {
  final int total;
  final int correct;
  final int incorrect;
  final int notAttempted;

  InfoHeader(
      {@required this.total,
      @required this.correct,
      @required this.incorrect,
      @required this.notAttempted});

  @override
  _InfoHeaderState createState() => _InfoHeaderState();
}

class _InfoHeaderState extends State<InfoHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24),
        shrinkWrap: true,
        children: <Widget>[
          NoOfQuestionTile(
            text: "Total",
            //questionsSnapshot.documents.length
            number: widget.total,
          ),
          NoOfQuestionTile(
            text: "Correct",
            //number: _correct,
            number: widget.correct,
          ),
          NoOfQuestionTile(
            text: "Incorrect",
            number: widget.incorrect,
          ),
          NoOfQuestionTile(
            text: "NotAttempted",
            number: widget.notAttempted,
          ),
        ],
      ),
    );
  }
}
