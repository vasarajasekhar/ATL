import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heutagogy/lessons.dart';
import 'package:heutagogy/widgets/cards.dart';
import 'package:heutagogy/UI/quiz_types.dart';

class MainScreen extends StatefulWidget {

  final String data;
  final String assessment;

  MainScreen(this.data,this.assessment);

  @override
  _MainScreenState createState() => _MainScreenState(this.data);
}

class _MainScreenState extends State<MainScreen> {
  String data;
  _MainScreenState(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange[300],
        title: Text("HEUTAGOGY",
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold
            )
          ),        
        )
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LessonsPage(this.data)));
              },
              child: CardWidget(
          "Lessons",
          "Study lessons and learn from quizzes",
          Colors.black,
          Colors.grey
        ), 
            ),
          ],
        ),
      ),
    );
  }
}