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

  @override
  void initState() {
    super.initState();
    // Listen to scroll events from the parent
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // We'll use a scroll listener via NotificationListener
    });
  }

  void _scrollToSection(String anchor) {
    // Find the section by key
    final context = Navigator.of(this.context).context;
    // We'll use a different approach - scroll to the section using the global key
    // For now, we'll use a simple approach with scroll controller
    // The actual scrolling is handled by the parent
    setState(() {
      _isMenuOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        child: Row(
          children: [
            // Logo
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

            // Desktop navigation
            if (MediaQuery.of(context).size.width > 968)
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

            // Mobile menu toggle
            if (MediaQuery.of(context).size.width <= 968)
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
        // Mobile menu dropdown
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
                if (MediaQuery.of(context).size.width <= 968)
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
            if (_isMenuOpen && MediaQuery.of(context).size.width <= 968)
              Column(
                children: _navItems.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      _scrollToSection(item['anchor']!);
                      setState(() {
                        _isMenuOpen = false;
                      });
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
