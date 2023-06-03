import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:toddle/controllers/task_controller.dart';
import 'package:toddle/models/task.dart';
import 'package:toddle/services/notify_helper.dart';
import 'package:toddle/services/theme_services.dart';
import 'package:intl/intl.dart';
import 'package:toddle/utilities/colors.dart';
import 'package:toddle/utilities/theme.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:toddle/widgets/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());
  late String title;

  dynamic notifyHelper;
  @override
  void initState() {
    super.initState();
    // notifyHelper = NotificationService();
    _taskController.getTask();
  }

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
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: DatePicker(
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        selectionColor: custombtnColor,
        selectedTextColor: defaultColor,
        dateTextStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: Get.isDarkMode ? defaultColor : nightColor,
        )),
        monthTextStyle: dateTextStyle,
        dayTextStyle: dateTextStyle,
        daysCount: 31,
        onDateChange: (date) {
          selectedDate = date;
          // New date selected
          setState(() {
            selectedDate = date;
          });
        },
        height: MediaQuery.of(context).size.height * 0.095,
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
                      color: Get.isDarkMode ? defaultColor : nightColor),
                ),
                Text(
                  "Today",
                  style: headingStyle.copyWith(
                      color: Get.isDarkMode ? defaultColor : nightColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.colorScheme.background,
      leading: IconButton(
          onPressed: () {
            ThemeService().changeTheme();
            NotificationService().scheduledNotification();
          },
          icon: Icon(
            Get.isDarkMode ? LineAwesomeIcons.sun : LineAwesomeIcons.moon,
            color: Get.isDarkMode ? defaultColor : nightColor,
          )),
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
            Task task = _taskController.taskList[index];
            debugPrint(task.toString());
            if (task.repeat == 'Daily') {
              DateTime date = DateFormat.jm().parse(task.startTime.toString());
              var time = DateFormat("HH:mm").format(date);
              NotificationService().scheduledTaskNotification(
                  int.parse(time.toString().split(":")[0]),
                  int.parse(time.toString().split(":")[1]),
                  task);

              return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                      child: FadeInAnimation(
                          child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showBottomSheet(context, task);
                          //task);
                        },
                        child: TaskTile(task),
                      )
                    ],
                  ))));
            }
            if (task.date == DateFormat.yMd().format(selectedDate)) {
              return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                      child: FadeInAnimation(
                          child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showBottomSheet(context, task);
                          //task);
                        },
                        child: TaskTile(task),
                      )
                    ],
                  ))));
            } else {
              return const SizedBox();
            }
          });
    }));
  }

  _showBottomSheet(BuildContext context, Task task) {
    double bottomSheetHeight = task.isCompleted == 1
        ? MediaQuery.of(context).size.height * 0.24
        : MediaQuery.of(context).size.height * 0.32;

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: bottomSheetHeight,
        color: Get.isDarkMode ? defaultColor : nightColor,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? nightColor.withOpacity(0.1)
                      : defaultColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
            ),
            const Spacer(),
            task.isCompleted == 1
                ? Container()
                : _bottomSheetButton(
                    label: "Task Completed",
                    onTap: () {
                      setState(() {
                        _taskController.taskCompleted(task.id!);
                      });
                      Get.back();
                    },
                    clr: customAccentColor1,
                    context: context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            _bottomSheetButton(
                label: "Delete Task",
                onTap: () {
                  setState(() {
                    _taskController.delete(task);
                    _taskController.getTask();
                  });
                  Get.back();
                },
                clr: custombtnColor,
                context: context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            _bottomSheetButton(
                label: "Close",
                isClose: true,
                onTap: () {
                  Get.back();
                },
                clr: defaultColor,
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
          color: isClose == true
              ? Get.isDarkMode
                  ? defaultColor
                  : nightColor
              : clr,
          border: Border.all(
            width: 2,
            color: isClose == true
                ? Get.isDarkMode
                    ? nightColor
                    : defaultColor
                : clr,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
          label,
          style: subHeadingStyle.copyWith(
              fontSize: 15, color: Get.isDarkMode ? nightColor : defaultColor),
        )),
      ),
    );
  }
}
