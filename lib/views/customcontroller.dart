import 'package:flutter/material.dart';

class CustomTextWidget extends StatefulWidget {
  final String? hint;
  final IconData? icon;
  final TextEditingController controller;
  final ispassword;

  const CustomTextWidget({
    super.key,
    this.hint,
    this.icon,
    required this.controller,
    this.ispassword = false,
  });

  @override
  State<CustomTextWidget> createState() => _CustomTextWidgetState();
}

class _CustomTextWidgetState extends State<CustomTextWidget> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    if (widget.ispassword) {
      return TextField(
        controller: widget.controller,
        obscureText: _hidePassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: widget.hint,
          prefixIcon: Icon(widget.icon),
          suffixIcon: IconButton(
            icon: Icon(_hidePassword ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _hidePassword = !_hidePassword;
              });
            },
          ),
        ),
      );
    } else {
      return TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: widget.hint,
          prefixIcon: Icon(widget.icon),
        ),
      );
    }

  }
}
