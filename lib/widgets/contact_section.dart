import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/constants.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  final List<Map<String, dynamic>> _contacts = const [
    {
      'icon': FontAwesomeIcons.github,
      'label': 'GitHub',
      'url': 'https://github.com/my72011',
      'color': null,
    },
    {
      'icon': FontAwesomeIcons.linkedin,
      'label': 'LinkedIn',
      'url': 'https://www.linkedin.com/in/mostafa-yasser-2636b1392',
      'color': null,
    },
    {
      'icon': FontAwesomeIcons.envelope,
      'label': 'Email',
      'url': 'mailto:mostafayasser0859@gmail.com',
      'color': null,
    },
    {
      'icon': FontAwesomeIcons.xTwitter,
      'label': 'Twitter',
      'url': 'https://x.com/Yas39500Mostafa',
      'color': null,
    },
    {
      'icon': FontAwesomeIcons.instagram,
      'label': 'Instagram',
      'url': 'https://www.instagram.com/mostafa_elbihary77',
      'color': null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 80 : 120,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900),
          padding: EdgeInsets.all(isMobile ? 25 : 70),
          decoration: BoxDecoration(
            color: AppColors.glass,
            border: Border.all(color: AppColors.glassBorder),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.primary.withOpacity(0.05),
                ),
                child: Text(
                  'Get In Touch',
                  style: GoogleFonts.orbitron(
                    fontSize: 12,
                    letterSpacing: 4,
                    color: AppColors.primary,
                    textTransform: 'uppercase',
                  ),
                ),
              ).animate().fadeUp(duration: 600.ms),

              const SizedBox(height: 15),

              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.white, AppColors.primary, AppColors.secondary],
                ).createShader(bounds),
                child: Text(
                  "Let's Build\nSomething Epic",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.orbitron(
                    fontSize: isMobile ? 32 : clamp(32, 56, 0.05),
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),
              ).animate().fadeUp(duration: 600.ms, delay: 100.ms),

              const SizedBox(height: 15),

              Text(
                'Mostafa Yasser — Developer • Designer • Creator',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeUp(duration: 600.ms, delay: 200.ms),

              const SizedBox(height: 40),

              // Contact buttons
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: _contacts.map((contact) {
                  return _buildContactButton(
                    icon: contact['icon'],
                    label: contact['label'],
                    url: contact['url'],
                  );
                }).toList(),
              ).animate().fadeUp(duration: 600.ms, delay: 300.ms),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactButton({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.04),
            border: Border.all(color: AppColors.glassBorder),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                icon,
                color: AppColors.primary,
                size: 18,
              ),
              const SizedBox(width: 12),
              Text(
                label,
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
    );
  }

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  double clamp(double min, double max, double fraction) {
    final width = MediaQuery.of(WidgetsBinding.instance.context).size.width;
    final value = width * fraction;
    if (value < min) return min;
    if (value > max) return max;
    return value;
  }
}
