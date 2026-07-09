// ============================================================
// lib/widgets/skills_section.dart
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/constants.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final List<Map<String, dynamic>> _skills = const [
    {'icon': FontAwesomeIcons.html5, 'name': 'HTML5'},
    {'icon': FontAwesomeIcons.css3Alt, 'name': 'CSS3'},
    {'icon': FontAwesomeIcons.js, 'name': 'JavaScript'},
    {'icon': FontAwesomeIcons.wandMagicSparkles, 'name': 'GSAP'},
    {'icon': FontAwesomeIcons.cube, 'name': 'Three.js'},
    {'icon': FontAwesomeIcons.mobileScreen, 'name': 'Responsive'},
    {'icon': FontAwesomeIcons.palette, 'name': 'UI Design'},
    {'icon': FontAwesomeIcons.route, 'name': 'UX Design'},
    {'icon': FontAwesomeIcons.code, 'name': 'Web Dev'},
    {'icon': FontAwesomeIcons.laptopCode, 'name': 'Frontend'},
    {'icon': FontAwesomeIcons.penNib, 'name': 'Creative'},
    {'icon': FontAwesomeIcons.robot, 'name': 'AI Tools'},
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final titleSize = isMobile ? 32.0 : _clamp(context, 32, 64, 0.05);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 80 : 120,
      ),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.primary.withOpacity(0.05),
                ),
                child: Text(
                  'EXPERTISE',
                  style: GoogleFonts.orbitron(
                    fontSize: 12,
                    letterSpacing: 4,
                    color: AppColors.primary,
                  ),
                ),
              ).animate().fadeUp(duration: 600.ms),
              const SizedBox(height: 15),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.white, AppColors.primary],
                ).createShader(bounds),
                child: Text(
                  'Skills & Tools',
                  style: GoogleFonts.orbitron(
                    fontSize: titleSize,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1,
                  ),
                ),
              ).animate().fadeUp(duration: 600.ms, delay: 100.ms),
              const SizedBox(height: 15),
              Text(
                'The technologies I wield to build the future.',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 16,
                  height: 1.7,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeUp(duration: 600.ms, delay: 200.ms),
            ],
          ),
          const SizedBox(height: 80),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: _skills.asMap().entries.map((entry) {
              final index = entry.key;
              final skill = entry.value;
              return _buildSkillCard(
                icon: skill['icon'],
                name: skill['name'],
                delay: (index * 50).ms,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard({
    required IconData icon,
    required String name,
    required Duration delay,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: AppColors.glass,
          border: Border.all(color: AppColors.glassBorder),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
              ).createShader(bounds),
              child: FaIcon(
                icon,
                size: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: GoogleFonts.orbitron(
                fontSize: 13,
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ).animate().scale(
      duration: 500.ms,
      delay: delay,
      begin: const Offset(0.8, 0.8),
      end: const Offset(1.0, 1.0),
    );
  }

  double _clamp(BuildContext context, double min, double max, double fraction) {
    final width = MediaQuery.of(context).size.width;
    final value = width * fraction;
    if (value < min) return min;
    if (value > max) return max;
    return value;
  }
}