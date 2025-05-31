import 'package:flutter/material.dart';
import 'package:freely/core/const.dart';
import 'package:freely/core/style.dart';

class AppareWidget extends StatelessWidget {
  const AppareWidget({
    super.key,
    required this.title,
    required this.automaticallyImplyLeading,
    this.leading,
    this.actions,
  });

  final String title;
  final bool automaticallyImplyLeading;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leading,
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: kPrimaryColorblue,
      title: Center(
        child: Text(
          title,
          style: Styles.textStyle18(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
