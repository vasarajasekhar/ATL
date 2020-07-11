import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:heutagogy/models/data_models.dart';
import  'other_tests/lesson_1_tests.dart';
import 'other_tests/lesson_2_tests.dart';
import 'other_tests/lesson_3_tests.dart';
import 'lesson_detail.dart';
import 'other_tests/lesson_tests.dart';
import 'package:heutagogy/UI/quiz_types.dart';
import 'package:heutagogy/widgets/cards.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LessonsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return _LessonsPage();
  }
}

class _LessonsPage extends StatefulWidget {
    @override
  _LessonsPageState createState() => _LessonsPageState();
}

class _LessonsPageState extends State<_LessonsPage> {
  // _LessonsPageState(String data) {
  //   var lessons = json.decode(utf8.decode(data.codeUnits));
  //   for (var x in lessons) {
  //     lessonsData.add(LessonData.fromJSON(x));
  //   }
  //   print("No of Lessons = ${lessonsData.length}");
  // }

  Future getData() async{
    final firestoreinstance = await Firestore.instance;
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
                                  .get();
    return dn;

  }

  List<LessonData> lessonsData = [];
  // BuildContext context, int index
  List<Widget> lessonsBuilder() {
    List<Widget> lessons = [];
    int len = 1;
    for(int i=1;i<=len;i++){
      lessons.add(
          FutureBuilder(
            future: getData(),
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
                return Lesson(
                  title: "Lesson $i",
                  summary: snapshot.data["subtitle"]==null?"Data not fetched":snapshot.data["subtitle"],
                  func: () {
                    // if (index >= 0 && index <= this.lessonsData.length - 1) {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           // builder: (context) => LessonDetail(
                    //           //       this.lessonsData[index],
                    //           //       id: index + 1,
                    //           //     )
                    //           builder: (context) {
                    //             if (index == 1) {
                    //                 return MyLesson1Tests(this.lessonsData[index]);
                    //             } else if (index == 2) {
                    //                 return MyLesson2Tests(this.lessonsData[index]);
                    //             } else if (index == 3) {
                    //                 return MyLesson3Tests(this.lessonsData[index]);
                    //             } else {
                    //                 return MyLessonTests(this.lessonsData[index]);
                    //             }
                    //           }
                    //         )
                    //   );
                    // }
                    Navigator.push(context, MaterialPageRoute(builder: (context) => QuizTypes()));
                  },
                );
              }
            },
          ),
      );
    }
    return lessons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text("Choose any lesson to begin",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black)),
            ) 
      ),
      // body: ListView.builder(
      //   itemCount: 1,
      //   itemBuilder: lessonsBuilder,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: lessonsBuilder(),
        ),
      ),
    );
  }
}

class Lesson extends StatefulWidget {
  final String title;
  final String summary;
  final Function func;

  Lesson({Key key, this.title, this.summary, this.func}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LessonState(title, summary, func);
}

class LessonState extends State<Lesson> {
  String title;
  String summary;
  double progress;
  Function func;

  @override
  void initState() {
    super.initState();
    progress = Random().nextDouble();
  }

  LessonState(this.title, this.summary, this.func);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: InkWell(
              // splashColor: Color.fromARGB(40, 0, 0, 200),
              onTap: func,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CardWidget(title,summary,Colors.black,Colors.grey),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 20),
                  // ),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.transparent,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.orange),
                  ),
                ],
              ),
            ));
  }
}
