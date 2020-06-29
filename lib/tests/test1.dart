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
  // final Test1Data test1data;

  // Test1Page() : super(key: key);

  @override
  State<StatefulWidget> createState() => Test1PageState();
}

class Test1PageState extends State<Test1Page> {
  Test1Data data;
  Result result = Result();

  // Test1PageState(this.data);

  void fillData(){
    Map<String,Object> var1 = {
      "name": "L1_Q1",
      "heading": null,
      "questions": [
        {
          "image": null,
          "text": "Anything that takes up space and mass is ____",
          "options": [
            {
              "text": "Mind",
              "correct": false,
            },
            {
              "text": "Molecule",
              "correct": false,
            },
            {
              "text": "Atom",
              "correct": false,
            },
            {
              "text": "Matter",
              "correct": true,
            },
          ],
          "youtube_video": null,
        },
        {
          "image": null,
          "text": "Transformations in substances are of two kinds",
          "options": [
            {
              "text": "Physical & Chemical",
              "correct": true,
            },
            {
              "text": "Physical & Biological",
              "correct": false,
            },
            {
              "text": "Chemical",
              "correct": false,
            },
            {
              "text": "Physical",
              "correct": false,
            },
          ],
          "youtube_video": null,
        },
        {
          "image": null,
          "text": "A substance formed by or used in a chemical reaction is called a ",
          "options": [
            {
              "text": "Liquid",
              "correct": false,
            },
            {
              "text": "Chemical",
              "correct": true,
            },
            {
              "text": "Gas",
              "correct": false,
            },
            {
              "text": "Solid",
              "correct": false,
            },
          ],
          "youtube_video": null,
        },
        {
          "image": null,
          "text": "Before the chemistry of today (modern chemistry) there was ___?",
          "options": [
            {
              "text": "Geology",
              "correct": false,
            },
            {
              "text": "Biology",
              "correct": false,
            },
            {
              "text": "Alchemy",
              "correct": true,
            },
            {
              "text": "Physics",
              "correct": false,
            },
          ],
          "youtube_video": null,
        },
        {
          "image": null,
          "text": "___ is an imaginary liquid that would cure all diseases and help a person live long",
          "options": [
            {
              "text": "Elixir of life",
              "correct": true,
            },
            {
              "text": "Chemical",
              "correct": false,
            },
            {
              "text": "Fertilizer",
              "correct": false,
            },
            {
              "text": "Acid",
              "correct": false,
            },
          ],
          "youtube_video": null,
        },
        {
          "image": null,
          "text": "The smallest part an element is made of is an _____",
          "options": [
            {
              "text": "Atom",
              "correct": true,
            },
            {
              "text": "Molecule",
              "correct": false,
            },
            {
              "text": "Fire",
              "correct": false,
            },
            {
              "text": "Water",
              "correct": false,
            },
          ],
          "youtube_video": null,
        },
        {
          "image": null,
          "text": "An atom may combine with other atom(s) of the same element to form _____",
          "options": [
            {
              "text": "Molecule",
              "correct": true,
            },
            {
              "text": "Chemia",
              "correct": false,
            },
            {
              "text": "Atom",
              "correct": false,
            },
            {
              "text": "Periodic Table",
              "correct": false,
            },
          ],
          "youtube_video": null,
        },
        {
          "image": null,
          "text": "When two or more elements combine together, a ____ is formed",
          "options": [
            {
              "text": "Philosopher's stone",
              "correct": false,
            },
            {
              "text": "Periodic table",
              "correct": false,
            },
            {
              "text": "Atom",
              "correct": false,
            },
            {
              "text": "Compound",
              "correct": true,
            },
          ],
          "youtube_video": null,
        },
        {
          "image": null,
          "text": "How many groups/columns are there in periodic table?",
          "options": [
            {
              "text": "18",
              "correct": true,
            },
            {
              "text": "20",
              "correct": false,
            },
            {
              "text": "19",
              "correct": false,
            },
            {
              "text": "8",
              "correct": false,
            },
          ],
          "youtube_video": null,
        },
        {
          "image": null,
          "text": "The concept of atom was given by?",
          "options": [
            {
              "text": "John Dalton",
              "correct": true,
            },
            {
              "text": "Mendeleev",
              "correct": false,
            },
            {
              "text": "Lavoisier",
              "correct": false,
            },
            {
              "text": "Priestley",
              "correct": false,
            },
          ],
          "youtube_video": null,
        },   
      ],
      "subject": "Chemistry"
    };

    List<QuestionData> ques = [];

    for(var x in var1["questions"]){
      List<ChoiceData> choices = [];
      for(var y in x["options"]){
        ChoiceData var2 = ChoiceData(correct: y["correct"],text: y["text"]);
        choices.add(var2);
      }
      QuestionData question1 = QuestionData(image:x["image"],text: x["text"],options:choices,youtubeVideo: x["youtube_video"]);   
      ques.add(question1);
    }
    
    this.data = Test1Data(heading: var1["heading"],name: var1["name"],questions: ques,subject: var1["subject"]);
  }

  @override
  void initState() {
    super.initState();
    fillData();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childList = [];
    childList=(_buildQuestions((this.data.heading != "" && this.data.heading != null)));
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
      questionsList.add(Center(
        child: Text(
          this.data.heading,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ));
    }
    int i=0;
    for (var x in data.questions) {
      i++;
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
