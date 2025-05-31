import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/manager/category_state.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/manager/cubit_category.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key, required this.state});

  final HomeLoaded state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.categories.length,
        itemBuilder: (context, index) {
          final category = state.categories[index];
          final isSelected = state.selectedCategory == category;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  context.read<HomeCubit>().filterByCategory(category);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 16,
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
