// ============================================================
// lib/widgets/hero_section.dart
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';
import 'particle_background.dart';
import 'typing_effect.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isMobile = size.width < 768;
    final titleSize = isMobile ? 40.0 : (size.width * 0.09).clamp(40.0, 140.0);
    final subSize = isMobile ? 14.0 : (size.width * 0.018).clamp(14.0, 22.0);

    return SizedBox(
      height: size.height,
      child: Stack(
        children: [
          const ParticleBackground(),
          
          // Dark Vignette Overlay (Fixed: Changed white colors to AppColors.bg to preserve the dark theme)
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.0,
                colors: [
                  Colors.transparent,
                  AppColors.bg.withOpacity(0.6),
                  AppColors.bg,
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
                  // Status Badge
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
                  ).animate().fadeIn(duration: 600.ms).moveY(begin: -20, end: 0, duration: 600.ms, curve: Curves.easeOut),
                  
                  const SizedBox(height: 30),
                  
                  // Main Title
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
                        color: Colors.white, // Required for ShaderMask to show the gradient properly
                      ),
                    ),
                  ).animate().fadeIn(duration: 800.ms).moveY(begin: 20, end: 0, duration: 800.ms, curve: Curves.easeOut),
                  
                  const SizedBox(height: 20),
                  
                  // Subtitle
                  Text(
                    'DEVELOPER • DESIGNER • CREATOR',
                    style: GoogleFonts.orbitron(
                      fontSize: subSize,
                      letterSpacing: 8,
                      color: AppColors.muted,
                    ),
                  ).animate().fadeIn(duration: 800.ms, delay: 100.ms).moveY(begin: 20, end: 0, duration: 800.ms, delay: 100.ms, curve: Curves.easeOut),
                  
                  const SizedBox(height: 30),
                  
                  // Typing Effect
                  const TypingEffect().animate().fadeIn(duration: 800.ms, delay: 200.ms).moveY(begin: 20, end: 0, duration: 800.ms, delay: 200.ms, curve: Curves.easeOut),
                  
                  const SizedBox(height: 40),
                  
                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildPrimaryButton(label: 'Explore Projects', onTap: () {}),
                      const SizedBox(width: 20),
                      _buildGhostButton(label: 'Contact Me', onTap: () {}),
                    ],
                  ).animate().fadeIn(duration: 600.ms, delay: 300.ms).moveY(begin: 20, end: 0, duration: 600.ms, delay: 300.ms, curve: Curves.easeOut),
                ],
              ),
            ),
          ),
          
          // Scroll Indicator
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
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primary, Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
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
            gradient:  LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
            ),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.4),
                blurRadius: 30,
                offset: const Offset(0, 10),
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