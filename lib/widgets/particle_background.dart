// ============================================================
// lib/widgets/particle_background.dart
// ============================================================
import 'package:flutter/material.dart';
import 'dart:math';

class ParticleBackground extends StatefulWidget {
  const ParticleBackground({super.key});

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<_Particle> _particles = [];
  final Random _random = Random();
  
  // Base paint to avoid creating a new Paint object every frame for better performance
  final Paint _basePaint = Paint()..style = PaintingStyle.fill;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..repeat();

    _generateParticles();
  }

  void _generateParticles() {
    // Reduced particle count from 3000 to 400 for much better performance on mobile/web
    // while still keeping a nice starry background effect
    const int particleCount = 400; 
    for (int i = 0; i < particleCount; i++) {
      _particles.add(
        _Particle(
          x: _random.nextDouble(),
          y: _random.nextDouble(),
          z: _random.nextDouble(),
          size: 0.002 + _random.nextDouble() * 0.004,
          speedX: -0.0005 + _random.nextDouble() * 0.001,
          speedY: -0.0005 + _random.nextDouble() * 0.001,
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
        for (var p in _particles) {
          p.x += p.speedX;
          p.y += p.speedY;
          if (p.x < 0) p.x = 1;
          if (p.x > 1) p.x = 0;
          if (p.y < 0) p.y = 1;
          if (p.y > 1) p.y = 0;
        }
        return CustomPaint(
          painter: _ParticlePainter(_particles, _basePaint),
          size: Size.infinite,
        );
      },
    );
  }
}

// Used Dart 3 class modifiers for better encapsulation
final class _Particle {
  double x, y, z;
  final double size;
  final double speedX, speedY;
  final Color color;

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

final class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final Paint basePaint;

  _ParticlePainter(this.particles, this.basePaint);

  @override
  void paint(Canvas canvas, Size size) {
    for (var p in particles) {
      final x = p.x * size.width;
      final y = p.y * size.height;
      final radius = p.size * size.width * 1.5;

      // Reusing the basePaint and just updating the color to avoid memory allocations per frame
      basePaint.color = p.color.withOpacity(0.7 + 0.3 * p.z);

      canvas.drawCircle(
        Offset(x, y),
        radius,
        basePaint,
      );
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter oldDelegate) => true;
}