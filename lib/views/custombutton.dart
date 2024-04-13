// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:myapp_flutter/configs/constants.dart';
class custombutton extends StatelessWidget {
  final VoidCallback action;
  final String label;
  final Color? labelColor;
  const custombutton({
    super.key,
    required this.label,
    required this.action, 
    this.labelColor,
    // ignore: non_constant_identifier_names
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: appWhiteColor,
        disabledForegroundColor: appWhiteColor,
        elevation: 5.0,
        shadowColor: appWhiteColor,
        padding: const EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {
        action();
      },
      child: Text(
        label,
        style: TextStyle(
          color: labelColor ?? appWhiteColor,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
