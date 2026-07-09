import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/constants.dart';
import 'particle_background.dart';
import 'typing_effect.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          // Particle background
          const ParticleBackground(),

          // Overlay gradient
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.0,
                colors: [
                  Colors.transparent,
                  Color(0x99FFFFFF), // 0.6 opacity
                  Color(0xF2FFFFFF), // 0.95 opacity
                ],
                stops: [0.0, 0.7, 1.0],
              ),
            ),
          ),

          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Badge
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
                          'Available for Projects',
                          style: GoogleFonts.orbitron(
                            fontSize: 12,
                            letterSpacing: 3,
                            textTransform: 'uppercase',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeDown(duration: 600.ms),

                  const SizedBox(height: 30),

                  // Title
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
                        fontSize: isMobile ? 40 : clamp(40, 140, 0.09),
                        fontWeight: FontWeight.w900,
                        height: 0.95,
                        letterSpacing: -2,
                      ),
                    ),
                  ).animate().fadeUp(duration: 800.ms),

                  const SizedBox(height: 20),

                  // Subtitle
                  Text(
                    'Developer • Designer • Creator',
                    style: GoogleFonts.orbitron(
                      fontSize: isMobile ? 14 : clamp(14, 22, 0.018),
                      letterSpacing: 8,
                      color: AppColors.muted,
                      textTransform: 'uppercase',
                    ),
                  ).animate().fadeUp(
                    duration: 800.ms,
                    delay: 100.ms,
                  ),

                  const SizedBox(height: 30),

                  // Typed effect
                  const TypingEffect().animate().fadeUp(
                    duration: 800.ms,
                    delay: 200.ms,
                  ),

                  const SizedBox(height: 40),

                  // Buttons
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
                  ).animate().fadeUp(
                    duration: 600.ms,
                    delay: 300.ms,
                  ),
                ],
              ),
            ),
          ),

          // Scroll indicator
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
                    gradient: LinearGradient(
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

  double clamp(double min, double max, double fraction) {
    final width = MediaQuery.of(WidgetsBinding.instance.context).size.width;
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
            label,
            style: GoogleFonts.orbitron(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              textTransform: 'uppercase',
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
            label,
            style: GoogleFonts.orbitron(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              textTransform: 'uppercase',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}