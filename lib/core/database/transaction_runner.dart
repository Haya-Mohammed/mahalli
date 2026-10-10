import 'package:isar_community/isar.dart';
import '../error/failure.dart';

/// All multi-collection writes (sale, return, restore) must go through this,
/// so they commit or roll back as a whole (BR-13).
class TransactionRunner {
  TransactionRunner(this._isar);
  final Isar _isar;

  Future<T> run<T>(Future<T> Function() action) async {
    try {
      return await _isar.writeTxn(action);
    } on Failure {
      rethrow;
    } catch (e) {
      throw DatabaseFailure('Transaction failed: $e');
    }
  }
}
