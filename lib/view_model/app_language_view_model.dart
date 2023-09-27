import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageViewModel extends ChangeNotifier{
  Locale? _appLocale = const Locale('en','US');
  Locale? get appLocale => _appLocale;


  AppLanguageViewModel(){
    Future.delayed(Duration.zero,(){
      return fetchLocale();
    });
  }
  int _currentIdx = 0;
  int get currentIdx => _currentIdx;

  void setLocale(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);
    await prefs.setString('countryCode', locale.countryCode!);
    _appLocale = locale;
    print('set value to local is $_appLocale');
    notifyListeners();
  }
  clearShared() async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.clear();
  }

  Future<Locale?> fetchLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('languageCode' ) ?? 'en';
    String? countryCode = prefs.getString('countryCode') ?? 'US';
    if(_appLocale == null ){
      _appLocale = const Locale('en','US');
      return null;
    }
      _appLocale = Locale(languageCode, countryCode);
      notifyListeners();
      return _appLocale;
  }


  checkLanguageIndex(int index){
    _currentIdx = index;
  }
}
