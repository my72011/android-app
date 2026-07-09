import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class LoaderWidget extends StatelessWidget {
  final double progress;

  const LoaderWidget({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bg,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
            ).createShader(bounds),
            child: Text(
              'MY',
              style: GoogleFonts.orbitron(
                fontSize: clamp(28, 56, 5),
                fontWeight: FontWeight.w900,
                letterSpacing: 6,
              ),
            ),
          ).animate().shimmer(
            duration: const Duration(milliseconds: 1600),
            color: AppColors.primary.withOpacity(0.5),
          ),

          const SizedBox(height: 30),

          // Progress bar
          Container(
            width: clamp(320, 320, 0.7),
            height: 3,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FractionallySizedBox(
              widthFactor: progress / 100,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.5),
                      blurRadius: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Percent
          Text(
            '${progress.toInt()}%',
            style: GoogleFonts.orbitron(
              fontSize: 14,
              color: AppColors.primary,
              letterSpacing: 3,
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
}