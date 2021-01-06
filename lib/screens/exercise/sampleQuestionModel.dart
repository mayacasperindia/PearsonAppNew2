class Answer {
  final String answer;
  final bool isCorrectAnswer;
  final String definition;
  bool _selected;

  bool get selected => this._selected ?? false;

  set selected(bool v) => this._selected = v;

  Answer(this.answer, {this.isCorrectAnswer = false, this.definition});

  @override
  bool operator ==(other) => this.answer == other.answer;

  @override
  int get hashCode => super.hashCode;
}

class QuestionModel {
  final String question;
  final List<Answer> answers;
  bool _done;
  bool _flagged;
  bool _marked;

  bool get marked => this._marked ?? false;

  bool get flagged => this._flagged ?? false;

  set marked(bool v) => this._marked = v;

  set flagged(bool v) => this._flagged = v;

  Answer get selectedAnswer =>
      answers.firstWhere((element) => element.selected, orElse: () => null);

  Answer get correctAnswer => answers
      .firstWhere((element) => element.isCorrectAnswer, orElse: () => null);

  bool get answeredCorrect => correctAnswer == selectedAnswer;

  bool get answeredWrong =>
      selectedAnswer != null && correctAnswer == selectedAnswer;

  selectAnswer(Answer answer) {
    answers.retainWhere((element) {
      if (element == answer) {
        element.selected = true;
      } else {
        element.selected = false;
      }
      return true;
    });
  }

  clearAnswer() {
    answers.retainWhere((element) {
      element.selected = false;
      return true;
    });
  }

  bool get done => this._done ?? false;

  set done(bool v) => this._done = v;

  QuestionModel(this.question, [this.answers]);
}
