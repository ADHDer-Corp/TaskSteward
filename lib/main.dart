import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:tasksteward/core/theme/theme.dart';
import 'package:tasksteward/core/utils/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:tasksteward/presentation/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:tasksteward/presentation/states/app_states.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AppStates())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeData,
          home: const HomePage()
      ),
    );
  }
}
