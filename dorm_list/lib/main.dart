import 'package:dorm_list/dorms.dart';
import 'package:dorm_list/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dorm_list/pages/dormdetail_page.dart';
import 'package:dorm_list/splash_screen.dart';
import 'package:dorm_list/pages/registration_page.dart';
import 'package:dorm_list/pages/home_page.dart';
import 'package:dorm_list/pages/bookmark_page.dart';
import 'package:dorm_list/pages/booking_page.dart';
import 'package:dorm_list/pages/profile_page.dart';
import 'package:dorm_list/pages/dormdetail_page.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC18ITJIcmxMDNNr3CQifgDxF-P9EG_G-o",
            appId: "1:476998983836:web:08a91b5675b74abfcecd59",
            messagingSenderId: "476998983836",
            projectId: "kingkane-dhub"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
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
              fontSize: 18.0,
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
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
            ),
            bodyLarge: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 22.0,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(
          child: Login_Page(),
        ),
        //used to navigate between pages
        routes: {
          '/homepage': (context) => const HomePage(),
          '/dorm_detail': (context) => const DormDetailPage(),
          '/bookmark': (context) => const BookmarkPage(),
          '/profile': (context) => const ProfilePage(),
          '/booking': (context) => const BookingPage(),
          '/noneyet': (context) => const Placeholder(),
          '/registration': (context) => const Registration(),
          '/login': (context) => const Login_Page(),
        },
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  double preferredSize = 125;
  bool filterState = false;
  String bookmarkMsg = '';
  var filterChips = <String>[
    "Bunk bed",
    "Desk",
    "Air conditioner",
    "Refrigerator",
    "Microwave",
    "Washing machine",
    "Bathroom",
    "Kitchen",
    "Rooftop terrace",
    "Parking space",
    "Gym",
    "Surveillance camera",
  ];
  Dorm currentDorm = studios[0];
  List<Dorm> filteredDorms = [];
  List<String> tagList = [];
  List<bool> filterBool = [];
  List<Dorm> favorites = [];

  MyAppState() {
    filterBool = List<bool>.generate(filterChips.length, (index) => false);
  }

  List<Dorm> updateFilteredDorms(dormCategory) {
    if (tagList.isEmpty) {
      filteredDorms = dormCategory;
    } else {
      filteredDorms = dormCategory
          .where((dorm) => tagList.every((tag) => dorm.tags.contains(tag)))
          .toList();
    }
    return filteredDorms;
  }

  void toggleFilter() {
    filterState = !filterState;
    if (preferredSize == 125) {
      preferredSize = 175;
    } else {
      preferredSize = 125;
    }
    notifyListeners();
  }

  void pressedTag(tag) {
    if (tagList.contains(tag)) {
      tagList.remove(tag);
    } else {
      tagList.add(tag);
    }
    notifyListeners();
  }

  void pressedFavorite(dorm) {
    if (favorites.contains(dorm)) {
      favorites.remove(dorm);
      bookmarkMsg = 'Removed from bookmarks';
    } else {
      favorites.add(dorm);
      bookmarkMsg = 'Added to bookmarks';
    }
    notifyListeners();
  }

  bool isBookmarked(dorm) {
    return favorites.contains(dorm) ? true : false;
  }
}
