import 'dart:developer';

import 'package:logger/logger.dart';

class AdvancedConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    final buffer = StringBuffer();
    event.lines.forEach(buffer.writeln);
    log(buffer.toString());
  }
}

class AppLogger {
  factory AppLogger() => _instance;

  AppLogger._internal();

  static final AppLogger _instance = AppLogger._internal();
  static final Logger _logger = Logger(
    filter: DevelopmentFilter(),
    printer: PrettyPrinter(
      printEmojis: false,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      stackTraceBeginIndex: 1,
      levelColors: {
        // ANSI 249
        Level.debug: AnsiColor.fg(AnsiColor.grey(.75)),
      },
    ),
    output: AdvancedConsoleOutput(),
  );

  static void debug(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.d(
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void warning(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.w(
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void error(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.e(
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
