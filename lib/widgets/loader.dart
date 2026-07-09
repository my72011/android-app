// ============================================================
// lib/widgets/loader.dart
// ============================================================
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
            shaderCallback: (bounds) => LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
            ).createShader(bounds),
            child: Text(
              'MY',
              style: GoogleFonts.orbitron(
                fontSize: _clamp(context, 28, 56, 0.05),
                fontWeight: FontWeight.w900,
                letterSpacing: 6,
                color: Colors.white, // Essential: ShaderMask needs a white child to show the gradient properly
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Progress bar
          Container(
            width: _clamp(context, 200, 320, 0.7), // Made responsive (was 320, 320 which is fixed)
            height: 3,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft, // Crucial: makes the progress bar grow from left to right
              widthFactor: progress / 100,
              child: Container(
                decoration: BoxDecoration(
                  gradient:  LinearGradient(
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

  double _clamp(BuildContext context, double min, double max, double fraction) {
    final width = MediaQuery.sizeOf(context).width; // More efficient in Flutter 3.10+
    return (width * fraction).clamp(min, max); // Cleaner syntax
  }
}