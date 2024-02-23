import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConstants {
  static String appPrefix = dotenv.get('APP_PROJECT_PREFIX');
  static String appApiUrl = dotenv.get('APP_API_URL');
  static String appFlagsmithKey = dotenv.get('APP_FLAGSMITH_KEY');
}
