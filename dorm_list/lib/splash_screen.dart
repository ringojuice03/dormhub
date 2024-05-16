import 'package:dorm_list/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );

  late final animation = Tween(
    begin: 0.0,
    end: 1.0,
  ).animate(animationController);

  void navigator() async {
    await Future.delayed(const Duration(seconds: 5), (){});

    if(!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget.child!), 
        (route) => false
    );
  }

  @override
  void initState() {
    animationController.forward();
    navigator();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: animation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'dormhub',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                'Never again to stressful dorm-hunting!',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}