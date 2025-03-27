import 'package:easy_localization/easy_localization.dart';

//This extension is used to get the locale
//It is used to get the locale of the current context
//Should be used in the presentation layer
//Not use this.tr() directly
//Usage: 'stringVariable'.locale (String variable should be in the localization file (LocaleKeys))
extension LocaleExtension on String {
  String get locale => this.tr();

  String localeWithArgs(List<String> args) => this.tr(args: args);
}
