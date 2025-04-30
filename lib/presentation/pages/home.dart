import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeBody());
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var brightness = Theme.of(context).brightness;

    var decoration = BoxDecoration();

    if (brightness == Brightness.light) {
      decoration = decoration.copyWith(gradient: LinearGradient(
        colors: [colorScheme.primaryFixed, colorScheme.surfaceBright, colorScheme.surface],
        stops: [0, 0.6, 1],
        begin: Alignment(-1.2, -1.8),
        end: Alignment(-0.2, 1),
      ));
    } else {
      decoration = decoration.copyWith(
        color: colorScheme.surface
      );
    }

    return Expanded(
      child: Container(
          decoration: decoration,
      ),
    );
  }
}
