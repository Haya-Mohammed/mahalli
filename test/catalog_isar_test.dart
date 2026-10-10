import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/database/collections/product.dart';
import 'package:mahalli/core/database/schemas.dart';
import 'package:mahalli/features/catalog/data/isar_catalog_repository.dart';

void main() {
  test('active products and services can be queried from Isar', () async {
    if (!Platform.isWindows && !Platform.isLinux && !Platform.isMacOS) return;
    final config =
        jsonDecode(await File('.dart_tool/package_config.json').readAsString())
            as Map<String, dynamic>;
    final packages = (config['packages'] as List<dynamic>).cast<Map<String, dynamic>>();
    final dependency = packages.firstWhere((p) => p['name'] == 'isar_community_flutter_libs');
    final rootUri = (dependency['rootUri'] as String).replaceFirst(RegExp(r'/$'), '');
    final library = Platform.isWindows
        ? 'windows/libisar.dll'
        : Platform.isLinux
        ? 'linux/libisar.so'
        : 'macos/libisar.dylib';
    final libraryPath = Uri.parse('$rootUri/$library').toFilePath(windows: Platform.isWindows);
    await Isar.initializeIsarCore(libraries: {Abi.current(): libraryPath});
    final dir = await Directory.systemTemp.createTemp('mahalli-catalog-probe');
    final isar = await Isar.open(allSchemas, directory: dir.path, name: 'probe');
    try {
      await isar.writeTxn(() async {
        await isar.products.put(
          Product()
            ..name = 'Milk'
            ..sellingPrice = 800,
        );
        await isar.services.put(
          Service()
            ..name = 'Haircut'
            ..sellingPrice = 3000,
        );
      });
      final repo = IsarCatalogRepository(isar);
      for (final type in ItemType.values) {
        final page = await repo.search(
          type: type,
          query: '',
          includeInactive: false,
          offset: 0,
          limit: 100,
        );
        expect(page.items, hasLength(1));
        expect(page.items.single.type, type);
      }
    } finally {
      await isar.close(deleteFromDisk: true);
      await dir.delete(recursive: true);
    }
  });
}
