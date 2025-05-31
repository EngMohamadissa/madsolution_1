import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freely/Featuer/Auth/cubit/cubit_password.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/manager/cubit_category.dart';
import 'package:freely/core/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // مقاس التصميم الأساسي (مثلاً iPhone X)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => PasswordVisibilityCubit()),
            BlocProvider(create: (context) => HomeCubit()..loadCategories()),
          ],
          child: MaterialApp.router(
            theme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}
