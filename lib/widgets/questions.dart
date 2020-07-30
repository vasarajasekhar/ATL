import 'package:flutter/material.dart';
import 'package:selfcheck/models/data_models.dart';
import 'package:selfcheck/widgets/cards.dart';

class Question extends StatelessWidget {
  final int qno;
  final String question;
  final List<ChoiceData> options;
  Question(this.qno,this.question,this.options);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // GestureDetector(
          //   onTap(){
              
          //   }
          // )
          // CardWidget("Question $this.qno",this.question,cardcolor,cardcolor),
          CardWidget("Option A",this.options[0].text,Colors.white,Colors.white),
          CardWidget("Option B",this.options[1].text,Colors.white,Colors.white),
          CardWidget("Option C",this.options[2].text,Colors.white,Colors.white),
          CardWidget("Option D",this.options[2].text,Colors.white,Colors.white),
        ],
      ),
    );
  }
}