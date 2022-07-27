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


  static Question fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      stem: json['question'],
      radio: json['radio'],
      options: (json['options'].cast<String>()),
    );
  }

  toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = stem;
    data['radio'] = radio;
    data['options'] = options;
    return data;
  }

  static List<Question> listfromJson(dynamic json) {
    return (json as List<dynamic>)
        .map((e) => Question.fromJson((e as Map<String, dynamic>)))
        .toList();
  }
}
