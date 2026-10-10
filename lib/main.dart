import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mahalli/app.dart';
import 'package:mahalli/core/di/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(const MahalliApp());
}
