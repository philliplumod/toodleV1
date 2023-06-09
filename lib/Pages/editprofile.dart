import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:toddle/controllers/profile_controller.dart';
import 'package:toddle/models/user_model.dart';
import 'package:toddle/utilities/colors.dart';
import 'package:toddle/utilities/theme.dart';
import 'package:toddle/widgets/custombutton.dart';

import '../repository/authentication_repository/authentication_repository.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  final ProfileController _profileController = Get.find();
  final AuthenticationRepository _authRepo = Get.find();

  final formKey = GlobalKey<FormState>();

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
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 0.05, left: 20, right: 20),
          child: GetBuilder<ProfileController>(
            builder: (_) {
              return Column(
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
                              LineAwesomeIcons.camera,
                              size: 18,
                              color: nightColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 18),
                          TextFormField(
                            initialValue: _profileController.fullName.value,
                            style: subtextStyle,
                            decoration: InputDecoration(
                              labelStyle: subtextStyle,
                              hintStyle: subtextStyle,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Get.isDarkMode
                                      ? defaultColor
                                      : nightColor,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Get.isDarkMode
                                      ? defaultColor
                                      : nightColor,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Get.isDarkMode
                                      ? defaultColor
                                      : nightColor,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          TextFormField(
                            initialValue: _profileController.email.value,
                            style: subtextStyle,
                            decoration: InputDecoration(
                              labelStyle: subtextStyle,
                              hintStyle: subtextStyle,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Get.isDarkMode
                                      ? defaultColor
                                      : nightColor,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Get.isDarkMode
                                      ? defaultColor
                                      : nightColor,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Get.isDarkMode
                                      ? defaultColor
                                      : nightColor,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          TextFormField(
                            initialValue: '', // Set the initial value for the password field
                            style: subtextStyle,
                            decoration: InputDecoration(
                              labelStyle: subtextStyle,
                              hintStyle: subtextStyle,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Get.isDarkMode
                                      ? defaultColor
                                      : nightColor,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Get.isDarkMode
                                      ? defaultColor
                                      : nightColor,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Get.isDarkMode
                                      ? defaultColor
                                      : nightColor,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 0.03),
                  CustomElevatedButton(
                    label: 'Edit Profile',
                    color: customAccentColor3,
                    textColor: nightColor,
                    onPressed: () {
                      // Handle the edit profile logic here
                    },
                    radius: 20,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      TextButton(
                        onPressed: () {
                          _authRepo.logout();
                        },
                        child: Text(
                          'Logout',
                          style: textStyle,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      title: Text('Edit Profile', style: headingStyle),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          LineAwesomeIcons.angle_left,
          color: Get.isDarkMode ? defaultColor : nightColor,
        ),
      ),
    );
  }
}
