import 'package:flutter/material.dart';

class ItemDetailViewModel with ChangeNotifier{
  late bool _isWarningVisible ;

  bool get isWarningVisible => _isWarningVisible;

  showWarning(bool states ){
    _isWarningVisible = states;
    notifyListeners();
  }

  resetWillPopClicking(){
    _isWarningVisible = false;
    notifyListeners();
  }

}