import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderTile extends StatelessWidget {
  String imagePath, title, description;
  SliderTile({this.imagePath,this.title,this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox(
            height: 40,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
          )
        ],
      ),
    );
  }
}