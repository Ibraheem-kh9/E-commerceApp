import 'package:e_commerce_app/components/app_local.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageViewModel extends ChangeNotifier{
  Locale? _appLocale = Locale('en','US');
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
      _appLocale = Locale('en','US');
      return null;
    }
      _appLocale = Locale(languageCode, countryCode);
      print(' get value from shared to app $_appLocale');
      notifyListeners();
      return _appLocale;
  }


  checkLanguageIndex(int index){
    _currentIdx = index;
  }
}











/*

class AppLanguageViewModel with ChangeNotifier{
  Locale _appLocale = Locale('en');

  Locale get appLocal => _appLocale ;


  getLanguageStore() {
    fetchLocale();
    return _appLocale;
  }

  fetchLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('en','US');
      print('null Value of Shared');
      //return _appLocale;
    }
    else{
      _appLocale = Locale(prefs.getString("language_code") ?? "en") ;
      _appLocale = Locale(prefs.getString("country_code") ?? "US") ;
      print('language value is $_appLocale');
     // print('language value is $_appLocale');
    //  return _appLocale;
    }
  }


  changeLanguage(Locale locale) async {
   // var prefs = await SharedPreferences.getInstance();
   //  if (_appLocale == locale) {
   //    return;
   //  }
    if (locale ==  Locale("ar","AR")) {
      _appLocale = Locale("ar","AR");
    //  setLanguageValue(_appLocale!);
    //   await prefs.setString('language_code', 'ar');
    //   await prefs.setString('countryCode', "AR");
    _setLanguageValue();
    } else {
      _appLocale =  Locale("en","US");
    _setLanguageValue();
      // await prefs.setString('language_code', 'en');
      // await prefs.setString('countryCode', 'US');
      notifyListeners();
    }

  }

  _setLanguageValue() async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
   _pref.setString('language_code', appLocal.toLanguageTag());
   _pref.setString('countryCode', appLocal.toLanguageTag());
    notifyListeners();
  }
}*/
