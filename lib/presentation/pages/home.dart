import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

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
      decoration = decoration.copyWith(
        gradient: LinearGradient(
          colors: [
            colorScheme.primaryFixed,
            colorScheme.surfaceBright,
            colorScheme.surface,
          ],
          stops: [0, 0.6, 1],
          begin: Alignment(-1.2, -1.8),
          end: Alignment(-0.2, 1),
        ),
      );
    } else {
      decoration = decoration.copyWith(color: colorScheme.surface);
    }

    return Container(
      decoration: decoration,
      child: Stack(children: [ChatBar()]),
    );
  }
}

class ChatBar extends StatelessWidget {
  const ChatBar({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var theme = Theme.of(context);

    return Positioned(
      bottom: 40,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    // TODO: 阴影细调
                    BoxShadow(
                      color: Color(0x05000000),
                      blurRadius: 3,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x05000000),
                      blurRadius: 6,
                      offset: Offset(0, 6),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x02000000),
                      blurRadius: 8,
                      offset: Offset(0, 13),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x00000000),
                      blurRadius: 9,
                      offset: Offset(0, 22),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x00000000),
                      blurRadius: 10,
                      offset: Offset(0, 35),
                      spreadRadius: 0,
                    )
                  ]
                ),
                height: 56,
                child: Row(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [MoreButton(), Expanded(child: InputBar())],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoreButton extends StatelessWidget {
  const MoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: 56,
      height: 56,
      child: IconButton.filledTonal(
        style: IconButton.styleFrom(
          backgroundColor: colorScheme.surfaceContainerLowest,
        ),
        onPressed: () => {},
        icon: Icon(LucideIcons.plus500, size: 20,),
      ),
    );
  }
}

class InputBar extends StatefulWidget {
  const InputBar({super.key});

  @override
  State<InputBar> createState() => _InputBarState();
}

class _InputBarState extends State<InputBar> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;

    var gradient = LinearGradient(
      colors: [colorScheme.surfaceContainerLowest, colorScheme.surfaceBright],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        border: Border.all(color: colorScheme.surfaceContainerLowest, width: 2),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TalkLabel(),
            IconButton(onPressed: () {}, icon: Icon(LucideIcons.keyboard), iconSize: 22,)
          ],
        ),
      ),
    );
  }
}

class TalkLabel extends StatelessWidget {
  const TalkLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Icon(LucideIcons.audioLines400,),
          ),
          Text("长按说话", textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
