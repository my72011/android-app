import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/constants.dart';

class SpaceCommandScreen extends StatelessWidget {
  const SpaceCommandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.0,
                colors: [Color(0xFF08111F), Color(0xFF050505)],
                stops: [0.0, 1.0],
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 20 : 40,
              ),
              child: Column(
                children: [
                  // Header
                  Row(
                    children: [
                      Text(
                        'SPACE CMD',
                        style: GoogleFonts.orbitron(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          letterSpacing: 4,
                          color: const Color(0xFF00E5FF),
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
                              color: const Color(0xFF00E5FF).withOpacity(0.08),
                              border: Border.all(color: const Color(0xFF00E5FF)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.arrow_back, color: Color(0xFF00E5FF), size: 14),
                                const SizedBox(width: 8),
                                Text(
                                  'Back',
                                  style: GoogleFonts.orbitron(
                                    fontSize: 11,
                                    letterSpacing: 3,
                                    color: const Color(0xFF00E5FF),
                                    textTransform: 'uppercase',
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

                  // Hero
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00E5FF).withOpacity(0.08),
                          border: Border.all(color: const Color(0xFF00E5FF)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: const Color(0xFF00FF88),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF00FF88).withOpacity(0.6),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'MISSION ACTIVE',
                              style: GoogleFonts.orbitron(
                                fontSize: 11,
                                letterSpacing: 4,
                                color: const Color(0xFF00E5FF),
                                textTransform: 'uppercase',
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeDown(duration: 600.ms),

                      const SizedBox(height: 20),

                      Column(
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [Colors.white, Color(0xFF00E5FF)],
                            ).createShader(bounds),
                            child: Text(
                              'SPACE',
                              style: GoogleFonts.orbitron(
                                fontWeight: FontWeight.w900,
                                fontSize: isMobile ? 60 : clamp(60, 160, 0.12),
                                height: 0.9,
                                letterSpacing: -2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [Color(0xFF00E5FF), Color(0xFF8B5CF6)],
                            ).createShader(bounds),
                            child: Text(
                              'COMMAND',
                              style: GoogleFonts.orbitron(
                                fontWeight: FontWeight.w900,
                                fontSize: isMobile ? 60 : clamp(60, 160, 0.12),
                                height: 0.9,
                                letterSpacing: -2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ).animate().scale(
                        duration: 800.ms,
                        begin: const Offset(0.8, 0.8),
                        end: const Offset(1.0, 1.0),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Mission Control Interface v2.0',
                        style: GoogleFonts.shareTechMono(
                          fontSize: isMobile ? 13 : clamp(13, 18, 0.016),
                          letterSpacing: 8,
                          color: const Color(0xFF94A3B8),
                          textTransform: 'uppercase',
                        ),
                      ).animate().fadeUp(duration: 600.ms, delay: 100.ms),

                      const SizedBox(height: 40),

                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => _launchUrl('https://spacecommand.edgeone.app'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 18),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF00E5FF), Color(0xFF8B5CF6)],
                              ),
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF00E5FF).withOpacity(0.4),
                                  blurRadius: 40,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.rocket, color: Color(0xFF050505), size: 18),
                                const SizedBox(width: 12),
                                Text(
                                  'Launch Mission',
                                  style: GoogleFonts.orbitron(
                                    fontSize: 12,
                                    letterSpacing: 4,
                                    color: const Color(0xFF050505),
                                    fontWeight: FontWeight.w700,
                                    textTransform: 'uppercase',
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

                  // Overview
                  _buildSectionHeader(
                    tag: 'Mission Brief',
                    title: 'Command Overview',
                    desc: 'A deep-space mission control interface built for the next frontier.',
                  ),

                  const SizedBox(height: 40),

                  Container(
                    padding: const EdgeInsets.all(45),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00E5FF).withOpacity(0.03),
                      border: Border.all(color: const Color(0xFF00E5FF).withOpacity(0.15)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The Interface',
                          style: GoogleFonts.orbitron(
                            fontSize: 24,
                            color: const Color(0xFF00E5FF),
                            letterSpacing: 3,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Space Command is a futuristic mission control dashboard — a digital cockpit where data, telemetry and cosmic visuals converge into a single commanding experience.',
                          style: TextStyle(
                            color: const Color(0xFF94A3B8),
                            fontSize: 15,
                            height: 1.8,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Every element is engineered with precision: radar sweeps, orbital paths, live telemetry, holographic displays. It feels like stepping onto the bridge of a starship.',
                          style: TextStyle(
                            color: const Color(0xFF94A3B8),
                            fontSize: 15,
                            height: 1.8,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Designed for those who dream beyond the atmosphere.',
                          style: TextStyle(
                            color: const Color(0xFF94A3B8),
                            fontSize: 15,
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 80),

                  // Features
                  _buildSectionHeader(
                    tag: 'Capabilities',
                    title: 'System Features',
                    desc: 'Core modules powering the command center.',
                  ),

                  const SizedBox(height: 40),

                  Wrap(
                    spacing: 25,
                    runSpacing: 25,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildFeatureCard(
                        num: '01',
                        icon: FontAwesomeIcons.satellite,
                        title: 'Satellite Tracking',
                        desc: 'Real-time orbital tracking with advanced radar visualization and target acquisition.',
                      ),
                      _buildFeatureCard(
                        num: '02',
                        icon: FontAwesomeIcons.earthAmericas,
                        title: '3D Planets',
                        desc: 'Interactive celestial bodies rendered in WebGL with realistic atmospheric effects.',
                      ),
                      _buildFeatureCard(
                        num: '03',
                        icon: FontAwesomeIcons.gaugeHigh,
                        title: 'Live Telemetry',
                        desc: 'Dynamic data streams with animated gauges and real-time system monitoring.',
                      ),
                      _buildFeatureCard(
                        num: '04',
                        icon: FontAwesomeIcons.towerBroadcast,
                        title: 'Radar System',
                        desc: 'Sweeping radar with target acquisition UI and threat detection capabilities.',
                      ),
                      _buildFeatureCard(
                        num: '05',
                        icon: FontAwesomeIcons.shieldHalved,
                        title: 'Defense Grid',
                        desc: 'Holographic shields and threat detection panels with automated response systems.',
                      ),
                      _buildFeatureCard(
                        num: '06',
                        icon: FontAwesomeIcons.rocket,
                        title: 'Mission Control',
                        desc: 'Launch sequences and countdown interfaces with precision timing systems.',
                      ),
                    ],
                  ),

                  const SizedBox(height: 80),

                  // Tech stack
                  _buildSectionHeader(
                    tag: 'Stack',
                    title: 'Technology',
                    desc: 'The systems powering this command center.',
                  ),

                  const SizedBox(height: 40),

                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildTechPill(icon: FontAwesomeIcons.html5, label: 'HTML5'),
                      _buildTechPill(icon: FontAwesomeIcons.css3Alt, label: 'CSS3'),
                      _buildTechPill(icon: FontAwesomeIcons.js, label: 'JavaScript'),
                      _buildTechPill(icon: FontAwesomeIcons.cube, label: 'Three.js'),
                      _buildTechPill(icon: FontAwesomeIcons.wandMagicSparkles, label: 'GSAP'),
                      _buildTechPill(icon: FontAwesomeIcons.chartLine, label: 'Canvas'),
                      _buildTechPill(icon: FontAwesomeIcons.mobileScreen, label: 'Responsive'),
                      _buildTechPill(icon: FontAwesomeIcons.bolt, label: 'Performance'),
                    ],
                  ),

                  const SizedBox(height: 80),

                  // CTA
                  Container(
                    padding: const EdgeInsets.all(70),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF00E5FF).withOpacity(0.08),
                          const Color(0xFF8B5CF6).withOpacity(0.08),
                        ],
                      ),
                      border: Border.all(color: const Color(0xFF00E5FF)),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF00E5FF).withOpacity(0.15),
                          blurRadius: 80,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'LAUNCH SEQUENCE',
                          style: GoogleFonts.orbitron(
                            fontWeight: FontWeight.w900,
                            fontSize: isMobile ? 32 : clamp(32, 56, 0.05),
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: [Colors.white, Color(0xFF00E5FF)],
                              ).createShader(const Rect.fromLTWH(0, 0, 400, 60)),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Enter the command center — live on the official website.',
                          style: TextStyle(
                            color: const Color(0xFF94A3B8),
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => _launchUrl('https://spacecommand.edgeone.app'),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 18),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF00E5FF), Color(0xFF8B5CF6)],
                                ),
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF00E5FF).withOpacity(0.4),
                                    blurRadius: 40,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.rocket, color: Color(0xFF050505)),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Launch Mission',
                                    style: GoogleFonts.orbitron(
                                      fontSize: 12,
                                      letterSpacing: 4,
                                      color: const Color(0xFF050505),
                                      fontWeight: FontWeight.w700,
                                      textTransform: 'uppercase',
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

                  // Footer
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: const Color(0xFF00E5FF).withOpacity(0.15)),
                      ),
                    ),
                    child: Text(
                      '© 2026 SPACE COMMAND — Designed & Developed by Mostafa Yasser',
                      style: TextStyle(
                        color: const Color(0xFF94A3B8),
                        fontSize: 12,
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

  Widget _buildSectionHeader({
    required String tag,
    required String title,
    required String desc,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF00E5FF).withOpacity(0.3)),
            borderRadius: BorderRadius.circular(4),
            color: const Color(0xFF00E5FF).withOpacity(0.08),
          ),
          child: Text(
            tag,
            style: GoogleFonts.orbitron(
              fontSize: 11,
              letterSpacing: 4,
              color: const Color(0xFF00E5FF),
              textTransform: 'uppercase',
            ),
          ),
        ),
        const SizedBox(height: 20),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.white, Color(0xFF00E5FF)],
          ).createShader(bounds),
          child: Text(
            title,
            style: GoogleFonts.orbitron(
              fontWeight: FontWeight.w800,
              fontSize: clamp(36, 72, 0.06),
              letterSpacing: -1,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          desc,
          style: TextStyle(
            color: const Color(0xFF94A3B8),
            fontSize: 16,
            height: 1.7,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFeatureCard({
    required String num,
    required IconData icon,
    required String title,
    required String desc,
  }) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFF00E5FF).withOpacity(0.03),
        border: Border.all(color: const Color(0xFF00E5FF).withOpacity(0.15)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            right: 20,
            child: Text(
              num,
              style: GoogleFonts.orbitron(
                fontSize: 12,
                color: const Color(0xFF00E5FF).withOpacity(0.3),
                letterSpacing: 2,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF00E5FF), Color(0xFF8B5CF6)],
                ).createShader(bounds),
                child: FaIcon(icon, size: 42),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: GoogleFonts.orbitron(
                  fontSize: 16,
                  color: const Color(0xFF00E5FF),
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                desc,
                style: TextStyle(
                  color: const Color(0xFF94A3B8),
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
            ],
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF00E5FF).withOpacity(0.05),
        border: Border.all(color: const Color(0xFF00E5FF).withOpacity(0.15)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(icon, size: 16, color: const Color(0xFF00E5FF)),
          const SizedBox(width: 10),
          Text(
            label,
            style: GoogleFonts.shareTechMono(
              fontSize: 12,
              letterSpacing: 2,
              color: const Color(0xFF00E5FF),
            ),
          ),
        ],
      ),
    );
  }

  double clamp(double min, double max, double fraction) {
    final width = WidgetsBinding.instance.window.physicalSize.width /
        WidgetsBinding.instance.window.devicePixelRatio;
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