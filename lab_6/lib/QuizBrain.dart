import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question('Nước sôi ở 100 độ C?', true),
    Question('Mặt trăng là một hành tinh?', false),
    Question('Việt Nam nằm ở châu Á?', true),
    Question('Cá có thể sống trên cạn?', false),
    Question('Điện thoại đầu tiên do Apple sản xuất là iPhone?', true),
    Question('Mặt trời quay quanh Trái Đất?', false),
    Question('Con người có 5 giác quan chính?', true),
    Question('Máy bay có thể bay nhờ động cơ phản lực?', true),
    Question('Một tuần có 10 ngày?', false),
    Question('Trái đất hình vuông?', false),
  ];


  String getQuestionText() => _questionBank[_questionNumber].questionText;

  bool getCorrectAnswer() => _questionBank[_questionNumber].questionAnswer;

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() => _questionNumber >= _questionBank.length - 1;

  void reset() {
    _questionNumber = 0;
  }
}
