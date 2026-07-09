// ============================================================
// lib/screens/project_dars.dart
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DarsIceCreamScreen extends StatelessWidget {
  const DarsIceCreamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final titleSize = isMobile ? 50.0 : _clamp(context, 50, 140, 0.1);
    final subSize = isMobile ? 14.0 : _clamp(context, 14, 20, 0.02);

    return Scaffold(
      backgroundColor: const Color(0xFF1A0A2E),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topCenter,
                radius: 1.5,
                colors: [Color(0xFFFF6EC4), Color(0xFF7873F5), Color(0xFF1A0A2E)],
                stops: [0.0, 0.4, 1.0],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 20 : 40,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Dars 🍦',
                        style: GoogleFonts.pacifico(
                          fontSize: 26,
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: [Color(0xFFFF6EC4), Color(0xFF4ADE80)],
                            ).createShader(const Rect.fromLTWH(0, 0, 200, 30)),
                        ),
                      ),
                      const Spacer(),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              border: Border.all(color: Colors.white.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.arrow_back, size: 14, color: Colors.white),
                                const SizedBox(width: 8),
                                Text(
                                  'Back',
                                  style: GoogleFonts.orbitron(
                                    fontSize: 13,
                                    letterSpacing: 2,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          border: Border.all(color: Colors.white.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          '🍦 SWEET EXPERIENCE',
                          style: GoogleFonts.orbitron(
                            fontSize: 11,
                            letterSpacing: 3,
                            color: Colors.white,
                          ),
                        ),
                      ).animate().fadeDown(duration: 600.ms),
                      const SizedBox(height: 20),
                      Text(
                        'Dars Ice Cream',
                        style: GoogleFonts.pacifico(
                          fontSize: titleSize,
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: [Colors.white, Color(0xFFFEF3C7), Color(0xFFFF6EC4)],
                            ).createShader(const Rect.fromLTWH(0, 0, 400, 80)),
                        ),
                        textAlign: TextAlign.center,
                      ).animate().scale(
                        duration: 800.ms,
                        begin: const Offset(0.8, 0.8),
                        end: const Offset(1.0, 1.0),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'A TASTE OF DIGITAL MAGIC',
                        style: GoogleFonts.orbitron(
                          fontSize: subSize,
                          letterSpacing: 6,
                          color: Colors.white.withOpacity(0.85),
                        ),
                      ).animate().fadeUp(duration: 600.ms, delay: 100.ms),
                      const SizedBox(height: 40),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => _launchUrl('https://darasicecream.edgeone.app'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFFF6EC4), Color(0xFF7873F5)],
                              ),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFFF6EC4).withOpacity(0.5),
                                  blurRadius: 40,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.icecream, color: Colors.white),
                                const SizedBox(width: 12),
                                Text(
                                  'VISIT WEBSITE',
                                  style: GoogleFonts.orbitron(
                                    fontSize: 13,
                                    letterSpacing: 3,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).animate().fadeUp(duration: 600.ms, delay: 200.ms),
                    ],
                  ),
                  const SizedBox(height: 80),
                  _buildSectionHeader(
                    context,
                    tag: 'OVERVIEW',
                    title: 'Sweet Introduction',
                    desc: 'A delightful journey into the world of artisanal ice cream, reimagined through digital artistry.',
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(45),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The Vision',
                          style: GoogleFonts.pacifico(
                            fontSize: 32,
                            color: const Color(0xFFFF6EC4),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Dars Ice Cream is more than a website — it\'s a sensory experience. Every scroll reveals a new flavor, every interaction a sweet surprise.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16,
                            height: 1.8,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Built with modern web technologies, the site blends playful animations with premium design to create an unforgettable brand experience.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16,
                            height: 1.8,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'From creamy gradients to smooth transitions, every detail was crafted to evoke the joy of tasting your favorite dessert.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16,
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80),
                  _buildSectionHeader(
                    context,
                    tag: 'FEATURES',
                    title: 'What Makes It Sweet',
                    desc: 'Delightful details that make every bite (and scroll) memorable.',
                  ),
                  const SizedBox(height: 40),
                  Wrap(
                    spacing: 25,
                    runSpacing: 25,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildFeatureCard(
                        icon: FontAwesomeIcons.wandMagicSparkles,
                        title: 'Smooth Animations',
                        desc: 'GSAP-powered transitions that flow like melted chocolate.',
                      ),
                      _buildFeatureCard(
                        icon: FontAwesomeIcons.palette,
                        title: 'Creamy Gradients',
                        desc: 'Hand-crafted color palettes inspired by real ice cream flavors.',
                      ),
                      _buildFeatureCard(
                        icon: FontAwesomeIcons.mobileScreen,
                        title: 'Responsive Design',
                        desc: 'Perfectly delicious on every device, from phone to desktop.',
                      ),
                      _buildFeatureCard(
                        icon: FontAwesomeIcons.bolt,
                        title: 'Fast Performance',
                        desc: 'Lightning quick loading — no waiting for your treat.',
                      ),
                      _buildFeatureCard(
                        icon: FontAwesomeIcons.heart,
                        title: 'Engaging UX',
                        desc: 'Interactive elements that invite you to explore every flavor.',
                      ),
                      _buildFeatureCard(
                        icon: FontAwesomeIcons.star,
                        title: 'Premium Feel',
                        desc: 'Luxury aesthetics that elevate the ice cream experience.',
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  _buildSectionHeader(
                    context,
                    tag: 'STACK',
                    title: 'Technology',
                    desc: 'The tools that brought this sweet experience to life.',
                  ),
                  const SizedBox(height: 40),
                  Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildTechPill(icon: FontAwesomeIcons.html5, label: 'HTML5'),
                      _buildTechPill(icon: FontAwesomeIcons.css3Alt, label: 'CSS3'),
                      _buildTechPill(icon: FontAwesomeIcons.js, label: 'JavaScript'),
                      _buildTechPill(icon: FontAwesomeIcons.wandMagicSparkles, label: 'GSAP'),
                      _buildTechPill(icon: FontAwesomeIcons.cube, label: 'Three.js'),
                      _buildTechPill(icon: FontAwesomeIcons.mobileScreen, label: 'Responsive'),
                      _buildTechPill(icon: FontAwesomeIcons.palette, label: 'UI Design'),
                      _buildTechPill(icon: FontAwesomeIcons.bolt, label: 'Performance'),
                    ],
                  ),
                  const SizedBox(height: 80),
                  Container(
                    padding: const EdgeInsets.all(70),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF6EC4), Color(0xFF7873F5)],
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF6EC4).withOpacity(0.4),
                          blurRadius: 80,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Ready for a Taste?',
                          style: GoogleFonts.pacifico(
                            fontSize: isMobile ? 32 : _clamp(context, 32, 56, 0.05),
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Experience the sweetness live on the official website.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => _launchUrl('https://darasicecream.edgeone.app'),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A0A2E),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.open_in_new, color: Colors.white),
                                  const SizedBox(width: 12),
                                  Text(
                                    'VISIT WEBSITE',
                                    style: GoogleFonts.orbitron(
                                      fontSize: 13,
                                      letterSpacing: 3,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.white.withOpacity(0.1)),
                      ),
                    ),
                    child: Text(
                      '© 2026 Dars Ice Cream — Designed & Developed by Mostafa Yasser',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, {required String tag, required String title, required String desc}) {
    final titleSize = _clamp(context, 36, 72, 0.06);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFFF6EC4).withOpacity(0.3)),
            borderRadius: BorderRadius.circular(100),
            color: const Color(0xFFFF6EC4).withOpacity(0.15),
          ),
          child: Text(
            tag,
            style: GoogleFonts.orbitron(
              fontSize: 11,
              letterSpacing: 3,
              color: const Color(0xFFFF6EC4),
            ),
          ),
        ),
        const SizedBox(height: 15),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFFF6EC4), Color(0xFF4ADE80)],
          ).createShader(bounds),
          child: Text(
            title,
            style: GoogleFonts.pacifico(
              fontSize: titleSize,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          desc,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 16,
            height: 1.7,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String desc,
  }) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(35),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFFFF6EC4), Color(0xFF4ADE80)],
            ).createShader(bounds),
            child: FaIcon(icon, size: 48),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: GoogleFonts.orbitron(
              fontSize: 16,
              letterSpacing: 1,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            desc,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTechPill({
    required IconData icon,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(icon, size: 18, color: const Color(0xFFFF6EC4)),
          const SizedBox(width: 10),
          Text(
            label,
            style: GoogleFonts.orbitron(
              fontSize: 12,
              letterSpacing: 2,
              color: Colors.white,
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

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}