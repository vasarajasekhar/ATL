import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heutagogy/models/data_models.dart';
import 'package:heutagogy/models/result.dart';
// import 'package:youtube_player/youtube_player.dart';
import '../UI/score_page.dart';
import 'animated_button.dart';

class Test1Page extends StatefulWidget {
  final Test1Data test1data;

  Test1Page(this.test1data);

  @override
  State<StatefulWidget> createState() => Test1PageState(this.test1data);
}

class Test1PageState extends State<Test1Page> {
  Test1Data data;
  Result result = Result();

  Test1PageState(this.data);

  
  @override
  void initState() {
    super.initState();
    // fillData();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childList = _buildQuestions(this.data.heading != null);
    childList.add(RaisedButton(
      elevation: 3,
      color: Colors.redAccent,
      child: Text("Finish Test",style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
      onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ScorePage(this.result)));
    }));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text("Quiz",
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.black
            )
          ),
        )
      ),
      body: SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 50),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: childList,
      ),
    )
    );
  }

  List<Widget> _buildQuestions(bool addHeading) {
    List<Widget> questionsList = [];
    if (addHeading) {
      questionsList.add(
        Padding(
          child: Center(
        child: Text(
          this.data.heading,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      padding: EdgeInsets.all(10),
        ),
      );
    }
    
    int i=0;
    for (var x in this.data.questions) {
      i++;
      print(x.text);
      questionsList.add(Padding(
        padding: EdgeInsets.only(bottom: 20),
      ));
      questionsList.add(QuestionWidget(
        question: x,
        result: result,
        i: i
      ));
    }
    return questionsList;
  }
}

class QuestionWidget extends StatefulWidget {
  final QuestionData question;
  final Result result;
  int i;

  QuestionWidget({this.question,this.result,this.i});

  @override
  State<StatefulWidget> createState() => QuestionWidgetState(question,result,i);
}

class QuestionWidgetState extends State<StatefulWidget> {
  QuestionData question;
  Result result;
  int i;

  QuestionWidgetState(this.question,this.result,this.i);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              "Q$i. ${question.text}",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.left,
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Wrap(
              // runAlignment: WrapAlignment.spaceEvenly,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: _buildChildren(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
            ),
            
          ],
        ));
  }

  List<Widget> _buildChildren() {
    List<Widget> children = [];
    ButtonStyle correctButtonStyle = ButtonStyle(
        initialColour: Colors.blueAccent,
        finalColour: Colors.white10,
        intialTextstyle: TextStyle(fontSize: 14, color: Colors.white),
        finalTextStyle: TextStyle(fontSize: 16, color: Colors.green),
        elevation: 3);
    ButtonStyle incorrectButtonStyle = ButtonStyle(
        initialColour: Colors.blueAccent,
        finalColour: Colors.white10,
        intialTextstyle: TextStyle(fontSize: 14, color: Colors.white),
        finalTextStyle: TextStyle(fontSize: 16, color: Colors.red),
        elevation: 3);
    // int score = 0;
    int i=0;
    for (ChoiceData x in question.options) {
      i++;
      children.add(Padding(
          padding: EdgeInsets.all(5),
          child: AnimatedButton(
            initialText: x.text,
            finalText: x.correct ? "Correct" : "Wrong",
            buttonStyle: x.correct ? correctButtonStyle : incorrectButtonStyle,
            animationduration: Duration(seconds: 1),
            iconData: x.correct ? Icons.check : Icons.close,
            iconsize: 14,
            onTap: () {
              if(x.correct){
                setState(() {
                  this.result.increment_score();
                  this.result.increment_correct();
                  this.result.add_correctans(i);
                });
                print(this.result.get_score());
              }
              else{
                setState(() {
                  this.result.increment_incorrect();
                  this.result.add_incorrectans(i);
                });
                print(this.result.get_incorrect());
              }
            },
            radius: 14,
          )));
    }
    return children;
  }
}
