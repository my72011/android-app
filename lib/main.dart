// ============================================================
// lib/main.dart
// ============================================================
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'screens/project_dars.dart';
import 'screens/project_egypt.dart';
import 'screens/project_space.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mostafa Yasser — Developer • Designer • Creator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00E5FF),
          secondary: Color(0xFF8B5CF6),
          surface: Color(0xFF050505),
        ),
        scaffoldBackgroundColor: const Color(0xFF050505),
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const HomeScreen(),
      routes: {
        '/project/dars': (context) => const DarsIceCreamScreen(),
        '/project/egypt': (context) => const EgyptExplorerScreen(),
        '/project/space': (context) => const SpaceCommandScreen(),
      },
    );
  }
}