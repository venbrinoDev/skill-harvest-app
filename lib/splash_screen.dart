import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:skill_harvest_app/core/util/assetsUtil/asset_util.dart';

class SplahScreen extends StatelessWidget {
  const SplahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontFamily: Assets.fontName,
                    ),
                  ),
                ),
                const Gap(30),
                SvgPicture.asset(
                  Assets.onboardingOne,
                  height: 200,
                  width: 200,
                ),
                const Gap(50),
                Text(
                  ' Numerous free\n'
                  'trial courses',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: Assets.fontName,
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
                const Gap(15),
                Text(
                  'Free courses for you to\n'
                  'find your way to learning',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: Assets.fontName,
                      fontWeight: FontWeight.w300,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
