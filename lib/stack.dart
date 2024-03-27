import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:skill_harvest_app/utils/app_image.dart';

class MyStackWidget extends StatelessWidget {
  const MyStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: 3,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return const PlaceCard();
                    },
                  ),
                ),
                const Gap(20),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return const PlaceCard();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Gap(10);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: const Color(0xFFCEECFE),
          borderRadius: BorderRadius.circular(20)),
      height: 170,
      width: 300,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(AppImage.hand, height: 150)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'What do you want to learn\ntoday?',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.orange[800]),
                    onPressed: () {},
                    child: LinearProgressIndicator(
                      value: 0.7,
                      backgroundColor: Colors.white,
                      valueColor: const AlwaysStoppedAnimation(Colors.blue),
                      borderRadius: BorderRadius.circular(5),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
