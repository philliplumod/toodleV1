import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:toddle/controllers/task_controller.dart';
import 'package:toddle/models/task.dart';
import 'package:toddle/utilities/theme.dart';
import 'package:toddle/widgets/button.dart';

import '../utilities/colors.dart';
import '../widgets/text_field.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String endTime = "9:30 PM";
  List<int> _remindList = [5, 10, 15, 20];
  List<int> remindRange = [];

  String _selectedRepeat = "Never";
  List<String> repeatList = ["Never", "Daily", "Weekly", "Monthly"];

  int _selectedColor = 0;

  @override
  void initState() {
    super.initState();
    remindRange = List<int>.generate(_remindList.length, (i) => _remindList[i]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: _appBar(),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Task",
                style: headingStyle,
              ),
              CustomField(
                title: "Task Name",
                hint: "Enter Task Name",
                controller: _titleController,
              ),
              CustomField(
                  title: "Note",
                  hint: "Enter your note",
                  controller: _descriptionController),
              CustomField(
                  title: "Date",
                  hint: DateFormat.yMd().format(selectedDate),
                  controller: null,
                  widget: IconButton(
                    icon: Icon(Icons.calendar_today_rounded,
                        color: Get.isDarkMode ? defaultColor : nightColor),
                    onPressed: () {
                      _getDate();
                    },
                  )),
              Row(
                children: [
                  Expanded(
                      child: CustomField(
                    title: "Start Time",
                    hint: startTime,
                    controller: null,
                    widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                        icon: Icon(Icons.access_time_rounded,
                            color: Get.isDarkMode ? defaultColor : nightColor)),
                  )),
                  const SizedBox(width: 10),
                  Expanded(
                      child: CustomField(
                    title: "End Time",
                    hint: endTime,
                    controller: null,
                    widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                        icon: Icon(Icons.access_time_rounded,
                            color: Get.isDarkMode ? defaultColor : nightColor)),
                  )),
                ],
              ),
              CustomField(
                  title: "Remind",
                  hint: "${_remindList[0]} minutes early",
                  controller: null,
                  widget: DropdownButton(
                    icon: Icon(Icons.arrow_drop_down_rounded,
                        color: Get.isDarkMode ? defaultColor : nightColor),
                    iconSize: 32,
                    elevation: 3,
                    style: textStyle.copyWith(
                        color: Get.isDarkMode ? defaultColor : nightColor),
                    underline: Container(height: 0),
                    items:
                        remindRange.map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _remindList = [int.parse(newValue!)];
                      });
                    },
                  )),
              CustomField(
                  title: "Repeat",
                  hint: _selectedRepeat,
                  controller: null,
                  widget: DropdownButton(
                    icon: Icon(Icons.arrow_drop_down_rounded,
                        color: Get.isDarkMode ? defaultColor : nightColor),
                    iconSize: 32,
                    elevation: 3,
                    style: textStyle.copyWith(
                        color: Get.isDarkMode ? defaultColor : nightColor),
                    underline: Container(height: 0),
                    items: repeatList
                        .map<DropdownMenuItem<String>>((String? value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value!),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRepeat = newValue!;
                      });
                    },
                  )),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorSelect(),
                  CustomButton(
                      label: "Create Task ",
                      onTap: () {
                        _validateDate();
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _validateDate() {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      _addTaskDb();
      Get.back();
    } else if (_titleController.text.isEmpty ||
        _descriptionController.text.isEmpty) {
      Get.snackbar("Error", "All fields are required",
          backgroundColor: Get.isDarkMode ? defaultColor : nightColor,
          snackPosition: SnackPosition.BOTTOM,
          snackStyle: SnackStyle.FLOATING,
          colorText: Get.isDarkMode ? nightColor : defaultColor,
          icon: Icon(Icons.warning_amber_rounded,
              color: Get.isDarkMode ? nightColor : defaultColor));
    }
  }

  _colorSelect() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color",
            style: textStyle.copyWith(
              color: Get.isDarkMode ? defaultColor : nightColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            )),
        const SizedBox(height: 8.0),
        Wrap(
            children: List<Widget>.generate(3, (int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedColor = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                radius: 14,
                backgroundColor: index == 0
                    ? customAccentColor1
                    : index == 1
                        ? customAccentColor2
                        : customAccentColor3,
                child: index == _selectedColor
                    ? const Icon(Icons.check_rounded,
                        color: Colors.white, size: 16)
                    : Container(),
              ),
            ),
          );
        }))
      ],
    );
  }

  _appBar() {
    return AppBar(
      key: UniqueKey(),
      elevation: 0,
      backgroundColor: context.theme.colorScheme.background,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Get.isDarkMode ? defaultColor : nightColor,
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

  _getDate() async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2150),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: Get.isDarkMode ? nightColor : defaultColor,
                onPrimary: Get.isDarkMode ? defaultColor : nightColor,
                surface: Get.isDarkMode ? defaultColor : nightColor,
                onSurface: Get.isDarkMode ? nightColor : defaultColor,
              ),
              dialogBackgroundColor: Get.isDarkMode ? defaultColor : nightColor,
            ),
            child: child!,
          );
        });

    if (pickerDate != null) {
      setState(() {
        selectedDate = pickerDate;
      });
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTime();

    if (pickedTime == null) {
      debugPrint("No time selected");
      return;
    }
    // ignore: use_build_context_synchronously
    String formattedTime = pickedTime.format(context);

    if (isStartTime == true) {
      setState(() {
        startTime = formattedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        endTime = formattedTime;
      });
    } else {
      debugPrint("Error");
      return;
    }
  }

  _showTime() {
    return showTimePicker(
        context: context,
        initialEntryMode: TimePickerEntryMode.input,
        initialTime: TimeOfDay(
          hour: int.parse(startTime.split(":")[0]),
          minute: int.parse(startTime.split(":")[1].split(" ")[0]),
        ),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: customAccentColor1,
                  onSurface: customAccentColor3,
                ),
                buttonTheme: ButtonThemeData(
                  colorScheme: ColorScheme.light(
                    primary: customAccentColor1,
                    onSurface: customAccentColor3,
                  ),
                ),
              ),
              child: child!,
            ),
          );
        });
  }

  _addTaskDb() async {
    int value = await _taskController.addTask(
        task: Task(
      title: _titleController.text,
      note: _descriptionController.text,
      date: DateFormat.yMd().format(selectedDate),
      startTime: startTime,
      endTime: endTime,
      color: _selectedColor,
      repeat: _selectedRepeat,
      isCompleted: 0,
    ));
    debugPrint("Id $value");
  }
}
