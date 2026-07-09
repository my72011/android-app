// ============================================================
// lib/widgets/typing_effect.dart
// ============================================================
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class TypingEffect extends StatefulWidget {
  const TypingEffect({super.key});

  @override
  State<TypingEffect> createState() => _TypingEffectState();
}

class _TypingEffectState extends State<TypingEffect> with SingleTickerProviderStateMixin {
  final List<String> _phrases = [
    'Building Digital Experiences',
    'Creating Interactive Worlds',
    'Designing The Future',
    'Crafting Premium Websites',
  ];

  int _phraseIndex = 0;
  int _charIndex = 0;
  Timer? _timer;
  late final AnimationController _cursorController;

  @override
  void initState() {
    super.initState();
    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
    
    _startTyping();
  }

  void _startTyping() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 60), (_) {
      if (_charIndex < _phrases[_phraseIndex].length) {
        setState(() => _charIndex++);
      } else {
        _pause();
      }
    });
  }

  void _startDeleting() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 30), (_) {
      if (_charIndex > 0) {
        setState(() => _charIndex--);
      } else {
        setState(() {
          _phraseIndex = (_phraseIndex + 1) % _phrases.length;
        });
        _startTyping();
      }
    });
  }

  void _pause() {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 1800), _startDeleting);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cursorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isMobile = size.width < 768;
    final fontSize = isMobile ? 18.0 : (size.width * 0.025).clamp(18.0, 28.0);
    final cursorHeight = isMobile ? 24.0 : (size.width * 0.035).clamp(24.0, 34.0);
    final text = _phrases[_phraseIndex].substring(0, _charIndex);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            color: AppColors.text,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(width: 4),
        AnimatedBuilder(
          animation: _cursorController,
          builder: (context, child) {
            return Container(
              width: 2,
              height: cursorHeight,
              color: AppColors.primary.withOpacity(_cursorController.value),
            );
          },
        ),
      ],
    );
  }
}