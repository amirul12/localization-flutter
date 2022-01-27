import 'package:flutter/cupertino.dart';
import 'package:locallizationdemo/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier{
  Locale _locale;
  Locale get locale => _locale;

  void setLocal (Locale locale){
    if(!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
}