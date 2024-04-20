import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_harvest_app/apiPage/page.dart';





void main() {
  runApp(const ProviderScope(child: SkillHarvest()));
}

class SkillHarvest extends StatelessWidget {
  const SkillHarvest({super.key});

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
      home: const ApiPage(),
    );
  }





}
