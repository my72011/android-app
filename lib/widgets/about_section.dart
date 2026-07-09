// ============================================================
// lib/widgets/about_section.dart
// ============================================================
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../utils/constants.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  final List<Map<String, dynamic>> _stats = [
    {'label': 'Projects', 'count': 25},
    {'label': 'Designs', 'count': 80},
    {'label': 'Hours', 'count': 500},
    {'label': 'Skills', 'count': 15},
  ];

  final Map<int, double> _animatedValues = {};
  final List<Timer> _timers = [];

  @override
  void dispose() {
    for (final timer in _timers) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isMobile = size.width < 968;
    final titleSize = isMobile ? 32.0 : (size.width * 0.05).clamp(32.0, 64.0);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 80 : 120,
      ),
      child: Column(
        children: [
          _buildHeader(context, titleSize),
          const SizedBox(height: 80),
          if (isMobile)
            _buildMobileContent(context)
          else
            _buildDesktopContent(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, double titleSize) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(100),
            color: AppColors.primary.withOpacity(0.05),
          ),
          child: Text(
            'ABOUT ME',
            style: GoogleFonts.orbitron(
              fontSize: 12,
              letterSpacing: 4,
              color: AppColors.primary,
            ),
          ),
        ).animate().fadeIn(duration: 600.ms).moveY(begin: 20, end: 0, duration: 600.ms, curve: Curves.easeOut),
        
        const SizedBox(height: 15),
        
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.white, AppColors.primary],
          ).createShader(bounds),
          child: Text(
            'The Creator',
            style: GoogleFonts.orbitron(
              fontSize: titleSize,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
              color: Colors.white, // Required for ShaderMask
            ),
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 100.ms).moveY(begin: 20, end: 0, duration: 600.ms, delay: 100.ms, curve: Curves.easeOut),
        
        const SizedBox(height: 15),
        
        Text(
          'A glimpse into the mind behind the code.',
          style: TextStyle(
            color: AppColors.muted,
            fontSize: 16,
            height: 1.7,
          ),
          textAlign: TextAlign.center,
        ).animate().fadeIn(duration: 600.ms, delay: 200.ms).moveY(begin: 20, end: 0, duration: 600.ms, delay: 200.ms, curve: Curves.easeOut),
      ],
    );
  }

  Widget _buildDesktopContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: AppColors.glass,
              border: Border.all(color: AppColors.glassBorder),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                  ).createShader(bounds),
                  child: Text(
                    'Passionate Developer',
                    style: GoogleFonts.orbitron(
                      fontSize: 28,
                      color: Colors.white, // Required for ShaderMask
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Passionate young developer creating innovative websites and immersive digital experiences. I blend cutting-edge technology with artistic vision to craft interfaces that feel alive.',
                  style: TextStyle(
                    color: AppColors.muted,
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Every project is a journey — from concept to cinematic interaction, I push boundaries to deliver unforgettable digital moments.',
                  style: TextStyle(
                    color: AppColors.muted,
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 30),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.8,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: _stats.length,
                  itemBuilder: (context, index) {
                    return _buildStatCard(context, index);
                  },
                ),
              ],
            ),
          ).animate().fadeIn(duration: 800.ms).moveX(begin: -20, end: 0, duration: 800.ms, curve: Curves.easeOut),
        ),
        const SizedBox(width: 60),
        Expanded(
          child: SizedBox(
            height: 500,
            child: _buildOrbitVisual(),
          ).animate().fadeIn(duration: 800.ms).moveX(begin: 20, end: 0, duration: 800.ms, curve: Curves.easeOut),
        ),
      ],
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: AppColors.glass,
            border: Border.all(color: AppColors.glassBorder),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                ).createShader(bounds),
                child: Text(
                  'Passionate Developer',
                  style: GoogleFonts.orbitron(
                    fontSize: 24,
                    color: Colors.white, // Required for ShaderMask
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Passionate young developer creating innovative websites and immersive digital experiences. I blend cutting-edge technology with artistic vision to craft interfaces that feel alive.',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 15,
                  height: 1.8,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Every project is a journey — from concept to cinematic interaction, I push boundaries to deliver unforgettable digital moments.',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 15,
                  height: 1.8,
                ),
              ),
              const SizedBox(height: 30),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: _stats.length,
                itemBuilder: (context, index) {
                  return _buildStatCard(context, index);
                },
              ),
            ],
          ),
        ).animate().fadeIn(duration: 800.ms).moveX(begin: -20, end: 0, duration: 800.ms, curve: Curves.easeOut),
        
        const SizedBox(height: 40),
        
        SizedBox(
          height: 350,
          child: _buildOrbitVisual(),
        ).animate().fadeIn(duration: 800.ms).moveX(begin: 20, end: 0, duration: 800.ms, curve: Curves.easeOut),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, int index) {
    final stat = _stats[index];

    return VisibilityDetector(
      key: ValueKey('stat_$index'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5) {
          _animateStat(index, stat['count'] as int);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.03),
          border: Border.all(color: AppColors.glassBorder),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${(_animatedValues[index] ?? 0).toInt()}+',
              style: GoogleFonts.orbitron(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              stat['label'] as String,
              style: GoogleFonts.orbitron(
                fontSize: 12,
                letterSpacing: 2,
                color: AppColors.muted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _animateStat(int key, int target) {
    if (_animatedValues.containsKey(key) && _animatedValues[key]! >= target) return;

    double current = 0;
    const steps = 60;
    final increment = target / steps;

    final timer = Timer.periodic(const Duration(milliseconds: 16), (t) {
      if (!mounted) {
        t.cancel();
        return;
      }
      setState(() {
        current += increment;
        if (current >= target) {
          current = target.toDouble();
          t.cancel();
        }
        _animatedValues[key] = current;
      });
    });
    _timers.add(timer);
  }

  Widget _buildOrbitVisual() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer solid circle
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primary.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        // Middle dashed circle (Fixed: Flutter doesn't support BorderStyle.dashed natively, using CustomPaint)
        CustomPaint(
          size: const Size(210, 210),
          painter: _DashedCirclePainter(color: AppColors.secondary.withOpacity(0.2)),
        ),
        // Inner dashed circle
        CustomPaint(
          size: const Size(120, 120),
          painter: _DashedCirclePainter(color: AppColors.primary.withOpacity(0.3)),
        ),
        // Center glowing core
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [AppColors.primary, AppColors.secondary],
              stops: [0.3, 1.0],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary,
                blurRadius: 60,
              ),
              BoxShadow(
                color: AppColors.secondary,
                blurRadius: 120,
              ),
            ],
          ),
        ).animate().scale(
          duration: 3.seconds,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1.1, 1.1),
          curve: Curves.easeInOut,
        ).then().scale(
          duration: 3.seconds,
          begin: const Offset(1.1, 1.1),
          end: const Offset(0.9, 0.9),
          curve: Curves.easeInOut,
        ).repeat(reverse: true),
      ],
    );
  }
}

// Custom Painter to create dashed circles since Flutter's BorderSide doesn't support dashed lines natively
final class _DashedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;

  _DashedCirclePainter({
    required this.color,
    this.strokeWidth = 1.0,
    this.dashLength = 6.0,
    this.gapLength = 6.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final radius = (size.width - strokeWidth) / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final circumference = 2 * pi * radius;
    final patternLength = dashLength + gapLength;
    final dashCount = (circumference / patternLength).floor();
    final anglePerDash = 2 * pi / dashCount;

    for (int i = 0; i < dashCount; i++) {
      final startAngle = i * anglePerDash;
      final sweepAngle = (dashLength / circumference) * 2 * pi;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _DashedCirclePainter oldDelegate) => false;
}