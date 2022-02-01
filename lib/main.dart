import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'scaffold/main_scaffold.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );
  runApp(MainScaffold());
}