// ============================================================
// lib/screens/home_screen.dart
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/loader.dart';
import '../widgets/cursor.dart';
import '../widgets/navigation.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/timeline_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';
import '../widgets/back_to_top.dart';
import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool _showLoader = true;
  double _loaderProgress = 0.0;
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _simulateLoader();
    _scrollController.addListener(_onScroll);
  }

  void _simulateLoader() {
    double progress = 0.0;
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 120));
      progress += (5 + (10 * (1 - progress / 100)));
      if (progress >= 100) {
        progress = 100;
        setState(() {
          _loaderProgress = progress;
        });
        await Future.delayed(const Duration(milliseconds: 400));
        setState(() {
          _showLoader = false;
        });
        return false;
      }
      setState(() {
        _loaderProgress = progress;
      });
      return true;
    });
  }

  void _onScroll() {
    final show = _scrollController.offset > 500;
    if (show != _showBackToTop) {
      setState(() {
        _showBackToTop = show;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          // Main content with scroll
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const HeroSection(),
                const AboutSection(),
                const SkillsSection(),
                const ProjectsSection(),
                const TimelineSection(),
                const ContactSection(),
                const FooterSection(),
              ],
            ),
          ),

          // Fixed elements
          const NavigationBarWidget(),
          if (_showBackToTop)
            BackToTopButton(
              onTap: _scrollToTop,
            ),

          // Custom cursor (desktop only)
          const CustomCursor(),

          // Loader overlay
          if (_showLoader)
            LoaderWidget(
              progress: _loaderProgress,
            ),
        ],
      ),
    );
  }
}