import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heutagogy/lessons.dart';
import 'package:heutagogy/widgets/cards.dart';
import 'package:heutagogy/UI/quiz_types.dart';

class MainScreen extends StatefulWidget {

  
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // String data;
  
  List<Widget> fillLessons(){
    List<Widget> subjects = [];
    List<String> subjectTitles = ["Chemistry","Physics","Biology","Mathematics","Geography","History","Civics"];
    List<Color> startcols = [
    Colors.black,
    Color(0xFF9921E8),
    Color(0xFF74D680),
    Color(0xFF990000),
    Colors.black,
    Color(0xFF9921E8),
    Color(0xFF74D680)
  ];
  List<Color> endcols = [
    Colors.grey,
    Color(0xFF5F72BE),
    Color(0xFF378B29),
    Color(0xFFFF0000),
    Colors.grey,
    Color(0xFF5F72BE),
    Color(0xFF378B29)
  ];
    for(int i=0;i<subjectTitles.length;i++){
        subjects.add(
          Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LessonsPage()));
              },
              child: Container(

      // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      
      // alignment: Alignment.left,
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(colors: [
          startcols[i],
          endcols[i],
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
        )
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Center(
            child: Text(
              subjectTitles[i],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
              textAlign: TextAlign.left,
            ),
        ),
      ),
      )
    ), 
        ),
          
      );
    }
    return subjects;
  }
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: fillLessons(),
        ),
      ),
    );
  }
}