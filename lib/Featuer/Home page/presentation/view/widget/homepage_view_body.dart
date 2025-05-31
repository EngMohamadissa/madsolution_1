import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/manager/category_state.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/manager/cubit_category.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/widget/product_page.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        } else if (state is HomeLoaded) {
          return ProductPage(state: state);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
