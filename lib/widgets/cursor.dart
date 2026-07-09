// ============================================================
// lib/widgets/cursor.dart
// ============================================================
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomCursor extends StatefulWidget {
  const CustomCursor({super.key});

  @override
  State<CustomCursor> createState() => _CustomCursorState();
}

class _CustomCursorState extends State<CustomCursor> {
  Offset _position = Offset.zero;
  bool _isHovering = false;

  bool _isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > 768;
  }

  @override
  Widget build(BuildContext context) {
    if (!_isDesktop(context)) return const SizedBox.shrink();

    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: (event) {
        setState(() {
          _position = event.localPosition;
        });
      },
      onEnter: (_) => setState(() => _isHovering = false),
      child: Stack(
        children: [
          // Dot
          Positioned(
            left: _position.dx - 4,
            top: _position.dy - 4,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.6),
                    blurRadius: 15,
                  ),
                ],
              ),
            ),
          ),
          // Ring
          Positioned(
            left: _position.dx - 20,
            top: _position.dy - 20,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: _isHovering ? 70 : 40,
              height: _isHovering ? 70 : 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _isHovering ? AppColors.secondary : AppColors.primary,
                  width: 1.5,
                ),
                color: _isHovering
                    ? AppColors.secondary.withOpacity(0.1)
                    : Colors.transparent,
              ),
            ),
          ),
          // Glow
          Positioned(
            left: _position.dx - 200,
            top: _position.dy - 200,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.08),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.7],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}