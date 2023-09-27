import 'package:flutter/material.dart';

class ItemDetailsViewModel with ChangeNotifier {
  late bool _isWarningVisible;

  int _currentIdx = 0;

  bool get isWarningVisible => _isWarningVisible;

  int get currentIdx => _currentIdx;

  setImageIndex(int val) {
    _currentIdx = val;
    notifyListeners();
  }

  showWarning(bool states) {
    _isWarningVisible = states;
    notifyListeners();
  }

  resetWillPopClicking() {
    _isWarningVisible = false;
    notifyListeners();
  }
}
