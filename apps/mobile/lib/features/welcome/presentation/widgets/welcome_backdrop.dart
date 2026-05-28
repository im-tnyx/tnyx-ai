import 'package:flutter/material.dart';

class WelcomeBackdrop extends StatelessWidget {
  const WelcomeBackdrop({super.key});

  @override
  Widget build(BuildContext context) {
    // थीम के अनुसार बेस कलर (Light में Surface White, Dark में Surface Black)
    final themeColor = Theme.of(context).colorScheme.surface;

    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  themeColor.withValues(alpha: 0.18), // सेम अल्फा
                  themeColor.withValues(alpha: 0.08), // सेम अल्फा
                  themeColor.withValues(alpha: 0.0),   // सेम अल्फा
                ],
                stops: const [
                  0.0,
                  0.35,
                  1.0,
                ],
              ),
            ),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 0.70,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    themeColor.withValues(alpha: 0.0),
                    themeColor.withValues(alpha: 0.50),
                    themeColor.withValues(alpha: 1.0),
                    themeColor.withValues(alpha: 1.0),
                    themeColor.withValues(alpha: 1.0),
                    themeColor.withValues(alpha: 1.0),
                  ],
                  stops: const [
                    0.0,
                    0.08,
                    0.18,
                    0.34,
                    0.62,
                    1.0,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}