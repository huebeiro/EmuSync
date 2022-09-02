
import 'package:flutter/foundation.dart';

class Log {
  static const _LogType _displayLogLevel = _LogType.verbose;
  static const _LogType _persistLogLevel = _LogType.off;
  static const int? _wrapWidth = null;

  static v(String? message) {
    if (_displayLogLevel.index <= _LogType.verbose.index) {
      _displayLog("Verb: $message");
    }
    if (_persistLogLevel.index <= _LogType.verbose.index) {
      _saveLog(_LogType.verbose, message);
    }
  }

  static i(String? message) {
    if (_displayLogLevel.index <= _LogType.info.index) {
      _displayLog("Info: $message");
    }
    if (_persistLogLevel.index <= _LogType.info.index) {
      _saveLog(_LogType.info, message);
    }
  }

  static w(String? message) {
    if (_displayLogLevel.index <= _LogType.warning.index) {
      _displayLog("Warn: $message");
    }
    if (_persistLogLevel.index <= _LogType.warning.index) {
      _saveLog(_LogType.warning, message);
    }
  }

  static e(String? message) {
    if (_displayLogLevel.index <= _LogType.error.index) {
      _displayLog("Err: $message");
    }
    if (_persistLogLevel.index <= _LogType.error.index) {
      _saveLog(_LogType.error, message);
    }
  }

  static void _displayLog(String? message) {
    debugPrint(message, wrapWidth: _wrapWidth);
  }

  static void _saveLog(_LogType verbose, String? message) {
    // TODO persist logs
  }
}

enum _LogType {
  verbose,
  info,
  warning,
  error,
  off, // No logs are displayed
}
