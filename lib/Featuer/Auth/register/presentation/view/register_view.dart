import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freely/Featuer/Auth/register/presentation/view/widget/register_view_body.dart';
import 'package:freely/core/widget/appare_widget.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppareWidget(
          title: 'Create Account',
          automaticallyImplyLeading: true,
        ),
      ),
      body: RegisterViewBody(),
    );
  }
}
