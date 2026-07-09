// ============================================================
// lib/widgets/navigation.dart
// ============================================================
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/constants.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  bool _isScrolled = false;
  bool _isMenuOpen = false;

  final List<Map<String, String>> _navItems = [
    {'label': 'Home', 'anchor': '#hero'},
    {'label': 'About', 'anchor': '#about'},
    {'label': 'Skills', 'anchor': '#skills'},
    {'label': 'Projects', 'anchor': '#projects'},
    {'label': 'Journey', 'anchor': '#timeline'},
    {'label': 'Contact', 'anchor': '#contact'},
  ];

  void _scrollToSection(String anchor) {
    // Scroll handled by parent via global keys - just close menu
    setState(() {
      _isMenuOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 968;
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          final scrolled = notification.metrics.pixels > 50;
          if (scrolled != _isScrolled) {
            setState(() {
              _isScrolled = scrolled;
            });
          }
        }
        return false;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        decoration: BoxDecoration(
          color: _isScrolled
              ? AppColors.bg.withOpacity(0.85)
              : AppColors.bg.withOpacity(0.6),
          border: Border(
            bottom: BorderSide(
              color: AppColors.glassBorder,
              width: 1,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                  ).createShader(bounds),
                  child: Text(
                    'MY.',
                    style: GoogleFonts.orbitron(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                const Spacer(),
                if (!isMobile)
                  ..._navItems.map((item) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17.5),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => _scrollToSection(item['anchor']!),
                            child: Column(
                              children: [
                                Text(
                                  item['label']!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  width: 0,
                                  color: const LinearGradient(
                                    colors: [AppColors.primary, AppColors.secondary],
                                  ).createShader(
                                    const Rect.fromLTWH(0, 0, 100, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                if (isMobile)
                  IconButton(
                    icon: FaIcon(
                      _isMenuOpen ? FontAwesomeIcons.xmark : FontAwesomeIcons.bars,
                      color: AppColors.primary,
                      size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        _isMenuOpen = !_isMenuOpen;
                      });
                    },
                  ),
              ],
            ),
            if (_isMenuOpen && isMobile)
              Column(
                children: _navItems.map((item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          _scrollToSection(item['anchor']!);
                        },
                        child: Text(
                          item['label']!,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )).toList(),
              ),
          ],
        ),
      ),
    );
  }
}