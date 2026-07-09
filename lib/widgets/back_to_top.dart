// ============================================================
// lib/widgets/back_to_top.dart
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/constants.dart';

class BackToTopButton extends StatelessWidget {
  final VoidCallback onTap;

  const BackToTopButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Positioned MUST be the outermost widget returned here so that 
    // the parent Stack in HomeScreen correctly positions it at the bottom right.
    return Positioned(
      bottom: 30,
      right: 30,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.5),
                  blurRadius: 20,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Icon(
              Icons.arrow_upward,
              color: AppColors.bg,
              size: 20,
            ),
          ),
        ),
      )
          // Apply the animation to the child, NOT the Positioned widget
          .animate()
          .fadeIn(duration: 400.ms)
          .scale(
            begin: const Offset(0.8, 0.8),
            end: const Offset(1.0, 1.0),
            duration: 400.ms,
            curve: Curves.easeOutBack,
          ),
    );
  }
}