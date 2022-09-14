import 'package:flutter/material.dart';

import '../../config/colors.dart';

class CustomSnack {
  static buildSnackBar(
    String message,
    Color bgColor,
    BuildContext context,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: bgColor,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16.00,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
            fontFamily: "Helvetica Neue",
          ),
        ),
      ),
    );
  }
}