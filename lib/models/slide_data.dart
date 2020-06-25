import 'package:flutter/material.dart';

class SliderTileModel{
    
    String imagePath;
    String title;
    String desc;

    SliderTileModel({this.imagePath,this.title,this.desc});

    void setImagePath(String path){
      this.imagePath = path;
    }

    void setTitle(String name){
      this.title = name;
    }

    void setDesc(String text){
      this.desc = text;
    }

    String getImagePath(){
        return this.imagePath;
    }

    String getTitle(){
      return this.title;
    }

    String getDesc(){
      return this.desc;
    }
}

List<SliderTileModel> getSlides(){
  List<SliderTileModel> slides = List<SliderTileModel>();
  SliderTileModel slider = new SliderTileModel();

  slider.setImagePath("assets/images/self_learning.jpg");
  slider.setTitle("Heutagogy");
  slider.setDesc("The self-determined learning procedure nurtures many at an early stage.");
  slides.add(slider);

  slider = new SliderTileModel();

  slider.setImagePath("assets/images/quiz.png");
  slider.setTitle("Lessons & Quizzes");
  slider.setDesc("Learn through lessons and evaluate yourself on quizzes");
  slides.add(slider);

  for(int i=0;i<2;i++){
    print(slides[i].imagePath);
    print(slides[i].title);
    print(slides[i].desc);
  }

  return slides;

}
