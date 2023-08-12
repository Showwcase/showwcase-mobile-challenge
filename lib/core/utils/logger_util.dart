import 'dart:developer' as developer;

/// Utility class for logging out messages
///
class Logger {
  /// Logs out message but must be used with DartVM
  ///
  static void logInfo(String message) {
    developer.log(message, name: 'POKEMON-APP');
  }

  /// Logs out error message but must be used with DartVM
  ///
  static void logError(String message) {
    developer.log('', name: 'POKEMON-APP', level: 900, error: message);
  }
}
