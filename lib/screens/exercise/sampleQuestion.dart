import 'package:pearson_flutter/screens/exercise/sampleQuestionModel.dart';

List<QuestionModel> getQuestions(){

  List<QuestionModel> questions = new List<QuestionModel>();
  QuestionModel questionModel = new QuestionModel();

  //1
  questionModel.setQuestion("1: General Physics and Motion in a Straight Line");
  questions.add(questionModel);
  questionModel = new QuestionModel();

  //2
  questionModel.setQuestion("2: General Physics and Motion in a Straight Line");
  questions.add(questionModel);
  questionModel = new QuestionModel();

  //3
  questionModel.setQuestion("3: General Physics and Motion in a Straight Line");
  questions.add(questionModel);
  questionModel = new QuestionModel();


  questionModel = new QuestionModel();


  return questions;

}