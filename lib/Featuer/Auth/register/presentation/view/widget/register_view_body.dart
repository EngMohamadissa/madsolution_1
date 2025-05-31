import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:freely/Featuer/Auth/cubit/cubit_password.dart';
import 'package:freely/Featuer/Auth/cubit/cubit_password_state.dart';
import 'package:freely/core/utils/app_router.dart';
import 'package:freely/core/utils/funcations/validation_funcations.dart';
import 'package:freely/core/utils/image.dart';
import 'package:freely/core/widget/custom_buttom.dart';
import 'package:freely/core/widget/text_field.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  Icon iconpasswrd = const Icon(Icons.visibility_off);
  bool obscureText = false;

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
                      prefixIcon: const Icon(Icons.lock),
                      obscureText: state.obscureText,
                      hintText: '* * * * * * *',
                      label: const Text('Enter password'),
                    );
                  },
                ),
                SizedBox(height: 24.h),
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
                      prefixIcon: const Icon(Icons.lock),
                      obscureText: state.obscureText,
                      hintText: '* * * * * * *',
                      label: const Text('Enter confiem password'),
                    );
                  },
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: 280.w,
                  height: 45.h,
                  child: CustomButton(
                    text: 'Create Account',
                    onPressed: () {
                      if (validateAndSubmit(formKey)) {
                        GoRouter.of(context).push(AppRouter.kloginView);
                      }
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
