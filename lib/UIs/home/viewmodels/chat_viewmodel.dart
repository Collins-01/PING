import 'package:ping/Core/states/base_viewmodel.dart';

class ChatViewModel extends BaseViewModel {
  Duration duration = new Duration();
  Duration position = new Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;
  onSeekChanged(double v) {
    // position.inSeconds = v;
    notifyListeners();
  }
}
