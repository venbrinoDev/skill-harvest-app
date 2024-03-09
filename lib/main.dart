import 'package:flutter/material.dart';
import 'package:skill_harvest_app/splash_screen.dart';

void main() {
  runApp(const SkillHarvestApp());
}

class SkillHarvestApp extends StatelessWidget {
  const SkillHarvestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            primary: Colors.white,
            secondary: Colors.blue),
        useMaterial3: true,
      ),
      home: const SplahScreen(),
    );
  }
}
