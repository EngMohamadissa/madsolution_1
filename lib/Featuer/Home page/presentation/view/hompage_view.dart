import 'package:flutter/material.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/widget/homepage_view_body.dart';
import 'package:freely/core/widget/appare_widget.dart';

class HomPageView extends StatelessWidget {
  const HomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppareWidget(
          title: 'Home Page',
          automaticallyImplyLeading: false,
        ),
      ),
      body: HomePageBody(),
    );
  }
}
