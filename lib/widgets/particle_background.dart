import 'package:flutter/material.dart';
import 'dart:math';

class ParticleBackground extends StatefulWidget {
  const ParticleBackground({super.key});

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..repeat();

    // Initialize particles
    for (int i = 0; i < 3000; i++) {
      _particles.add(
        _Particle(
          x: _random.nextDouble(),
          y: _random.nextDouble(),
          z: _random.nextDouble(),
          size: 0.002 + _random.nextDouble() * 0.004,
          speedX: (-0.0005 + _random.nextDouble() * 0.001),
          speedY: (-0.0005 + _random.nextDouble() * 0.001),
          color: _random.nextDouble() < 0.5
              ? const Color(0xFF00E5FF)
              : const Color(0xFF8B5CF6),
        ),
      );
    }
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
        // Update particle positions
        for (var p in _particles) {
          p.x += p.speedX;
          p.y += p.speedY;
          if (p.x < 0) p.x = 1;
          if (p.x > 1) p.x = 0;
          if (p.y < 0) p.y = 1;
          if (p.y > 1) p.y = 0;
        }

        return CustomPaint(
          painter: _ParticlePainter(_particles),
          size: Size.infinite,
        );
      },
    );
  }
}

class _Particle {
  double x, y, z;
  double size;
  double speedX, speedY;
  Color color;

  _Particle({
    required this.x,
    required this.y,
    required this.z,
    required this.size,
    required this.speedX,
    required this.speedY,
    required this.color,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;

  _ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (var p in particles) {
      final x = p.x * size.width;
      final y = p.y * size.height;
      final radius = p.size * size.width * 1.5;

      paint.color = p.color.withOpacity(0.7 + 0.3 * p.z);

      canvas.drawCircle(
        Offset(x, y),
        radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter oldDelegate) => true;
}