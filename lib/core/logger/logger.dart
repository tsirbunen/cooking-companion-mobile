import 'package:talker_flutter/talker_flutter.dart';

/// A class to wrap around the Talker functionality to enable
/// easy change of the logging library later (in case the talker
/// library does not turn out to be suitable for our needs).
/// Also, the runtimeType of the class that is creating the log
/// is added to the log by this wrapper.
class Logger {
  // Note: We need the Talker itself exposed to outside so that we can
  // pass it on to our talker plugins for go router and riverpod.
  Talker? talker;

  static final Logger _instance = Logger._internal();
  Logger._internal();

  factory Logger() {
    _instance.talker ??= TalkerFlutter.init();
    return _instance;
  }

  debug(
    String message,
    Type runtimeType, [
    Object? exception,
    StackTrace? stackTrace,
  ]) {
    _talk(talker!.debug, message, runtimeType, exception, stackTrace);
  }

  warning(
    String message,
    Type runtimeType, [
    Object? exception,
    StackTrace? stackTrace,
  ]) {
    _talk(talker!.warning, message, runtimeType, exception, stackTrace);
  }

  error(
    String message,
    Type runtimeType, [
    Object? exception,
    StackTrace? stackTrace,
  ]) {
    _talk(talker!.error, message, runtimeType, exception, stackTrace);
  }

  info(
    String message,
    Type runtimeType, [
    Object? exception,
    StackTrace? stackTrace,
  ]) {
    _talk(talker!.info, message, runtimeType, exception, stackTrace);
  }

  verbose(
    String message,
    Type runtimeType, [
    Object? exception,
    StackTrace? stackTrace,
  ]) {
    _talk(talker!.verbose, message, runtimeType, exception, stackTrace);
  }

  critical(
    String message,
    Type runtimeType, [
    Object? exception,
    StackTrace? stackTrace,
  ]) {
    _talk(talker!.critical, message, runtimeType, exception, stackTrace);
  }

  _talk(
    void Function(dynamic, [Object?, StackTrace?]) talkerFn,
    String message,
    Type runtimeType,
    Object? exception,
    StackTrace? stackTrace,
  ) {
    final fullMessage = _getFullFormattedMessage(message, runtimeType);
    if (exception == null && stackTrace == null) {
      talkerFn(fullMessage);
      return;
    }

    talkerFn(fullMessage, [exception, stackTrace]);
  }

  _getFullFormattedMessage(String message, Type runtimeType) {
    return '[$runtimeType]\n$message';
  }
}

final logger = Logger();
