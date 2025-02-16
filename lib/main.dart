import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'src/core/utils/constants.dart';
import 'src/app.dart';
import 'src/features/settings/presentation/settings_controller.dart';
import 'src/features/settings/domain/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  setWindowTitle(appTitle);

  runApp(MyApp(settingsController: settingsController));
}
