/*
Authored by: Kane Beringuela
Company: N/A
Project: DormHub

Feature: [DHUB-001] Dorm List
Description: Display a list of dorms.
*/

import 'package:dorm_list/pages/dormdetail_page.dart';
import 'package:dorm_list/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:dorm_list/pages/home_page.dart';
import 'package:dorm_list/pages/bookmark_page.dart';
import 'package:dorm_list/pages/booking_page.dart';
import 'package:dorm_list/pages/profile_page.dart';
import 'package:dorm_list/pages/dormdetail_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'dormhub',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF474747)),
        textTheme: TextTheme(
          displaySmall: GoogleFonts.inter(
            fontStyle: FontStyle.italic,
            fontSize: 12.0,
          ),
          displayMedium: GoogleFonts.inter(
            fontWeight: FontWeight.w900,
            fontSize: 24.0,
          ),
          displayLarge: GoogleFonts.inter(
            fontWeight: FontWeight.w900,
            fontSize: 48.0,
          ),
          bodySmall: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 12.0,
          ),
          bodyMedium: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      //used to navigate between pages
      routes: {
        '/homepage': (context) => const HomePage(),
        '/dorm_detail': (context) => const DormDetailPage(),
        '/bookmark': (context) => const BookmarkPage(),
        '/profile': (context) => const ProfilePage(),
        '/booking': (context) => const BookingPage(),
        '/noneyet': (context) => const Placeholder(),
      },
    );
  }
}
