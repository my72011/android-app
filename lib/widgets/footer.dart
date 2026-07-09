import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/constants.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  final List<Map<String, String>> _socials = const [
    {'icon': 'github', 'url': 'https://github.com/my72011'},
    {'icon': 'linkedin', 'url': 'https://www.linkedin.com/in/mostafa-yasser-2636b1392'},
    {'icon': 'x-twitter', 'url': 'https://x.com/Yas39500Mostafa'},
    {'icon': 'instagram', 'url': 'https://www.instagram.com/mostafa_elbihary77'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      decoration: BoxDecoration(
        color: AppColors.bg2,
        border: Border(
          top: BorderSide(color: AppColors.glassBorder),
        ),
      ),
      child: Column(
        children: [
          // Logo
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
            ).createShader(bounds),
            child: Text(
              'MY.',
              style: GoogleFonts.orbitron(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Socials
          Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: _socials.map((social) {
              return _buildSocialButton(
                icon: social['icon']!,
                url: social['url']!,
              );
            }).toList(),
          ),

          const SizedBox(height: 30),

          // Copyright
          Container(
            padding: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.glassBorder),
              ),
            ),
            child: Text(
              '© 2026 MOSTAFA YASSER — ALL RIGHTS RESERVED',
              style: GoogleFonts.orbitron(
                fontSize: 13,
                letterSpacing: 2,
                color: AppColors.muted,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required String icon,
    required String url,
  }) {
    IconData? iconData;
    switch (icon) {
      case 'github':
        iconData = FontAwesomeIcons.github;
        break;
      case 'linkedin':
        iconData = FontAwesomeIcons.linkedin;
        break;
      case 'x-twitter':
        iconData = FontAwesomeIcons.xTwitter;
        break;
      case 'instagram':
        iconData = FontAwesomeIcons.instagram;
        break;
      default:
        iconData = FontAwesomeIcons.link;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.glass,
            border: Border.all(color: AppColors.glassBorder),
            shape: BoxShape.circle,
          ),
          child: FaIcon(
            iconData,
            size: 16,
            color: Colors.white,
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
}
