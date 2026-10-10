import 'failure.dart';

/// Converts unexpected exceptions from read operations into [DatabaseFailure].
Future<T> guard<T>(Future<T> Function() action) async {
  try {
    return await action();
  } on Failure {
    rethrow;
  } catch (e) {
    throw DatabaseFailure('$e');
  }
}
