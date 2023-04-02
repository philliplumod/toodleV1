import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toddle/services/theme_services.dart';
import 'package:toddle/ui/popup.dart';
import 'package:intl/intl.dart';
import 'package:toddle/ui/taskbar.dart';
import 'package:toddle/ui/theme.dart';
import 'package:toddle/widgets/button.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

import '../controllers/task_controller.dart';
import '../models/task.dart';
import '../utilities/colors.dart';
import '../widgets/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _dateTimeline(),
          const SizedBox(height: 10),
          _showTask()
        ],
      ),
    );
  }

  _dateTimeline() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: customRed,
        selectedTextColor: customCosmic,
        dateTextStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Get.isDarkMode ? customCosmic : customDavy,
        )),
        monthTextStyle: dateTextStyle,
        dayTextStyle: dateTextStyle,
        daysCount: 31,
        onDateChange: (date) {
          selectedDate = date;
          // New date selected
          setState(() {});
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle.copyWith(
                      color: Get.isDarkMode ? customCosmic : customDavy),
                ),
                Text(
                  "Today",
                  style: headingStyle.copyWith(
                      color: Get.isDarkMode ? customCosmic : customDavy),
                )
              ],
            ),
          ),
          CustomButton(
            label: '+ Add Task',
            onTap: () async {
              await Get.to(() => const AddTask());
              _taskController.getTask();
            },
          )
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.colorScheme.background,
      leading: GestureDetector(
        onTap: () {
          ThemeService().changeTheme();
          PopService().showThemeChangeMessage();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_rounded : Icons.nightlight_round,
          color: Get.isDarkMode ? customCosmic : customDavy,
          size: 20,
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage("images/man.png"),
        ),
        SizedBox(width: 20),
      ],
    );
  }

  _showTask() {
    return Expanded(child: Obx(() {
      return ListView.builder(
        itemCount: _taskController.taskList.length,
        itemBuilder: (BuildContext context, index) {
          debugPrint(_taskController.taskList.length.toString());
          return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                  child: FadeInAnimation(
                      child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _showBottomSheet(
                          context, _taskController.taskList[index]);
                      //task);
                    },
                    child: TaskTile(_taskController.taskList[index]),
                  )
                ],
              ))));
        },
      );
    }));
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: task.isCompleted == 1
            ? MediaQuery.of(context).size.height * 0.24
            : MediaQuery.of(context).size.height * 0.32,
        color: customDeep,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                  color: customDavy[200],
                  borderRadius: BorderRadius.circular(10)),
            ),
            const Spacer(),
            task.isCompleted == 1
                ? Container()
                : _bottomSheetButton(
                    label: "Task Completed",
                    onTap: () {
                      Get.back();
                    },
                    clr: customRed,
                    context: context),
            const SizedBox(height: 20),
            _bottomSheetButton(
                label: "Delete Task",
                onTap: () {
                  Get.back();
                },
                clr: customFrench,
                context: context),
            const SizedBox(height: 10),
            _bottomSheetButton(
                label: "Close",
                isClose: true,
                onTap: () {
                  Get.back();
                },
                clr: customDavy,
                context: context)
          ],
        ),
      ),
    );
  }

  _bottomSheetButton(
      {required String label,
      required Function()? onTap,
      required Color clr,
      required BuildContext context,
      bool isClose = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 50,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: isClose == true ? customDavy : clr,
          border: Border.all(
            width: 2,
            color: isClose == true ? customDavy : clr,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
          label,
          style: subHeadingStyle.copyWith(
              fontSize: 15, color: customCosmic, fontWeight: FontWeight.w300),
        )),
      ),
    );
  }
}
