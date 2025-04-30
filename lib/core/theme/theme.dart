import 'package:flutter/material.dart';

// TODO: 用户自定义主题

// TODO: 调整储存位置使用户设置持久化
var defColorScheme = ColorScheme.fromSeed(
    seedColor: Color(0x00CCD5AE),
);


var themeData = ThemeData(
  useMaterial3: true,
  colorScheme: defColorScheme,
  brightness: Brightness.light
);