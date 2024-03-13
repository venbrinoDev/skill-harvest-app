

import 'package:flutter/material.dart';
import 'package:skill_harvest_app/constant.dart';

class EnterDetailsText extends StatelessWidget {
  const EnterDetailsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Enter your details below to login',
        style: TextStyle(
            fontFamily: AppConstant.fontName,
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.normal));
  }
}