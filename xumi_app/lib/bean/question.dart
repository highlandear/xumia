class Question {
  Question({
    this.id = 0,
    this.stem = '',
    this.radio = false,
    this.options = const [],
  });

  int id;
  String stem;
  bool radio;
  List<String> options = [];
  List<int> answer = [];
  int certiID = 0;


  static Question fromJson(Map<String, dynamic> json) {
  print(json);
    return Question(
      id: json['id'],
      stem: json['question'],
      radio: json['radio'],
      options: (json['options'].cast<String>()),
    );
  }

  toAnswerJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['answer'] = answer;
    return data;
  }

  static toAnswerListJson(int id, List<Question> quelist){
    var list = [];
    for (var element in quelist) {
      list.add(element.toAnswerJson());
    }

    final Map<String, dynamic> data = <String, dynamic>{};
    data['certiPassId'] = id;
    data['questionList'] = list;
    return data;

  }

  static List<Question> listfromJson(dynamic json) {
    return (json as List<dynamic>)
        .map((e) => Question.fromJson((e as Map<String, dynamic>)))
        .toList();
  }
}
