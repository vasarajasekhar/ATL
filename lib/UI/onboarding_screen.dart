import 'package:flutter/material.dart';
import 'package:heutagogy/UI/home_page.dart';
import 'package:heutagogy/widgets/slider_tile.dart';
import 'package:heutagogy/models/slide_data.dart';

class OnBoardScreen extends StatefulWidget {

  final String data, assessment;

  OnBoardScreen(this.data,this.assessment);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState(this.data,this.assessment);
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  
  List<SliderTileModel> mySlides;
  // PageController controller;
  int currentIndex = 0;
  final String data, assessment;

  _OnBoardScreenState(this.data,this.assessment);
  
  void initState(){
    super.initState();
    mySlides = getSlides();
  }

  // Widget _buildPageIndicator(bool isCurrentSlide){
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 10),
  //     height: isCurrentSlide ? 10.0:6.0,
  //     width: isCurrentSlide ? 10.0:6.0,
  //     decoration: BoxDecoration(
  //       color: isCurrentSlide ? Colors.grey:Colors.grey[300],
  //       borderRadius: BorderRadius.circular(12) 
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        itemCount: mySlides.length,
        itemBuilder: (context,index){
          return SliderTile(imagePath: mySlides[index].imagePath,title: mySlides[index].title,description: mySlides[index].desc,);
      }),
      // bottomSheet: currentIndex != mySlides.length - 1 ? Container(child: Text("ghghkndf"),):Container(child: Text("ndoajsjaofj"),),
    );
  }
}