import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skill_harvest_app/constant.dart';
import 'package:skill_harvest_app/enter_details_widget.dart';

import 'package:skill_harvest_app/text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(20),
            EmailTextFiled(),
            Gap(30),
            PasswordTextField(),
            Gap(10),
            ForgotPassword(),
            Gap(30),
            LoginButton()
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            elevation: ButtonStyleButton.allOrNull<double>(0),
            shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            backgroundColor:
                ButtonStyleButton.allOrNull<Color>(const Color(0xFF3D5CFF)),
            fixedSize: ButtonStyleButton.allOrNull<Size>(
                Size(MediaQuery.of(context).size.width, 50))),
        child: const Text('Log in',
            style: TextStyle(
                fontFamily: AppConstant.fontName,
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600)));
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Align(
        alignment: Alignment.centerRight,
        child: Text('Forgot Password?',
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: AppConstant.fontName,
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.normal)),
      ),
    );
  }
}
