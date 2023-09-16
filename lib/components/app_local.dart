import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppLocale {

  late Locale locale;

  AppLocale( this.locale) ;

  late Map<String , String> _loadedLocalizedValues ;

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocale of (BuildContext context) {
    return Localizations.of(context, AppLocale) ;
  }

  Future loadLang() async {
    String  _langFile = await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String ,dynamic> _loadedValues = jsonDecode(_langFile);
    _loadedLocalizedValues = _loadedValues.map((key, value) => MapEntry(key, value.toString())) ;
  }
  // This method will be called from every widget which needs a localized text
  String? getTranslated (String key) {
    return _loadedLocalizedValues[key] ;
  }
// Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocale> delegate  = _AppLocalDelegate() ;

}


class  _AppLocalDelegate extends LocalizationsDelegate<AppLocale> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalDelegate() ;
  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ["en" , "ar"].contains(locale.languageCode) ;
  }

  @override
  Future<AppLocale> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocale appLocale = AppLocale(locale) ;
    await appLocale.loadLang();
    return appLocale ;
  }

  @override
  bool shouldReload(_AppLocalDelegate  old) => false  ;

}


getLang(BuildContext context  , String key) {
  return AppLocale.of(context).getTranslated(key) ;
}