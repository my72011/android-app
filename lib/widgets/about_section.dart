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

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 968;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 80 : 120,
      ),
      child: Column(
        children: [
          // Header
          _buildHeader(),

          const SizedBox(height: 80),

          // Content
          if (isMobile)
            _buildMobileContent()
          else
            _buildDesktopContent(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
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
            'About Me',
            style: GoogleFonts.orbitron(
              fontSize: 12,
              letterSpacing: 4,
              color: AppColors.primary,
              textTransform: 'uppercase',
            ),
          ),
        ).animate().fadeUp(duration: 600.ms),

        const SizedBox(height: 15),

        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.white, AppColors.primary],
          ).createShader(bounds),
          child: Text(
            'The Creator',
            style: GoogleFonts.orbitron(
              fontSize: clamp(32, 64, 0.05),
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
            ),
          ),
        ).animate().fadeUp(duration: 600.ms, delay: 100.ms),

        const SizedBox(height: 15),

        Text(
          'A glimpse into the mind behind the code.',
          style: TextStyle(
            color: AppColors.muted,
            fontSize: 16,
            height: 1.7,
          ),
          textAlign: TextAlign.center,
        ).animate().fadeUp(duration: 600.ms, delay: 200.ms),
      ],
    );
  }

  Widget _buildDesktopContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Card
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
                // Stats
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
                    return _buildStatCard(index);
                  },
                ),
              ],
            ),
          ).animate().fadeRight(duration: 800.ms),
        ),

        const SizedBox(width: 60),

        // Visual
        Expanded(
          child: SizedBox(
            height: 500,
            child: _buildOrbitVisual(),
          ).animate().fadeLeft(duration: 800.ms),
        ),
      ],
    );
  }

  Widget _buildMobileContent() {
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
              // Stats
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
                  return _buildStatCard(index);
                },
              ),
            ],
          ),
        ).animate().fadeRight(duration: 800.ms),

        const SizedBox(height: 40),

        // Visual
        SizedBox(
          height: 350,
          child: _buildOrbitVisual(),
        ).animate().fadeLeft(duration: 800.ms),
      ],
    );
  }

  Widget _buildStatCard(int index) {
    final stat = _stats[index];
    final key = index;

    return VisibilityDetector(
      key: ValueKey('stat_$key'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5) {
          _animateStat(key, stat['count']);
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
              '${(_animatedValues[key] ?? 0).toInt()}+',
              style: GoogleFonts.orbitron(
                fontSize: 32,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              stat['label'],
              style: GoogleFonts.orbitron(
                fontSize: 12,
                letterSpacing: 2,
                color: AppColors.muted,
                textTransform: 'uppercase',
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

    Timer.periodic(const Duration(milliseconds: 16), (timer) {
      setState(() {
        current += increment;
        if (current >= target) {
          current = target;
          timer.cancel();
        }
        _animatedValues[key] = current;
      });
    });
  }

  Widget _buildOrbitVisual() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer orbit
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primary.withOpacity(0.2),
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
        // Middle orbit
        Container(
          width: 210,
          height: 210,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.secondary.withOpacity(0.2),
              width: 1,
              style: BorderStyle.dashed,
            ),
          ),
        ),
        // Inner orbit
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primary.withOpacity(0.3),
              width: 1,
              style: BorderStyle.dashed,
            ),
          ),
        ),
        // Core
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

  double clamp(double min, double max, double fraction) {
    final width = MediaQuery.of(WidgetsBinding.instance.context).size.width;
    final value = width * fraction;
    if (value < min) return min;
    if (value > max) return max;
    return value;
  }
}
