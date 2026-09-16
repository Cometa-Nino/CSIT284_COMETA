class Questions {
  final String questionText;
  final List<String> options;
  final int answer;

  Questions({
    required this.questionText,
    required this.options,
    required this.answer,
  });

  Map<String, dynamic> toJson() {
    return {'questionText': questionText, 'options': options, 'answer': answer};
  }

  factory Questions.fromJason(Map<String, dynamic> json) {
    return Questions(
      questionText: json['questionText'],
      options: List<String>.from(json['options']),
      answer: json['answer'],
    );
  }
}
