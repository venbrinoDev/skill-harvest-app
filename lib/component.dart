import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skill_harvest_app/constant.dart';

class OrLoginWidget extends StatelessWidget {
  const OrLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey,
          ),
        ),
        Gap(15),
        Text('Or login with'),
        Gap(15),
        Expanded(
          child: Divider(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class BottomActionWidget extends StatelessWidget {
  final String title;
  final String option;
  final VoidCallback? onPressed;

  const BottomActionWidget(
      {super.key, required this.title, required this.option, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(text: title, children: [
      TextSpan(
          text: option,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              onPressed?.call();
            },
          style: const TextStyle(color: Color(0xFF3D5CFF)))
    ]));
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
            elevation: const MaterialStatePropertyAll(0),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: const MaterialStatePropertyAll(Color(0xFF3D5CFF)),
            fixedSize: MaterialStatePropertyAll(
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
