import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:mahalli/features/receipts/data/pdf_receipt_output.dart';
import 'package:mahalli/features/receipts/domain/repository/receipt_output.dart';

import 'data/isar_receipt_repository.dart';
import 'domain/repository/receipt_repository.dart';

void registerReceipts(GetIt sl) {
  sl.registerLazySingleton<ReceiptRepository>(() => IsarReceiptRepository(sl<Isar>()));
  sl.registerLazySingleton<ReceiptOutput>(() => const PdfReceiptOutput());
}
