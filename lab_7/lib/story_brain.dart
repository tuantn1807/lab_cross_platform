import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;

  final List<Story> _storyData = [
    Story(
      storyTitle: 'Một người lạ nhắn tin rủ bạn chơi game kiếm tiền online (thật ra là cờ bạc trá hình).',
      choice1: 'Tò mò, bạn bấm vào thử.',
      choice2: 'Bỏ qua và báo cáo với nền tảng.',
    ),
    Story(
      storyTitle: 'Người lạ cảm ơn bạn và mời bạn đi ăn tối.',
      choice1: 'Chấp nhận lời mời.',
      choice2: 'Từ chối và đi về.',
    ),
    Story(
      storyTitle: 'Bạn nhặt được một chiếc ví có tiền và giấy tờ tuỳ thân của người khác.',
      choice1: 'Mang đến công an để nộp.',
      choice2: 'Giữ lại vì nghĩ không ai thấy.',
    ),
    Story(
      storyTitle: 'Bạn thấy một tin giật gân về người nổi tiếng và định chia sẻ lên mạng xã hội.',
      choice1: 'Kiểm tra nguồn tin trước khi chia sẻ.',
      choice2: 'Chia sẻ ngay vì thấy hấp dẫn.',
    ),
    Story(
      storyTitle: 'Một người lạ rủ bạn bỏ học, gia nhập nhóm "khởi nghiệp" không rõ ràng.',
      choice1: 'Từ chối và báo với giáo viên.',
      choice2: 'Thử nghe xem có gì hay.',
    ),
    Story(
      storyTitle: 'Bạn chụp được ảnh một người lạ ở nơi công cộng và định đăng lên mạng xã hội vì thấy "vui vui".',
      choice1: 'Đăng lên ngay để câu like.',
      choice2: 'Không đăng, tôn trọng quyền riêng tư của người ta.',
    ),
  ];

  String getStory() => _storyData[_storyNumber].storyTitle;
  String getChoice1() => _storyData[_storyNumber].choice1;
  String getChoice2() => _storyData[_storyNumber].choice2;

  void nextStory(int choiceNumber) {
    if (_storyNumber == 0) {
      _storyNumber = (choiceNumber == 1) ? 1 : 2;
    } else if (_storyNumber == 1) {
      _storyNumber = (choiceNumber == 1) ? 3 : 4;
    } else if (_storyNumber == 2) {
      _storyNumber = (choiceNumber == 1) ? 4 : 5;
    } else {
      restart(); // khi đến các story cuối
    }
  }

  void restart() {
    _storyNumber = 0;
  }

  bool buttonShouldBeVisible() {
    return _storyNumber < 3; // chỉ cho lựa chọn ở 3 story đầu
  }
}
