import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toddle/Pages/homepage.dart';
import 'package:toddle/Pages/profilepage.dart';
import 'package:toddle/Pages/taskbar.dart';
import 'package:toddle/controllers/task_controller.dart';
import 'package:toddle/controllers/wrapper_controller.dart';
import 'package:toddle/utilities/colors.dart';
import 'package:toddle/utilities/theme.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MyWrapper extends StatelessWidget {
  MyWrapper({super.key});

  final WrapperController controller = Get.find<WrapperController>();
  final _taskController = Get.put(TaskController());

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
      floatingActionButton: SizedBox(
        width: 70.0,
        height: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () async {
              await Get.to(() => const AddTask());
              _taskController.getTask();
            },
            backgroundColor: custombtnColor,
            child: Icon(
              Icons.add,
              color: defaultColor,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
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
                ? custombtnColor[800]
                : Get.isDarkMode
                    ? nightColor
                    : nightColor ,
          ),
          Text(
            label,
            style: textStyle.copyWith(
                color: controller.currentpage.value == page
                    ? custombtnColor[800]
                    : Get.isDarkMode
                        ? nightColor
                        : nightColor),
          )
        ]),
      ),
    );
  }
}
