import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:toddle/Pages/editprofile.dart';
import 'package:toddle/controllers/profile_controller.dart';
import 'package:toddle/services/notify_helper.dart';
import 'package:toddle/services/theme_services.dart';
import 'package:toddle/utilities/colors.dart';
import 'package:toddle/utilities/theme.dart';
import 'package:toddle/widgets/custombutton.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController _profileController = Get.find();

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() async {
    final userData = await _profileController.getUserData();
    if (userData != null) {
      setState(() {
        _profileController.fullName.value = userData.fullName;
        _profileController.email.value = userData.email;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Get.isDarkMode ? nightColor : defaultColor,
      body: Container(
        margin: EdgeInsets.only(top: size.height * 0.05, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                          image: AssetImage("images/man.png"),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.amber,
                        ),
                        child: Icon(
                          LineAwesomeIcons.pen,
                          size: 18,
                          color: nightColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Obx(() => Text(
                    _profileController.fullName.value,
                    style: headingStyle,
                  )),
              const SizedBox(height: 15),
              Obx(() => Text(
                    _profileController.email.value,
                    style: textStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
              const SizedBox(height: 15),
              CustomElevatedButton(
                textColor: nightColor,
                color: customAccentColor3,
                label: 'Edit Profile',
                onPressed: () async{
                  await Get.to(() => const EditProfile());
                },
                width: size.width * 0.6,
                radius: 20,
              ),
              const Divider(),
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.colorScheme.background,
      title: Text('Profile', style: headingStyle),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            ThemeService().changeTheme();
            NotificationService().scheduledNotification();
          },
          icon: Icon(
            Get.isDarkMode ? LineAwesomeIcons.sun : LineAwesomeIcons.moon,
            color: Get.isDarkMode ? defaultColor : nightColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
