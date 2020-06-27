import 'package:flutter/material.dart';
import 'package:heutagogy/UI/home_page.dart';
import 'package:heutagogy/UI/main_page.dart';
import 'package:heutagogy/widgets/slider_tile.dart';
import 'package:heutagogy/models/slide_data.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardScreen extends StatefulWidget {

  final String data, assessment;

  OnBoardScreen(this.data,this.assessment);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState(this.data,this.assessment);
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  
  String data, assessment;

  _OnBoardScreenState(this.data,this.assessment);

  int screens = 2;
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  List<Widget> _buildPageIndicator(){
    List<Widget> list = [];
    for(int i=0;i<screens;i++){
      list.add(i == currentPage ? _indicator(true):_indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive?24.0:16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white :Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF5D020),
                Colors.orange[300],
                Colors.orange
              ]
            )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen(data,assessment)));
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 450.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page){
                      setState(() {
                        currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/self_learning.jpg'
                                ),
                                height: 150.0,
                                width: 150.0,
                              ),
                            ),
                            SizedBox(height:20),
                            Center(
                              child: Text(
                              "HEUTAGOGY",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                                )
                              ),
                            ),
                            ),
                            SizedBox(height: 5),
                            Center(
                              child: Text(
                              "Heutagogy helps many through self-determined learning.",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/quiz.png'
                                ),
                                height: 200.0,
                                width: 300.0,
                              ),
                            ),
                            Center(
                              child: Text(
                              "LESSONS & QUIZZES",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                                )
                              ),
                            ),
                            ),

                            Center(
                              child: Text(
                              "Learn through lessons and evaluate yourself on quizzes.",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            ),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                currentPage != screens - 1 ? Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: FlatButton(
                      onPressed: (){
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          // SizedBox(width: 10.0,),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ):Text(""),
              ],
            ),
          ),
        ),
      bottomSheet: currentPage == screens - 1 ? Container(
        height: 100.0,
        width: double.infinity,
        color:Colors.white,
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen(data,assessment)));
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text(
                "Get Started",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Color(0xFF5B16D0),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
        ),
      ):Text(""),
    );
  }
}