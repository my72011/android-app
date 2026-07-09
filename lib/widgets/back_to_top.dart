import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/constants.dart';

class BackToTopButton extends StatelessWidget {
  final VoidCallback onTap;

  const BackToTopButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
      ),
    ).animate().fadeIn(
      duration: 400.ms,
    );
  }
}