import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  Color start, end;
  String title,subtitle;
  CardWidget(this.title,this.subtitle,this.start,this.end);
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      // alignment: Alignment.left,
      width: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(colors: [
          start,
          end,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
        )
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,style: TextStyle(
            color:Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),textAlign: TextAlign.left,),
          SizedBox(height: 10),
          Text(subtitle,style: TextStyle(
            color:Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),textAlign: TextAlign.left,),
        ],
      ),
      )
    );
  }
}