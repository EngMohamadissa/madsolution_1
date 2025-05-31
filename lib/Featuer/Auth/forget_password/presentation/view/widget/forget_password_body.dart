import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freely/core/utils/funcations/validation_funcations.dart';
import 'package:freely/core/utils/image.dart';
import 'package:freely/core/widget/custom_buttom.dart';
import 'package:freely/core/widget/text_field.dart';

class ForgetPasswordBody extends StatelessWidget {
  ForgetPasswordBody({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 32.h),
                Image.asset(
                  Assets.imagesAvatar1,
                  height: 180.h,
                  width: 180.w,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 16.h),
                const CustomTextfield(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  validator: checkValidate,
                  suffixIcon: Icon(Icons.email),
                  prefixIcon: Icon(Icons.person),
                  hintText: 'email',
                  label: Text('Enter email'),
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: 280.w,
                  height: 45.h,
                  child: CustomButton(
                    text: 'Send',
                    onPressed: () {
                      validateAndSubmit(formKey);
                    },
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
