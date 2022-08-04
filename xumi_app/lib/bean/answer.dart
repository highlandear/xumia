class AnswerItem{
  AnswerItem(int q,){
    id = q;
  }
  int id = 0;
  List<int> answer = const [];


  put(int a){
    answer.add(a);
  }
}

class AnswerData {
  AnswerData(int id){
    questionId = id;
  }

  int questionId = 0;
  add(answer){
    questionList.add(answer);
  }
  List<AnswerItem> questionList = [];
}
