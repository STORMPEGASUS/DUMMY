import 'question.dart';

class Quizbrain {
  int _Qno = 0;

  List<Question> _questionbank = [
    Question('Walt Disney holds the record for the most Oscars', true),
    Question(
        '10,297 balloons were used in the floating sequences for the movie \'Up!\'',
        true),
    Question(
        'The Tesla Roadster was the first car to be launched to space', true),
    Question('The longest mountain range in the world is under the sea', true),
    Question('Dogs can understand up to 250 hand gestures', true),
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
  ];

  String getQuestion() {
    return _questionbank[_Qno].question;
  }

  bool getAnswer() {
    return _questionbank[_Qno].answer;
  }

  void nextQuestion() {
    if (_Qno < _questionbank.length - 1) {
      _Qno++;
    }
  }

  bool isFinished() {
    if (_Qno >= _questionbank.length-1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _Qno = 0;
  }
}
