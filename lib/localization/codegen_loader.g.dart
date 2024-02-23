// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart
// ignore_for_file: prefer_single_quotes
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart' show AssetLoader;
class CodegenLoader extends AssetLoader{
  const CodegenLoader();
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }
  static const Map<String,dynamic> frFR = {
  "screenText": "Filtrer",
  "products": "Des produits",
  "productsScreenTitle": "@:products @:screenText",
  "cards": "Cards",
  "settings": "Réglages",
  "settingsScreenTitle": "@:settings @:screenText",
  "changePassword": "Changer le mot de passe",
  "languageName": "French",
  "signOut": "Se déconnecter"
};
static const Map<String,dynamic> enUS = {
  "screenText": "Screen",
  "products": "Products",
  "productsScreenTitle": "@:products @:screenText",
  "cards": "Carts",
  "settings": "Settings",
  "settingsScreenTitle": "@:settings @:screenText",
  "changePassword": "Change Password",
  "languageName": "English",
  "signOut": "Sign Out"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"fr_FR": frFR, "en_US": enUS};
static const List<Locale> supportedLocales = [Locale("fr", "FR"), Locale("en", "US")];
static const String path = "resources/langs";
}
