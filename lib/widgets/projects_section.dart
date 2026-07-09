// ============================================================
// lib/widgets/projects_section.dart
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/constants.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, dynamic>> _projects = const [
    {
      'id': 'dars',
      'title': 'Dars Ice Cream',
      'tag': 'Ice Cream Galaxy',
      'desc': 'Modern ice cream experience with smooth animations and engaging interactions.',
      'icon': '🍦',
      'url': 'https://11223344.edgeone.app',
      'gradient': [Color(0xFFFF6EC4), Color(0xFF7873F5), Color(0xFF4ADE80)],
      'route': '/project/dars',
    },
    {
      'id': 'egypt',
      'title': 'Egypt Explorer',
      'tag': 'Ancient + Future',
      'desc': 'Interactive journey through Egyptian culture, landmarks and history.',
      'icon': '🏛️',
      'url': 'https://987654.edgeone.app',
      'gradient': [Color(0xFFFBBF24), Color(0xFFD97706), Color(0xFF7C2D12)],
      'route': '/project/egypt',
    },
    {
      'id': 'space',
      'title': 'Space Command',
      'tag': 'Mission Control',
      'desc': 'Advanced futuristic mission control interface for deep space operations.',
      'icon': '🚀',
      'url': 'https://987654321.edgeone.app',
      'gradient': [Color(0xFF00E5FF), Color(0xFF08111F), Color(0xFF8B5CF6)],
      'route': '/project/space',
    },
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
                  'PORTFOLIO',
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
                  'Featured Projects',
                  style: GoogleFonts.orbitron(
                    fontSize: titleSize,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1,
                  ),
                ),
              ).animate().fadeUp(duration: 600.ms, delay: 100.ms),
              const SizedBox(height: 15),
              Text(
                'Selected works crafted with passion and precision.',
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
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: _projects.asMap().entries.map((entry) {
              final index = entry.key;
              final project = entry.value;
              return SizedBox(
                width: isMobile ? double.infinity : 320,
                height: 520,
                child: _buildProjectCard(
                  project: project,
                  delay: (index * 150).ms,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard({
    required Map<String, dynamic> project,
    required Duration delay,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            WidgetsBinding.instance.context!,
            project['route'],
          );
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: project['gradient'] as List<Color>,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppColors.primary.withOpacity(0.15),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 130,
                right: 30,
                child: Text(
                  project['icon'],
                  style: const TextStyle(
                    fontSize: 160,
                    color: Color(0x40FFFFFF),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xF2FFFFFF),
                      Color(0xBF000000),
                      Color(0x4D000000),
                      Color(0x0D000000),
                    ],
                    stops: [0.0, 0.3, 0.6, 1.0],
                  ),
                ),
                padding: const EdgeInsets.all(35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.2),
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        project['tag'].toUpperCase(),
                        style: GoogleFonts.orbitron(
                          fontSize: 10,
                          letterSpacing: 2,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      project['title'],
                      style: GoogleFonts.orbitron(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      project['desc'],
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Text(
                          'VIEW PROJECT',
                          style: GoogleFonts.orbitron(
                            fontSize: 12,
                            letterSpacing: 2,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.arrow_forward,
                          color: AppColors.primary,
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ).animate().fadeUp(
        duration: 800.ms,
        delay: delay,
      ),
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