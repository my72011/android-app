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
  String? _hoveredItem;

  final List<Map<String, String>> _navItems = [
    {'label': 'Home', 'anchor': '#hero'},
    {'label': 'About', 'anchor': '#about'},
    {'label': 'Skills', 'anchor': '#skills'},
    {'label': 'Projects', 'anchor': '#projects'},
    {'label': 'Journey', 'anchor': '#timeline'},
    {'label': 'Contact', 'anchor': '#contact'},
  ];

  void _scrollToSection(String anchor) {
    setState(() {
      _isMenuOpen = false;
    });
    // Note: Actual scrolling logic should be handled via a ScrollController 
    // passed to this widget or using PrimaryScrollController in HomeScreen.
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width <= 968;
    
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
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
          mainAxisSize: MainAxisSize.min,
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
                      color: Colors.white, // Required for ShaderMask to show the gradient
                    ),
                  ),
                ),
                const Spacer(),
                if (!isMobile)
                  ..._navItems.map((item) => _buildNavItem(item)),
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
                mainAxisSize: MainAxisSize.min,
                children: _navItems.map((item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        onTap: () => _scrollToSection(item['anchor']!),
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

  Widget _buildNavItem(Map<String, String> item) {
    final label = item['label']!;
    final isHovered = _hoveredItem == label;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hoveredItem = label),
      onExit: (_) => setState(() => _hoveredItem = null),
      child: GestureDetector(
        onTap: () => _scrollToSection(item['anchor']!),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: isHovered ? 20 : 0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}