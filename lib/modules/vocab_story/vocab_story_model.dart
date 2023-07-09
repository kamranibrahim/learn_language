class WordModel {
  final String word;
  final String? translatedWord;
  final int answerIndex;
  final List<String> options;
  final String type;

  WordModel({
    required this.word,
    this.translatedWord,
    required this.answerIndex,
    required this.options,
    required this.type,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      word: json['word'],
      translatedWord: json['translatedWord'],
      answerIndex: json['answerIndex'],
      options: List<String>.from(json['options'] as List<dynamic>),
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'translatedWord': translatedWord,
      'answerIndex': answerIndex,
      'options': options,
      'type': type,
    };
  }
}

enum QuestionType {mcq,speak,text,}
