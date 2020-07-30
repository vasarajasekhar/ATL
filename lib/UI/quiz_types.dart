import 'package:flutter/material.dart';
import 'package:selfcheck/UI/score_page.dart';
import 'package:selfcheck/tests/test1.dart';
import 'package:selfcheck/models/data_models.dart';
import 'package:selfcheck/models/result.dart';
import 'package:selfcheck/other_tests/lesson_1_tests.dart';
import 'package:selfcheck/widgets/cards.dart';
import 'package:selfcheck/models/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizTypes extends StatelessWidget {

  Result result = Result();

  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange[300],
        title: Text("Select your level",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
      ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(20),
              child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StreamBuilder(
                    stream: Firestore.instance.collection('quizzes').snapshots(),
                    builder: (context, snapshot){
                      print("fadaff");
                      print(snapshot);
                      print("dafaf");
                      print(snapshot.data);
                      print("qwewe");
                      if(snapshot.data == null){
                        print("xscd");
                      }
                      else{
                        print("asdf");
                      }
                      print("hdasff");
                      print(snapshot.data.documents);
                      if(snapshot.hasError){
                        print(snapshot.error);
                        return Scaffold(
                          body: Container(
                            child: Text("Error!"),
                          ),
                        );
                      }
                      else if(snapshot.connectionState == ConnectionState.waiting){
                        return Scaffold(
                          body: Center(
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Center(
                                    child: CircularProgressIndicator(backgroundColor: Colors.orange,)
                                )
                            ),
                          )
                        );
                      }
                      else if(!snapshot.hasData || snapshot.data.documents.isEmpty){
                        return Scaffold(
                          body: Center(
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Center(
                                    child: CircularProgressIndicator(backgroundColor: Colors.orange,)
                                )
                            ),
                          )
                        );
                      }
                      print(snapshot.data.documents[2]);
                      // print(snapshot.data.documents[0]["questions"][0]);
                      List<QuestionData> questionsList = [];
                      int i=1;
                      // print(snapshot.data.documents[0]["questions"][0]["question"].toString());
                        for(var ques in snapshot.data.documents[2]["questions"]){
                          List<ChoiceData> optionsList = [];
                          for(var opt in ques["options"]){
                            optionsList.add(ChoiceData(
                              correct: opt["value"],
                              text: opt["text"]
                            ));
                          }
                          QuestionData question = QuestionData(
                            options: optionsList,
                            text: ques["question"]
                          );
                          questionsList.add(question);
                          i++;
                        }

                    Test1Data testData = Test1Data(
                      heading: "Chemistry",
                      name: "Chemistry",
                      questions: questionsList,
                      subject: "Chemistry"
                    );
                    return Test1Page(testData);
                    },
                  );
                }));
              },
              child: CardWidget("Basic","10 Questions",Color(0xFF9921E8),Color(0xFF5F72BE)),
            ),
            ),
            Padding(padding: EdgeInsets.all(20),
              child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StreamBuilder(
                    stream: Firestore.instance.collection('quizzes').snapshots(),
                    builder: (context, snapshot){
                      if(!snapshot.hasData){
                        return Text("Loading Data ... Please Wait ...");
                      }
                      // print(snapshot.data.documents[1]["questions"][0]);
                      List<QuestionData> questionsList = [];
                      int i=1;
                      // print(snapshot.data.documents[1]["questions"][0]["question"].toString());
                        for(var ques in snapshot.data.documents[1]["questions"]){
                          List<ChoiceData> optionsList = [];
                          for(var opt in ques["options"]){
                            optionsList.add(ChoiceData(
                              correct: opt["value"],
                              text: opt["text"]
                            ));
                          }
                          QuestionData question = QuestionData(
                            options: optionsList,
                            text: ques["question"]
                          );
                          questionsList.add(question);
                          i++;
                        }

                    Test1Data testData = Test1Data(
                      heading: "Chemistry",
                      name: "Chemistry",
                      questions: questionsList,
                      subject: "Chemistry"
                    );
                    return Test1Page(testData);
                    },
                  );
                }));
              },
              child: CardWidget("Intermediate","10 Questions",Color(0xFF74D680),Color(0x378B29)),
            ),
            ),
            Padding(padding: EdgeInsets.all(20),
              child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StreamBuilder(
                    stream: Firestore.instance.collection('quizzes').snapshots(),
                    builder: (context, snapshot){
                      if(!snapshot.hasData){
                        return Text("Loading Data ... Please Wait ...");
                      }
                      // print(snapshot.data.documents[2]["questions"][0]);
                      List<QuestionData> questionsList = [];
                      int i=1;
                      // print(snapshot.data.documents[2]["questions"][0]["question"].toString());
                        for(var ques in snapshot.data.documents[0]["questions"]){
                          List<ChoiceData> optionsList = [];
                          for(var opt in ques["options"]){
                            optionsList.add(ChoiceData(
                              correct: opt["value"],
                              text: opt["text"]
                            ));
                          }
                          QuestionData question = QuestionData(
                            options: optionsList,
                            text: ques["question"]
                          );
                          questionsList.add(question);
                          i++;
                        }

                    Test1Data testData = Test1Data(
                      heading: "Chemistry",
                      name: "Chemistry",
                      questions: questionsList,
                      subject: "Chemistry"
                    );
                    return Test1Page(testData);
                    },
                  );
                }));
              },
              child: CardWidget("Advanced","10 Questions",Color(0xFF990000),Color(0xFFFF0000))
            ),
            ),
            // CardWidget(),
            // CardWidget()
          ],
        ),
      ),
    );
  }
}