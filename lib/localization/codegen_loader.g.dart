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
  static const Map<String,dynamic> enUS = {
  "screenText": "Screen",
  "products": "Products",
  "productsScreenTitle": "@:products @:screenText",
  "messages": "Messages",
  "chats": "Chats",
  "chatsScreenTitle": "@:chats @:screenText",
  "posts": "Posts",
  "postsScreenTitle": "@:posts @:screenText",
  "settings": "Settings",
  "settingsScreenTitle": "@:settings @:screenText",
  "changePassword": "Change Password",
  "languageName": "English",
  "signOut": "Sign Out"
};
static const Map<String,dynamic> frFR = {
  "screenText": "Filtrer",
  "products": "Des produits",
  "productsScreenTitle": "@:products @:screenText",
  "messages": "Messages",
  "chats": "Chats",
  "chatsScreenTitle": "@:chats @:screenText",
  "posts": "Des postes",
  "postsScreenTitle": "@:posts @:screenText",
  "settings": "Réglages",
  "settingsScreenTitle": "@:settings @:screenText",
  "changePassword": "Changer le mot de passe",
  "languageName": "French",
  "signOut": "Se déconnecter"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": enUS, "fr_FR": frFR};
static const List<Locale> supportedLocales = [Locale("en", "US"), Locale("fr", "FR")];
static const String path = "resources\langs";
}
