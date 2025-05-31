import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:freely/core/const.dart';
import 'package:freely/core/style.dart';
import 'package:freely/core/utils/app_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<double> charOffsets = [0, 0, 0, 0, 0, 0];
  List<Color> charColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    kPrimaryColorblue,
  ];
  Timer? _animationTimer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _startJumpingAnimation();
      });
    });

    // الانتقال إلى الشاشة التالية بعد 8 ثواني
    Future.delayed(const Duration(seconds: 8), () {
      GoRouter.of(context).push(AppRouter.ksplashView2);
    });
  }

  // دالة لبدء تأثير القفز للأحرف
  void _startJumpingAnimation() {
    // لكل حرف في الكلمة "FREELY"
    for (int i = 0; i < charOffsets.length; i++) {
      // تأخير مختلف لكل حرف لإنشاء تأثير متتابع

      // المرحلة الأولى: القفز للأعلى
      Future.delayed(Duration(milliseconds: i * 300), () {
        if (mounted) {
          // التأكد من أن الواجهة ما زالت موجودة
          setState(() {
            charOffsets[i] = -20.0; // تحريك الحرف لأعلى
          });
        }
      });

      Future.delayed(Duration(milliseconds: (i * 300) + 150), () {
        if (mounted) {
          setState(() {
            charOffsets[i] = 0.0;
          });
        }
      });
    }

    _animationTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        _startJumpingAnimation();
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chars = ["F", "R", "E", "E", "L", "Y"];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(chars.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                transform: Matrix4.translationValues(0, charOffsets[index], 0),
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  chars[index],
                  style: Styles.textStyle18(context).copyWith(
                    color: charColors[index],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }),
          ),

          const Spacer(),
          Text(
            'CONNECTING TALENTS',
            style: Styles.textStyle18(context).copyWith(color: Colors.white),
          ),
          Text(
            'WITH OPPORTUNITIES...',
            style: Styles.textStyle18(context).copyWith(color: Colors.white),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
