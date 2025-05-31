import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freely/Featuer/spalsh_view/presentation/view/widget/iconbox.dart';
import 'package:freely/core/const.dart';
import 'package:freely/core/style.dart';
import 'package:freely/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

class SplahView2 extends StatelessWidget {
  const SplahView2({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(flex: 3), // مسافة أكبر في الأعلى
              Text(
                "L E T ’ S  G E T   Y O U",
                style: Styles.textStyle18(
                  context,
                ).copyWith(color: kPrimaryColorwhite, fontSize: 22),
              ),
              Text(
                "S T A R T E D !",
                style: Styles.textStyle18(
                  context,
                ).copyWith(color: kPrimaryColorwhite, fontSize: 22),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Skip",
                      style: Styles.textStyle18(
                        context,
                      ).copyWith(color: kPrimaryColorblue),
                    ),
                  ),
                  SizedBox(width: 25.w),

                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kloginView);
                    },
                    child: Text(
                      "Sign in",
                      style: Styles.textStyle18(
                        context,
                      ).copyWith(color: kPrimaryColorblue),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyIconBox(icon: Icons.search, text: 'I’m a client'),

                  SizedBox(width: 50.w),
                  MyIconBox(icon: Icons.email, text: 'I’m a client'),
                ],
              ),
              SizedBox(height: 40.h),

              Text(
                'You can switch your role later from settings',
                style: Styles.textStyle18(
                  context,
                ).copyWith(color: kPrimaryColorwhite),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
