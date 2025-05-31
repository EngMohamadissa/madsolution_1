import 'package:flutter/material.dart';
import 'package:freely/core/const.dart';
import 'package:freely/core/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = kPrimaryColorblue,
  });

  final void Function()? onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(color),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
      child: Text(
        text,
        style: Styles.textStyle18(
          context,
        ).copyWith(color: kPrimaryColorwhite, fontWeight: FontWeight.bold),
      ),
    );
  }
}
