import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:toddle/controllers/signup_controller.dart';
import 'package:toddle/utilities/colors.dart';
import 'package:toddle/utilities/theme.dart';
import 'package:toddle/widgets/custombutton.dart';
import 'package:toddle/widgets/textfield_signin_up.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final screenWidth = constraints.maxWidth;
      final screenHeight = constraints.maxHeight;
      return Scaffold(
        appBar: _appBar(),
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight * .8,
            margin:
                EdgeInsets.only(top: screenHeight * 0.05, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            )),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.amber),
                          child: Icon(
                            LineAwesomeIcons.camera,
                            size: 18,
                            color: nightColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: controller.fullName,
                        label: 'Full Name',
                        hint: 'Full Name',
                        icon: Icons.person_2_outlined,
                      ),
                      CustomTextField(
                        controller: controller.email,
                        label: 'Email',
                        hint: 'Email',
                        icon: Icons.email_outlined,
                      ),
                      CustomTextField(
                        controller: controller.password,
                        label: 'Password',
                        hint: 'Password',
                        icon: Icons.fingerprint_outlined,
                        onPressed: () {},
                        suffixIcon: Icons.visibility_outlined,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomElevatedButton(
                  label: 'Edit Profile',
                  onPressed: () {
                    Get.to(() => const EditProfile());
                  },
                  width: screenWidth * 0.6,
                  radius: 20,
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                          text: 'Joined',
                          style: const TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                          children: [
                            TextSpan(text: ' 31 October 2021', style: textStyle)
                          ]),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  _appBar() {
    return AppBar(
        elevation: 0,
        title: Text('Edit Profile', style: headingStyle),
        centerTitle: true,
        backgroundColor: context.theme.colorScheme.background,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              LineAwesomeIcons.angle_left,
              color: Get.isDarkMode ? defaultColor : nightColor,
            )));
  }
}
