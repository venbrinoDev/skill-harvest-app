// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:skill_harvest_app/component.dart';
import 'package:skill_harvest_app/constant.dart';
import 'package:skill_harvest_app/enter_details_widget.dart';
import 'package:skill_harvest_app/text_field.dart';
import 'package:skill_harvest_app/utils/app_image.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 120,
        leadingWidth: double.infinity,
        leading: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Log in',
                  style: TextStyle(
                      fontFamily: AppConstant.fontName,
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Gap(5),
              EnterDetailsText()
            ],
          ),
        ),
        backgroundColor: Colors.grey.withOpacity(0.2),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(20),
            EmailTextFiled(
              controller: emailController,
            ),
            Gap(30),
            PasswordTextField(
              controller: passwordController,
            ),
            Gap(10),
            ForgotPassword(),
            Gap(30),
            LoginButton(),
            Gap(30),
            BottomActionWidget(
                title: "LDon’t have an account? ",
                option: 'Sign up?',
                onPressed: () {}),
            Gap(30),
            OrLoginWidget(),
            Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImage.facebookSvg),
                Gap(30),
                SvgPicture.asset(AppImage.googleSvg),
              ],
            )
          ],
        ),
      ),
    );
  }
}
