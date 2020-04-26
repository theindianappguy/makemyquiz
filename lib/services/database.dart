import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<void> addUseData(userData) async {
    Firestore.instance.collection("users").add(userData).catchError((e) {
      print(e);
    });
  }

  Future<void> updateQuizData(
      Map quizData, String quizId, String userName) async {
    await Firestore.instance
        .collection("Quiz")
        .document(userName)
        .collection("MyQuiz")
        .document(quizId)
        .setData(quizData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addQuestionData(
      Map questionData, String quizId, String userName) async {
    await Firestore.instance
        .collection("Quiz")
        .document(userName)
        .collection("MyQuiz")
        .document(quizId)
        .collection("QNA")
        .add(questionData)
        .catchError((e) {
      print(e);
    });
  }

  getUserInfo(String email) async {
    return Firestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .getDocuments();
  }

  removeQuiz(String quizId, String userName) {
    Firestore.instance
        .collection("Quiz")
        .document(userName)
        .collection("MyQuiz")
        .document(quizId)
        .delete();
  }

  getQuizezData(String username) async {
    print("getting quiz data for $username");
    return Firestore.instance
        .collection("Quiz")
        .document(username)
        .collection("MyQuiz")
        .snapshots();
  }

  getQuizData(String quizId, String username) async {
    return await Firestore.instance
        .collection("Quiz")
        .document(username)
        .collection("MyQuiz")
        .document(quizId)
        .collection("QNA")
        .getDocuments();
  }
}
