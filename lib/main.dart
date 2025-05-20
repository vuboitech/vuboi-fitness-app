import 'package:fitness/main_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GoogleFonts.config.allowRuntimeFetching = false;

  await initializeDependencies();

  runApp(const MainApp());
}
