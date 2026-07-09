// ============================================================
// lib/screens/home_screen.dart
// ============================================================
import 'package:flutter/material.dart';
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

class _HomeScreenState extends State<HomeScreen> {
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

  Future<void> _simulateLoader() async {
    double progress = 0.0;
    while (progress < 100) {
      await Future.delayed(const Duration(milliseconds: 120));
      progress += (5 + (10 * (1 - progress / 100)));
      if (progress > 100) progress = 100;
      
      if (mounted) {
        setState(() {
          _loaderProgress = progress;
        });
      }
    }
    
    await Future.delayed(const Duration(milliseconds: 400));
    if (mounted) {
      setState(() {
        _showLoader = false;
      });
    }
  }

  void _onScroll() {
    final show = _scrollController.offset > 500;
    if (show != _showBackToTop && mounted) {
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
            child: const Column(
              children: [
                HeroSection(),
                AboutSection(),
                SkillsSection(),
                ProjectsSection(),
                TimelineSection(),
                ContactSection(),
                FooterSection(),
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