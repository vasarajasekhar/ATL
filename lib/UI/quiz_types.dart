import 'package:flutter/material.dart';
import 'package:heutagogy/UI/score_page.dart';
import 'package:heutagogy/tests/test1.dart';
import 'package:heutagogy/models/data_models.dart';
import 'package:heutagogy/models/result.dart';
import 'package:heutagogy/other_tests/lesson_1_tests.dart';
import 'package:heutagogy/widgets/cards.dart';
import 'package:heutagogy/models/result.dart';


class QuizTypes extends StatelessWidget {

  final LessonData lessonsData;

  QuizTypes(this.lessonsData);

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
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SizedBox(height: 50),
            Padding(padding: EdgeInsets.all(20),
              child: GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Ho);
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Test1Page()));
              },
              child: CardWidget("Beginner","10 Questions",Color(0xFF9921E8),Color(0xFF5F72BE)),
            ),
            ),
            Padding(padding: EdgeInsets.all(20),
              child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Test1Page()));
              },
              child: CardWidget("Intermediate","10 Questions",Color(0xFF74D680),Color(0x378B29)),
            ),
            ),
            Padding(padding: EdgeInsets.all(20),
              child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Test1Page()));
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