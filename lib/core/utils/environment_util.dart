import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Environment Utility.
///
class EnvironmentUtil {
  /// Initialize the environment utility to load the variables;
  static Future<void> init() async {
    await dotenv.load(fileName: '.env');
  }

  /// The api url
  static String get kApiUrl {
    switch (dotenv.env['ENV']) {
      case 'production':
        return dotenv.env['PROD_URL'] ?? 'API_URL not found';
      case 'staging':
        return dotenv.env['STAGING_URL'] ?? 'API_URL not found';
      case 'development':
        return dotenv.env['DEV_URL'] ?? 'API_URL not found';
      default:
        return 'API_URL not found';
    }
  }
}
