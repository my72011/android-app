// ============================================================
// lib/widgets/timeline_section.dart
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class TimelineSection extends StatelessWidget {
  const TimelineSection({super.key});

  final List<Map<String, String>> _timelineItems = const [
    {
      'year': 'STAGE 01',
      'title': 'Started Learning',
      'desc': 'First lines of code. The spark that ignited a lifelong passion for building digital worlds.',
    },
    {
      'year': 'STAGE 02',
      'title': 'First Website',
      'desc': 'Shipped my first complete project. The thrill of seeing ideas come alive on the web.',
    },
    {
      'year': 'STAGE 03',
      'title': 'Advanced Design',
      'desc': 'Mastered UI/UX principles. Learned that great code deserves great design.',
    },
    {
      'year': 'STAGE 04',
      'title': 'Interactive Development',
      'desc': 'Dove deep into GSAP, Three.js and WebGL. Websites became experiences.',
    },
    {
      'year': 'STAGE 05',
      'title': 'Creative Projects',
      'desc': 'Built award-worthy portfolios and immersive digital showcases.',
    },
    {
      'year': 'STAGE 06',
      'title': 'Future Vision',
      'desc': 'Pushing boundaries with AI, spatial computing and the next web.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 968;
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
                  'JOURNEY',
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
                  'My Path',
                  style: GoogleFonts.orbitron(
                    fontSize: titleSize,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1,
                  ),
                ),
              ).animate().fadeUp(duration: 600.ms, delay: 100.ms),
              const SizedBox(height: 15),
              Text(
                'Milestones that shaped my craft.',
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
          SizedBox(
            width: 900,
            child: Stack(
              children: [
                Positioned(
                  left: isMobile ? 20 : 450,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 2,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.secondary],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.5),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                ..._timelineItems.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  if (isMobile) {
                    return _buildMobileTimelineItem(
                      item: item,
                      index: index,
                    );
                  } else {
                    return _buildDesktopTimelineItem(
                      item: item,
                      index: index,
                      isLeft: index % 2 == 0,
                    );
                  }
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopTimelineItem({
    required Map<String, String> item,
    required int index,
    required bool isLeft,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 30),
              child: isLeft ? _buildTimelineCard(item) : const SizedBox(),
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.bg, width: 2),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.5),
                  blurRadius: 20,
                ),
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 40,
                ),
              ],
            ),
          ).animate().scale(
            duration: 500.ms,
            delay: (index * 100).ms,
            begin: const Offset(0.5, 0.5),
            end: const Offset(1.0, 1.0),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 30),
              child: !isLeft ? _buildTimelineCard(item) : const SizedBox(),
            ),
          ),
        ],
      ),
    ).animate().fadeUp(
      duration: 600.ms,
      delay: (index * 150).ms,
    );
  }

  Widget _buildMobileTimelineItem({
    required Map<String, String> item,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, bottom: 20),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.bg, width: 2),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.5),
                  blurRadius: 20,
                ),
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 40,
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: _buildTimelineCard(item),
          ),
        ],
      ),
    ).animate().fadeRight(
      duration: 600.ms,
      delay: (index * 150).ms,
    );
  }

  Widget _buildTimelineCard(Map<String, String> item) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.glass,
        border: Border.all(color: AppColors.glassBorder),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item['year']!,
            style: GoogleFonts.orbitron(
              fontSize: 14,
              letterSpacing: 3,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item['title']!,
            style: GoogleFonts.orbitron(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            item['desc']!,
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ],
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