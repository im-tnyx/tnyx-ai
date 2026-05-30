import 'dart:math' as math;
import 'package:flutter/material.dart';

class CelestialDot {
  final double angle;
  final double baseSize;
  final double opacity;
  final double phase;
  final double pulseSpeed;

  const CelestialDot({
    required this.angle,
    required this.baseSize,
    required this.opacity,
    required this.phase,
    required this.pulseSpeed,
  });
}

class TnyxCelestialRing extends StatefulWidget {
  const TnyxCelestialRing({
    this.radius = 100.0,
    this.dotCount = 48,
    this.dotColor = const Color(0xFF5A9DED),
    this.rotationDuration = const Duration(seconds: 12),
    this.pulseDuration = const Duration(seconds: 3),
    super.key,
  });

  final double radius;
  final int dotCount;
  final Color dotColor;
  final Duration rotationDuration;
  final Duration pulseDuration;

  @override
  State<TnyxCelestialRing> createState() => _TnyxCelestialRingState();
}

class _TnyxCelestialRingState extends State<TnyxCelestialRing>
    with SingleTickerProviderStateMixin {
  late List<CelestialDot> _dots;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _dots = _generateDots(widget.dotCount);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60), // Long duration for continuous math
    )..repeat();
  }

  List<CelestialDot> _generateDots(int count) {
    final random = math.Random();
    return List.generate(count, (i) {
      final angle = (i / count) * 360.0;
      final isProminent = i % 4 == 0;

      // Base size matching the large dots in your logic
      final baseSize = isProminent ? 7.0 : (random.nextDouble() * 1.5 + 4.0);
      final opacity = isProminent ? 1.0 : (random.nextDouble() * 0.3 + 0.4);

      return CelestialDot(
        angle: angle,
        baseSize: baseSize,
        opacity: opacity,
        phase: random.nextDouble() * 2 * math.pi,
        pulseSpeed: random.nextDouble() * 1.7 + 0.8,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Calculate continuous rotation and pulse time
        final double rotationAngle =
            (_controller.lastElapsedDuration!.inMilliseconds /
                    widget.rotationDuration.inMilliseconds) *
                2 *
                math.pi;

        final double pulseTime =
            (_controller.lastElapsedDuration!.inMilliseconds /
                    widget.pulseDuration.inMilliseconds) *
                2 *
                math.pi;

        return SizedBox(
          width: widget.radius * 2 + 50,
          height: widget.radius * 2 + 50,
          child: CustomPaint(
            painter: _CelestialPainter(
              dots: _dots,
              radius: widget.radius,
              dotColor: widget.dotColor,
              rotationAngle: rotationAngle,
              pulseTime: pulseTime,
            ),
          ),
        );
      },
    );
  }
}

class _CelestialPainter extends CustomPainter {
  final List<CelestialDot> dots;
  final double radius;
  final Color dotColor;
  final double rotationAngle;
  final double pulseTime;

  _CelestialPainter({
    required this.dots,
    required this.radius,
    required this.dotColor,
    required this.rotationAngle,
    required this.pulseTime,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    
    canvas.save();
    // Move to center and rotate the entire canvas
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotationAngle);

    for (final dot in dots) {
      final double angleRad = dot.angle * (math.pi / 180.0);
      final double x = radius * math.cos(angleRad);
      final double y = radius * math.sin(angleRad);

      // Scale Logic: 0.6x to 1.4x pulse
      final double pulseVariation = math.sin(pulseTime * dot.pulseSpeed + dot.phase);
      final double scale = 1.0 + (0.4 * pulseVariation);
      final double currentSize = dot.baseSize * scale;

      // 1. Glow Effect (Outer Circle)
      final glowPaint = Paint()
        ..color = dotColor.withValues(alpha: dot.opacity * 0.20)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(x, y), currentSize * 1.5, glowPaint);

      // 2. Main Dot (Inner Circle)
      final dotPaint = Paint()
        ..color = dotColor.withValues(alpha: dot.opacity)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(x, y), currentSize, dotPaint);
    }
    
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
