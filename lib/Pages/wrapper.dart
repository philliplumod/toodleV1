import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toddle/Pages/homepage.dart';
import 'package:toddle/Pages/profilepage.dart';
import 'package:toddle/controllers/wrapper_controller.dart';
import 'package:toddle/utilities/colors.dart';
import 'package:toddle/utilities/theme.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MyWrapper extends StatelessWidget {
  MyWrapper({super.key});

  final WrapperController controller = Get.put(WrapperController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: controller.animateTab,
        physics: const BouncingScrollPhysics(),
        controller: controller.pageController,
        children: const [
          HomePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Get.isDarkMode ? Colors.red : defaultColor[500],
        notchMargin: 10,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _bottomAppBarItem(
                    icon: Icons.home_rounded, label: 'Home', page: 0, context),
                _bottomAppBarItem(
                    icon: Icons.person_rounded,
                    label: 'Profile',
                    page: 1,
                    context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required IconData icon, required String label, required int page}) {
    return ZoomTapAnimation(
      onTap: () => controller.goToTab(page),
      child: Container(
        color: Colors.transparent,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(
            icon,
            color: controller.currentpage.value == page
                ? custombtnColor
                : nightColor,
          ),
          Text(
            label,
            style: textStyle.copyWith(
                color: controller.currentpage.value == page
                    ? custombtnColor
                    : nightColor),
          )
        ]),
      ),
    );
  }
}
