import 'package:flutter/material.dart';
import 'core/src/app.dart';
import 'core/di/service_locator.dart' as di;
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(); // register services
  // Initialize locale data for your locale (e.g., 'en_US' or 'ar_EG')
  await initializeDateFormatting('en_US', null);
  runApp(const MyApp());
}
