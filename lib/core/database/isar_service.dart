import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'schemas.dart';

/// Opens the single local database. The DB is the source of truth.
class IsarService {
  IsarService._(this.isar);
  final Isar isar;

  static Future<IsarService> open({
    String? directory,
    String name = 'mahalli',
  }) async {
    final dir = directory ?? (await getApplicationDocumentsDirectory()).path;
    final isar = await Isar.open(allSchemas, directory: dir, name: name);
    return IsarService._(isar);
  }

  Future<void> close() => isar.close();
}
