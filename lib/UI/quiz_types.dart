import 'package:flutter/material.dart';
import 'package:heutagogy/UI/score_page.dart';
import 'package:heutagogy/tests/test1.dart';
import 'package:heutagogy/models/data_models.dart';
import 'package:heutagogy/models/result.dart';
import 'package:heutagogy/other_tests/lesson_1_tests.dart';
import 'package:heutagogy/widgets/cards.dart';
import 'package:heutagogy/models/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizTypes extends StatelessWidget {

  Result result = Result();

  Future getData(String type) async {
    final firestoreinstance = Firestore.instance;

    Future<DocumentSnapshot> dn = firestoreinstance
                                  .collection("root")
                                  .document("ICSE")
                                  .collection("schools")
                                  .document("school1")
                                  .collection("classes")
                                  .document("class6")
                                  .collection("sections")
                                  .document("sectionA")
                                  .collection("subjects")
                                  .document("science")
                                  .collection("chapters")
                                  .document("chapter1")
                                  .collection("tests")
                                  .document(type)
                                  .get();

    return dn;
  }
  

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
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SizedBox(height: 50),
            Padding(padding: EdgeInsets.all(20),
              child: GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Ho);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FutureBuilder(
                    future: getData("Basic"),
                    builder: (_,snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Scaffold(
                          body: Center(
                            child: CircularProgressIndicator(
                            backgroundColor: Colors.orange,
                          ),
                          ),
                        );
                      }
                      else{
                        List<QuestionData> questionsList = [];
                              int i=1;
                            if(snapshot.data["questions"] == null){
                              print("YEsssss");
                            }
                            else{
                              print("Nooooo");
                            }
                              for(var ques in snapshot.data["questions"]){
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
                      }
                    }
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
                  return FutureBuilder(
                    future: getData("Intermediate"),
                    builder: (_,snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Scaffold(
                          body: Center(
                            child: CircularProgressIndicator(
                            backgroundColor: Colors.orange,
                          ),
                          ),
                        );
                      }
                      else{
                        List<QuestionData> questionsList = [];

                              int i=1;
                              for(var ques in snapshot.data["questions"]){
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
                      }
                    }
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
                  return FutureBuilder(
                    future: getData("Advanced"),
                    builder: (_,snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Scaffold(
                          body: Center(
                            child: CircularProgressIndicator(
                            backgroundColor: Colors.orange,
                          ),
                          ),
                        );
                      }
                      else{
                        List<QuestionData> questionsList = [];

                              int i=1;
                              for(var ques in snapshot.data["questions"]){
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
                      }
                    }
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