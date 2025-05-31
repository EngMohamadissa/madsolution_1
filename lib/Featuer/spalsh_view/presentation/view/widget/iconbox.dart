import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freely/core/const.dart';

class MyIconBox extends StatelessWidget {
  final IconData icon; // الأيقونة التي ستعرض داخل المربع
  final String text; // النص الذي سيظهر تحت الأيقونة
  final Color borderColor; // لون حواف المربع
  final double borderWidth; // سُمك حواف المربع
  final double borderRadius; // نصف قطر انحناء الحواف

  const MyIconBox({
    super.key,
    required this.icon,
    required this.text,
    this.borderColor = Colors.white, // أبيض افتراضي للحواف
    this.borderWidth = 1.0, // سُمك 2.0 افتراضي للحواف
    this.borderRadius = 8.0, // نصف قطر 8.0 افتراضي للحواف المنحنية
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // تحديد عرض وارتفاع المربع (يمكنك تعديلها)
      width: 120.w,
      height: 120.h,
      decoration: BoxDecoration(
        color: Colors.transparent, // خلفية شفافة للمربع
        border: Border.all(
          color: borderColor, // لون الحواف
          width: borderWidth, // سمك الحواف
        ),
        borderRadius: BorderRadius.circular(borderRadius), // انحناء الحواف
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // توسيط المحتوى عمودياً
        children: [
          Icon(
            icon,
            size: 40, // حجم الأيقونة (يمكنك تعديله)
            color: kPrimaryColorblue, // لون الأيقونة
          ),
          const SizedBox(height: 8), // مسافة بين الأيقونة والنص
          Text(
            text,
            style: const TextStyle(
              color: Colors.white, // لون النص
              fontSize: 16, // حجم النص
              fontWeight: FontWeight.bold, // سُمك النص
            ),
            textAlign: TextAlign.center, // توسيط النص أفقياً
          ),
        ],
      ),
    );
  }
}
