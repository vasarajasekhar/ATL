import 'package:flutter/material.dart';
import 'package:selfcheck/UI/home_page.dart';
import 'package:selfcheck/UI/main_page.dart';
import 'package:selfcheck/main.dart';
import 'package:selfcheck/models/result.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:selfcheck/widgets/cards.dart';
import 'package:google_fonts/google_fonts.dart';

class ScorePage extends StatefulWidget {
  final Result result;
  ScorePage(this.result);
  @override
  _ScorePageState createState() => _ScorePageState(this.result);
}

class _ScorePageState extends State<ScorePage> {
  Result result;
  _ScorePageState(this.result);

  Widget _questionCard(){
    String value;
    List<Widget> queswid = [];
    for(int i=1;i<=10;i++){
        if(this.result.correct_list[i] == 0){
          value = "Unattempted";
        }
        else if(this.result.correct_list[i] == 1){
          value = "Correct";
        }
        else{
          value = "Incorrect";
        }
        queswid.add(
          Padding(padding: EdgeInsets.all(10),
            child: CardWidget(
              "Question $i",
              value,
              Colors.black38,
              Colors.black38
            ),
          )
        );
    }
    return Column(
        children: queswid
    );
  }

  Widget _showAnalysis(){
    return _questionCard();
  }

  @override
  Widget build(BuildContext context) {
    Map<String,double> dataMap = new Map();
    dataMap.putIfAbsent("Correct", () => this.result.get_correct().toDouble());
    dataMap.putIfAbsent("Incorrect", () => this.result.get_incorrect().toDouble());
    dataMap.putIfAbsent("Unattempted", () => (10 - this.result.get_correct() - this.result.get_incorrect()).toDouble());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        centerTitle: true,
        title: Text("Your Score",
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.w500
        ),
        ) 
      ),),
      body: SingleChildScrollView(
      child: Center(
        child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20)),
          PieChart(
            dataMap: dataMap,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width/2.7,
            showChartValuesInPercentage: true,
            showChartValues: true,
            showChartValuesOutside: false,
            chartValueBackgroundColor: Colors.white,
            colorList: [Colors.green,Colors.red,Colors.blue],
            chartType: ChartType.disc,
          ),
          Padding(padding: EdgeInsets.all(10)),
          Text("Your score",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          Text(this.result.get_score().toString(),style: TextStyle(fontSize: 25),),
          Padding(padding: EdgeInsets.all(5)),
          RaisedButton(
            child: Text("Retake Test",style: TextStyle(color: Colors.white),),
            color: Colors.red,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
          }),
          Padding(padding: EdgeInsets.all(5)),
          RaisedButton(
            child: Text("Take Next Test",style: TextStyle(color: Colors.white),),
            color: Colors.blueAccent,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
          }),
          Padding(padding: EdgeInsets.all(20)),
          Text("Score Analysis", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          _showAnalysis()
      ],),
      ),
    ), 
    );
  }
}