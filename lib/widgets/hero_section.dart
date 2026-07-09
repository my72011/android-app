// ============================================================
// lib/widgets/hero_section.dart
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/constants.dart';
import 'particle_background.dart';
import 'typing_effect.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final titleSize = isMobile ? 40.0 : _clamp(context, 40, 140, 0.09);
    final subSize = isMobile ? 14.0 : _clamp(context, 14, 22, 0.018);

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          const ParticleBackground(),
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.0,
                colors: [
                  Colors.transparent,
                  const Color(0x99FFFFFF),
                  const Color(0xF2FFFFFF),
                ],
                stops: const [0.0, 0.7, 1.0],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.glass,
                      border: Border.all(color: AppColors.glassBorder),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.6),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'AVAILABLE FOR PROJECTS',
                          style: GoogleFonts.orbitron(
                            fontSize: 12,
                            letterSpacing: 3,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeDown(duration: 600.ms),
                  const SizedBox(height: 30),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white,
                        AppColors.primary,
                        AppColors.secondary,
                      ],
                      stops: [0.0, 0.4, 0.6, 1.0],
                    ).createShader(bounds),
                    child: Text(
                      'MOSTAFA\nYASSER',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.orbitron(
                        fontSize: titleSize,
                        fontWeight: FontWeight.w900,
                        height: 0.95,
                        letterSpacing: -2,
                      ),
                    ),
                  ).animate().fadeUp(duration: 800.ms),
                  const SizedBox(height: 20),
                  Text(
                    'DEVELOPER • DESIGNER • CREATOR',
                    style: GoogleFonts.orbitron(
                      fontSize: subSize,
                      letterSpacing: 8,
                      color: AppColors.muted,
                    ),
                  ).animate().fadeUp(duration: 800.ms, delay: 100.ms),
                  const SizedBox(height: 30),
                  const TypingEffect().animate().fadeUp(duration: 800.ms, delay: 200.ms),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildPrimaryButton(
                        label: 'Explore Projects',
                        onTap: () {},
                      ),
                      const SizedBox(width: 20),
                      _buildGhostButton(
                        label: 'Contact Me',
                        onTap: () {},
                      ),
                    ],
                  ).animate().fadeUp(duration: 600.ms, delay: 300.ms),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'SCROLL',
                  style: GoogleFonts.orbitron(
                    fontSize: 11,
                    letterSpacing: 3,
                    color: AppColors.muted,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 1,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, Colors.transparent],
                    ),
                  ),
                ).animate().shimmer(
                  duration: 2000.ms,
                  color: AppColors.primary.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _clamp(BuildContext context, double min, double max, double fraction) {
    final width = MediaQuery.of(context).size.width;
    final value = width * fraction;
    if (value < min) return min;
    if (value > max) return max;
    return value;
  }

  Widget _buildPrimaryButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
            ),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.4),
                blurRadius: 30,
              ),
            ],
          ),
          child: Text(
            label.toUpperCase(),
            style: GoogleFonts.orbitron(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              color: AppColors.bg,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGhostButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: AppColors.glassBorder),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            label.toUpperCase(),
            style: GoogleFonts.orbitron(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}