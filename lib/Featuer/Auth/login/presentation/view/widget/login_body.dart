import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freely/core/const.dart';
import 'package:freely/core/style.dart';
import 'package:go_router/go_router.dart';
import 'package:freely/Featuer/Auth/cubit/cubit_password_state.dart';
import 'package:freely/Featuer/Auth/login/presentation/view/widget/row_login_body_create.dart';
import 'package:freely/Featuer/Auth/login/presentation/view/widget/row_login_body_forget.dart';
import 'package:freely/core/utils/app_router.dart';
import 'package:freely/core/utils/image.dart';
import 'package:freely/core/widget/custom_buttom.dart';
import 'package:freely/core/widget/text_field.dart';

import '../../../../../../core/utils/funcations/validation_funcations.dart';
import '../../../../cubit/cubit_password.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
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
                SizedBox(height: 137.h),
                const CustomTextfield(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  validator: checkValidate,
                  hintText: 'name@gmail.com',
                  label: Text('Email', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 16.h),
                BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityState>(
                  builder: (context, state) {
                    return CustomTextfield(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      validator: checkValidate,
                      suffixIcon: IconButton(
                        onPressed: () {
                          context
                              .read<PasswordVisibilityCubit>()
                              .toggleVisibility();
                        },
                        icon: Icon(state.icon),
                      ),
                      // prefixIcon: const Icon(Icons.lock),
                      obscureText: state.obscureText,

                      hintText: '* * * * * * *',
                      label: const Text(
                        'password',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Remember me',
                    style: Styles.textStyle18(
                      context,
                    ).copyWith(color: kPrimaryColorblue),
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: 280.w,
                  height: 45.h,
                  child: CustomButton(
                    text: 'Log in',
                    onPressed: () {
                      if (validateAndSubmit(formKey)) {
                        GoRouter.of(context).push(AppRouter.knavigationbar);
                      }
                    },
                  ),
                ),
                SizedBox(height: 16.h),

                Text('or'),
                Divider(endIndent: 77, indent: 77),
                SizedBox(height: 20.h),

                ContainerWithIconAndText(
                  text: 'sign up with Google',
                  icon: Icons.abc_sharp,
                ),
                SizedBox(height: 50),
                ContainerWithIconAndText(
                  text: 'sign up with apple',
                  icon: Icons.apple,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// password_visibility_cubit.dart

class ContainerWithIconAndText extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color containerColor;
  final Color textColor;

  // انحناء حواف الكونتينر

  const ContainerWithIconAndText({
    super.key,
    required this.text,
    required this.icon,
    this.containerColor = kPrimaryColorblack, // لون الكونتينر افتراضياً أزرق
    this.textColor = Colors.white, // لون النص افتراضياً أبيض
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: kPrimaryColorblue, // لون الحواف
          width: 1, // سمك الحواف
        ),
      ),
      child: Row(
        mainAxisSize:
            MainAxisSize.min, // يجعل الـ Row تأخذ أقل مساحة ممكنة أفقياً
        children: [
          const Spacer(),
          Icon(icon),
          SizedBox(width: 12),

          // يجعل النص يأخذ المساحة المتاحة لتوسيعه
          Text(
            text,
            style: TextStyle(color: textColor),
            textAlign: TextAlign.center, // توسيط النص داخل الـ Expanded
            overflow: TextOverflow.ellipsis, // لمنع تجاوز النص إذا كان طويلاً
          ),
          Spacer(),
        ],
      ),
    );
  }
}
