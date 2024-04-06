// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:skill_harvest_app/component.dart';
import 'package:skill_harvest_app/constant.dart';
import 'package:skill_harvest_app/enter_details_widget.dart';
import 'package:skill_harvest_app/loginPage/controller/controller.dart';
import 'package:skill_harvest_app/text_field.dart';
import 'package:skill_harvest_app/utils/app_image.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
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
            ref.watch(loginController).isBusy
                ? CircularProgressIndicator(
                    color: Colors.blue[800],
                  )
                : LoginButton(
                    onpressed: () {
                      _submit();
                    },
                  ),
            Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                    fillColor: MaterialStatePropertyAll(Colors.blue),
                    value: ref.watch(loginController).isCheck,
                    onChanged: (bool? value) {
                      if (value == null) return;
                      ref.read(loginController).updateCheckBox(value);
                    }),
                BottomActionWidget(
                    title: "Don’t have an account? ",
                    option: 'Sign up?',
                    onPressed: () {}),
              ],
            ),
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

  void _submit() async {
    if (ref.read(loginController).isCheck == false) {
      _showError(
          message: 'Please Accept Terms and\ncondition ',
          action: SnackBarAction(
              textColor: Colors.white,
              label: 'Accept',
              onPressed: () {
                ref.read(loginController).updateCheckBox(true);
              }));
      return;
    }
    final procced = await ref
        .read(loginController)
        .login(emailController.text, passwordController.text);

    if (procced == true) {
      _showSuccess();
    } else {
      _showError();
    }
  }

  _showSuccess() {
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          'Login in Succesfully!!!',
          style: TextStyle(
              color: Colors.white, fontSize: 16.5, fontWeight: FontWeight.w400),
        )));
  }

  _showError({SnackBarAction? action, String? message}) {
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(
        action: action,
        backgroundColor: Colors.red,
        content: Text(
          message ?? 'inavalid credentials',
          style: TextStyle(
              color: Colors.white, fontSize: 14.5, fontWeight: FontWeight.w400),
        )));
  }
}
