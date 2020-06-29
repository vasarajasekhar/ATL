import 'package:flutter/material.dart';

class Result{
    int score = 0;
    int correct = 0;
    int incorrect = 0;
    List<int> correct_list = [0,0,0,0,0,0,0,0,0,0,0];

    void add_correctans(int qno){
      this.correct_list[qno] = 1;
    }

    void add_incorrectans(int qno){
      this.correct_list[qno] = 2;
    }

    List<int> get_correct_list(){
      return this.correct_list;
    }
    
    void increment_score(){
      this.score++;
    }

    void increment_correct(){
      this.correct++;
    }

    void increment_incorrect(){
      this.incorrect++;
    }

    int get_score(){
      return this.score;
    }

    int get_correct(){
      return this.correct;
    }

    int get_incorrect(){
      return this.incorrect;
    }
}
