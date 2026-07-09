import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class TypingEffect extends StatefulWidget {
  const TypingEffect({super.key});

  @override
  State<TypingEffect> createState() => _TypingEffectState();
}

class _TypingEffectState extends State<TypingEffect> {
  final List<String> _phrases = [
    'Building Digital Experiences',
    'Creating Interactive Worlds',
    'Designing The Future',
    'Crafting Premium Websites',
  ];

  int _phraseIndex = 0;
  int _charIndex = 0;
  bool _isDeleting = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 50), _updateText);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateText(Timer timer) {
    setState(() {
      final phrase = _phrases[_phraseIndex];

      if (!_isDeleting) {
        if (_charIndex < phrase.length) {
          _charIndex++;
        } else {
          _isDeleting = true;
          timer.cancel();
          _timer = Timer.periodic(const Duration(milliseconds: 1800), (t) {
            _isDeleting = true;
            t.cancel();
            _timer = Timer.periodic(const Duration(milliseconds: 30), _updateText);
          });
          return;
        }
      } else {
        if (_charIndex > 0) {
          _charIndex--;
        } else {
          _isDeleting = false;
          _phraseIndex = (_phraseIndex + 1) % _phrases.length;
          timer.cancel();
          _timer = Timer.periodic(const Duration(milliseconds: 50), _updateText);
          return;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final text = _phrases[_phraseIndex].substring(0, _charIndex);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 18 : clamp(18, 28, 0.025),
            color: AppColors.text,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(width: 2),
        Container(
          width: 2,
          height: isMobile ? 24 : clamp(24, 34, 0.035),
          color: AppColors.primary,
        ),
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
