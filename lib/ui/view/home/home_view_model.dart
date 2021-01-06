import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  int _current = 0;
  int get current => _current;

  updateImage(int index) {
    _current = index;
    notifyListeners();
  }
}
