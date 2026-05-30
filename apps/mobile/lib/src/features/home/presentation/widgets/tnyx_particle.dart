import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TnyxParticle extends StatefulWidget {
  const TnyxParticle({
    this.particleCount = 30,
    this.onClick,
    super.key,
  });

  final int particleCount;
  final VoidCallback? onClick;

  @override
  State<TnyxParticle> createState() => _TnyxParticleState();
}

class _TnyxParticleState extends State<TnyxParticle> with TickerProviderStateMixin {
  late List<_ParticleModel> _particles;
  late Ticker _ticker;
  Duration _lastElapsed = Duration.zero;

  late AnimationController _pressController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _ringAlphaAnimation;
  late Animation<double> _radiusBoostAnimation;

  final List<Color> _galaxyColors = const [
    Color(0xFF00D2FF),
    Color(0xFF7000FF),
    Color(0xFF00FFD4),
    Color(0xFFFF00D4),
    Color(0xFF4FACFE),
    Color(0xFFFFFFFF),
    Color(0xFFFF9A9E),
    Color(0xFFA18CD1),
    Color(0xFF84FAB0),
    Color(0xFF2575FC),
  ];

  @override
  void initState() {
    super.initState();
    _particles = List.generate(widget.particleCount, (_) => _createParticle());

    _pressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeInOut),
    );

    _ringAlphaAnimation = Tween<double>(begin: 0.15, end: 0.70).animate(_pressController);
    _radiusBoostAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(_pressController);

    _ticker = createTicker(_onTick)..start();
  }

  _ParticleModel _createParticle() {
    final random = math.Random();
    return _ParticleModel(
      x: random.nextDouble(),
      y: random.nextDouble(),
      radius: random.nextDouble() * 1.5 + 1.2,
      color: _galaxyColors[random.nextInt(_galaxyColors.length)],
      normalVelocityX: random.nextDouble() * 2.0 - 1.0,
      normalVelocityY: random.nextDouble() * 2.0 - 1.0,
    );
  }

  void _onTick(Duration elapsed) {
    if (_lastElapsed == Duration.zero) {
      _lastElapsed = elapsed;
      return;
    }

    final double dt = (elapsed.inMicroseconds - _lastElapsed.inMicroseconds) / 1000000.0;
    _lastElapsed = elapsed;

    const normalSpeed = 0.17;
    const burstFriction = 8.5;

    setState(() {
      for (final p in _particles) {
        final moveX = p.normalVelocityX * normalSpeed + p.burstVelocityX;
        final moveY = p.normalVelocityY * normalSpeed + p.burstVelocityY;

        p.x = (p.x + moveX * dt) % 1.0;
        if (p.x < 0) p.x += 1.0;
        p.y = (p.y + moveY * dt) % 1.0;
        if (p.y < 0) p.y += 1.0;

        p.burstVelocityX *= math.max(0.0, 1.0 - dt * burstFriction);
        p.burstVelocityY *= math.max(0.0, 1.0 - dt * burstFriction);
      }
    });
  }

  void _handleTapDown() {
    _pressController.forward();
    final random = math.Random();
    for (final p in _particles) {
      p.burstVelocityX = random.nextDouble() * 8.0 - 4.0;
      p.burstVelocityY = random.nextDouble() * 8.0 - 4.0;
    }
  }

  void _handleTapUp() {
    _pressController.reverse();
    widget.onClick?.call();
  }

  @override
  void dispose() {
    _ticker.dispose();
    _pressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _handleTapDown(),
      onTapUp: (_) => _handleTapUp(),
      onTapCancel: () => _pressController.reverse(),
      child: SizedBox(
        width: 50,
        height: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Outer Ring
            AnimatedBuilder(
              animation: _ringAlphaAnimation,
              builder: (context, child) {
                return CustomPaint(
                  size: const Size(48, 48),
                  painter: _RingPainter(
                    color: const Color(0xFF00D2FF).withValues(alpha: _ringAlphaAnimation.value),
                    strokeWidth: _pressController.isAnimating || _pressController.value > 0.5 ? 2.4 : 1.1,
                  ),
                );
              },
            ),
            // Particle Canvas
            ScaleTransition(
              scale: _scaleAnimation,
              child: ClipOval(
                child: Container(
                  width: 42,
                  height: 42,
                  color: Colors.black,
                  child: CustomPaint(
                    painter: _ParticlePainter(
                      particles: _particles,
                      radiusBoost: _radiusBoostAnimation.value,
                      isPressed: _pressController.value > 0.1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ParticleModel {
  double x, y;
  final double radius;
  final Color color;
  final double normalVelocityX, normalVelocityY;
  double burstVelocityX = 0, burstVelocityY = 0;

  _ParticleModel({
    required this.x,
    required this.y,
    required this.radius,
    required this.color,
    required this.normalVelocityX,
    required this.normalVelocityY,
  });
}

class _RingPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  _RingPainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
  }

  @override
  bool shouldRepaint(_RingPainter oldDelegate) =>
      color != oldDelegate.color || strokeWidth != oldDelegate.strokeWidth;
}

class _ParticlePainter extends CustomPainter {
  final List<_ParticleModel> particles;
  final double radiusBoost;
  final bool isPressed;

  _ParticlePainter({
    required this.particles,
    required this.radiusBoost,
    required this.isPressed,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      final center = Offset(p.x * size.width, p.y * size.height);
      final finalRadius = p.radius * radiusBoost;

      // Draw Main Particle
      final mainPaint = Paint()
        ..color = p.color.withValues(alpha: isPressed ? 1.0 : 0.82)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(center, finalRadius, mainPaint);

      // Draw Outer Glow/Stroke
      final strokePaint = Paint()
        ..color = Colors.white.withValues(alpha: isPressed ? 0.20 : 0.08)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.5;
      canvas.drawCircle(center, finalRadius + 0.5, strokePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
