class QuestionModel {
  String? questionText;
  List<Answers>? answers;
  int? correctId;

  QuestionModel({this.questionText, this.answers, this.correctId});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    questionText = json['questionText'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
    correctId = json['correct_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionText'] = this.questionText;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    data['correct_id'] = this.correctId;
    return data;
  }
}

class Answers {
  String? text;
  int? id;

  Answers({this.text, this.id});

  Answers.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['id'] = this.id;
    return data;
  }
}
