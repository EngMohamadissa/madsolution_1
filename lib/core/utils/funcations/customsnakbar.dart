import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:freely/core/const.dart';

void showCustomSnackBar(
  BuildContext context,
  String message, {
  Color color = kPrimaryColorblue,
  required final int time,
}) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    backgroundColor: Colors.transparent,
    elevation: 0,
    duration: Duration(milliseconds: time),
    margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    padding: EdgeInsets.zero,
    content: Animate(
      effects: [
        FadeEffect(duration: 300.ms),
        SlideEffect(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
          curve: Curves.easeOut,
          duration: 500.ms,
        ),
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.95),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: kPrimaryColorblue.withOpacity(0.25),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showCustomAlertDialog({
  required BuildContext context,
  required String content,
  List<Widget>? actions,
  required void Function()? onPressed,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Alert",
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation1, animation2) => const SizedBox.shrink(),
    transitionBuilder: (context, animation, _, __) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );
      return ScaleTransition(
        scale: curved,
        child: AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Colors.blue, width: 2),
          ),
          title: const Row(
            children: [
              Icon(Icons.info_outline, size: 28, color: Colors.blue),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  "تنبيه",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
          content: Text(
            content,
            style: const TextStyle(fontSize: 18, color: Colors.black87),
          ),
          actions:
              actions ??
              [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shadowColor: Colors.blue.shade200,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                    onPressed: onPressed,
                    child: const Text(
                      'موافق',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
          actionsPadding: const EdgeInsets.only(bottom: 10, right: 10),
        ),
      );
    },
  );
}
