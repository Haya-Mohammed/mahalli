import 'package:mahalli/features/security/domain/models/pin_record.dart';

abstract class PinStore {
  Future<PinRecord?> read();
  Future<void> write(PinRecord record);
  Future<void> delete();
}
