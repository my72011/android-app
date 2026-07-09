// ============================================================
// lib/screens/project_egypt.dart
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class EgyptExplorerScreen extends StatelessWidget {
  const EgyptExplorerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final titleSize = isMobile ? 50.0 : _clamp(context, 50, 140, 0.1);
    final subSize = isMobile ? 13.0 : _clamp(context, 13, 18, 0.018);

    return Scaffold(
      backgroundColor: const Color(0xFF0A0604),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.bottomCenter,
                radius: 1.5,
                colors: [Color(0xFFD97706), Color(0xFF7C2D12), Color(0xFF0A0604)],
                stops: [0.0, 0.3, 0.8],
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
                        '𓂀 EGYPT',
                        style: GoogleFonts.cinzel(
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                          letterSpacing: 4,
                          color: const Color(0xFFFBBF24),
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
                              color: const Color(0xFFFBBF24).withOpacity(0.1),
                              border: Border.all(color: const Color(0xFFFBBF24)),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.arrow_back, color: Color(0xFFFBBF24), size: 14),
                                const SizedBox(width: 8),
                                Text(
                                  'Back',
                                  style: GoogleFonts.orbitron(
                                    fontSize: 12,
                                    letterSpacing: 2,
                                    color: const Color(0xFFFBBF24),
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
                          color: const Color(0xFFFBBF24).withOpacity(0.1),
                          border: Border.all(color: const Color(0xFFFBBF24)),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          '𓂀 ANCIENT • FUTURE',
                          style: GoogleFonts.orbitron(
                            fontSize: 11,
                            letterSpacing: 4,
                            color: const Color(0xFFFBBF24),
                          ),
                        ),
                      ).animate().fadeDown(duration: 600.ms),
                      const SizedBox(height: 20),
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Color(0xFFFBBF24), Color(0xFFFEF3C7), Color(0xFFD97706)],
                        ).createShader(bounds),
                        child: Text(
                          'Egypt Explorer',
                          style: GoogleFonts.cinzel(
                            fontWeight: FontWeight.w900,
                            fontSize: titleSize,
                            height: 1.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ).animate().scale(
                        duration: 800.ms,
                        begin: const Offset(0.8, 0.8),
                        end: const Offset(1.0, 1.0),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'WHERE HISTORY MEETS TOMORROW',
                        style: GoogleFonts.orbitron(
                          fontSize: subSize,
                          letterSpacing: 8,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ).animate().fadeUp(duration: 600.ms, delay: 100.ms),
                      const SizedBox(height: 40),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => _launchUrl('https://egypt.edgeone.app'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFFBBF24), Color(0xFFD97706)],
                              ),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFFBBF24).withOpacity(0.4),
                                  blurRadius: 40,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.compass_calibration, color: Color(0xFF0A0604)),
                                const SizedBox(width: 12),
                                Text(
                                  'BEGIN JOURNEY',
                                  style: GoogleFonts.orbitron(
                                    fontSize: 13,
                                    letterSpacing: 3,
                                    color: const Color(0xFF0A0604),
                                    fontWeight: FontWeight.w700,
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
                    title: 'The Eternal Land',
                    desc: 'Step into a digital portal where 5000 years of civilization merge with futuristic vision.',
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(45),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBBF24).withOpacity(0.04),
                      border: Border.all(color: const Color(0xFFFBBF24).withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'A Timeless Voyage',
                          style: GoogleFonts.cinzel(
                            fontSize: 32,
                            color: const Color(0xFFFBBF24),
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Egypt Explorer is an immersive digital journey through the land of pharaohs, pyramids and eternal wonders. Every scroll unveils a new chapter of history.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16,
                            height: 1.8,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Blending ancient aesthetics with modern web technologies, the experience feels like walking through a holographic museum — where hieroglyphics glow with neon light.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16,
                            height: 1.8,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'From the golden sands of Giza to the temples of Luxor, discover Egypt like never before.',
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
                    title: 'Treasures Within',
                    desc: 'Discover the pillars of this legendary experience.',
                  ),
                  const SizedBox(height: 40),
                  Wrap(
                    spacing: 25,
                    runSpacing: 25,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildFeatureCard(
                        icon: FontAwesomeIcons.monument,
                        title: 'Landmarks',
                        desc: 'Explore iconic sites from Giza to Abu Simbel in stunning detail.',
                      ),
                      _buildFeatureCard(
                        icon: FontAwesomeIcons.scroll,
                        title: 'History',
                        desc: 'Journey through dynasties and uncover stories carved in stone.',
                      ),
                      _buildFeatureCard(
                        icon: FontAwesomeIcons.masksTheater,
                        title: 'Culture',
                        desc: 'Immerse in the traditions, art and spirit of Egyptian civilization.',
                      ),
                      _buildFeatureCard(
                        icon: FontAwesomeIcons.hierarchy,
                        title: 'Hieroglyphics',
                        desc: 'Decode the sacred writings that shaped human history.',
                      ),
                      _buildFeatureCard(
                        icon: FontAwesomeIcons.wandMagicSparkles,
                        title: 'Holograms',
                        desc: 'Futuristic visual effects bring ancient wonders to life.',
                      ),
                      _buildFeatureCard(
                        icon: FontAwesomeIcons.bolt,
                        title: 'Interactive',
                        desc: 'Engage with timelines, maps and 3D artifacts at your pace.',
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  _buildSectionHeader(
                    context,
                    tag: 'TIMELINE',
                    title: 'Ages of Wonder',
                    desc: 'Milestones across millennia.',
                  ),
                  const SizedBox(height: 40),
                  Wrap(
                    spacing: 25,
                    runSpacing: 25,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildEraCard(
                        icon: '👑',
                        year: '3100 BC',
                        title: 'Unification',
                        desc: 'Upper and Lower Egypt unite under the first pharaoh, beginning a glorious era.',
                      ),
                      _buildEraCard(
                        icon: '🔺',
                        year: '2560 BC',
                        title: 'Great Pyramid',
                        desc: 'The Great Pyramid of Giza rises — a marvel that stands for eternity.',
                      ),
                      _buildEraCard(
                        icon: '⚱️',
                        year: '1332 BC',
                        title: 'Tutankhamun',
                        desc: 'The boy king rules, leaving behind treasures that captivate the world.',
                      ),
                      _buildEraCard(
                        icon: '🏛️',
                        year: '30 BC',
                        title: 'Cleopatra Era',
                        desc: 'The last pharaoh\'s reign marks the end of an ancient dynasty.',
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  Container(
                    padding: const EdgeInsets.all(70),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFBBF24), Color(0xFFD97706), Color(0xFF7C2D12)],
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFBBF24).withOpacity(0.4),
                          blurRadius: 80,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Begin Your Journey',
                          style: GoogleFonts.cinzel(
                            fontWeight: FontWeight.w900,
                            fontSize: isMobile ? 32 : _clamp(context, 32, 56, 0.05),
                            color: const Color(0xFF0A0604),
                            letterSpacing: 3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Step into the land of pharaohs — live on the official website.',
                          style: TextStyle(
                            color: const Color(0xFF0A0604).withOpacity(0.8),
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => _launchUrl('https://egypt.edgeone.app'),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0A0604),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.compass_calibration, color: Color(0xFFFBBF24)),
                                  const SizedBox(width: 12),
                                  Text(
                                    'ENTER EGYPT',
                                    style: GoogleFonts.orbitron(
                                      fontSize: 13,
                                      letterSpacing: 3,
                                      color: const Color(0xFFFBBF24),
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
                        top: BorderSide(color: const Color(0xFFFBBF24).withOpacity(0.2)),
                      ),
                    ),
                    child: Text(
                      '© 2026 Egypt Explorer — Designed & Developed by Mostafa Yasser',
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
            border: Border.all(color: const Color(0xFFFBBF24).withOpacity(0.3)),
            borderRadius: BorderRadius.circular(100),
            color: const Color(0xFFFBBF24).withOpacity(0.1),
          ),
          child: Text(
            tag,
            style: GoogleFonts.orbitron(
              fontSize: 11,
              letterSpacing: 3,
              color: const Color(0xFFFBBF24),
            ),
          ),
        ),
        const SizedBox(height: 15),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFFBBF24), Color(0xFFFEF3C7)],
          ).createShader(bounds),
          child: Text(
            title,
            style: GoogleFonts.cinzel(
              fontWeight: FontWeight.w900,
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
        color: const Color(0xFFFBBF24).withOpacity(0.04),
        border: Border.all(color: const Color(0xFFFBBF24).withOpacity(0.15)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFFFBBF24), Color(0xFFFEF3C7)],
            ).createShader(bounds),
            child: FaIcon(icon, size: 48),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: GoogleFonts.cinzel(
              fontSize: 18,
              color: const Color(0xFFFBBF24),
              letterSpacing: 1,
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

  Widget _buildEraCard({
    required String icon,
    required String year,
    required String title,
    required String desc,
  }) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(35),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0x14FBBF24), Color(0x1A7C2D12)],
        ),
        border: Border.all(color: const Color(0xFFFBBF24).withOpacity(0.2)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(icon, style: const TextStyle(fontSize: 50)),
          const SizedBox(height: 15),
          Text(
            year,
            style: GoogleFonts.orbitron(
              fontSize: 12,
              letterSpacing: 3,
              color: const Color(0xFFFBBF24),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.cinzel(
              fontSize: 20,
              color: const Color(0xFFFEF3C7),
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