import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/manager/category_state.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/manager/cubit_category.dart';
import 'package:freely/core/utils/funcations/customsnakbar.dart';
import 'package:freely/core/widget/appare_widget.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppareWidget(
          actions: [
            IconButton(
              onPressed: () {
                showCustomAlertDialog(
                  context: (context),
                  content: ' هل انت متأكد من حذف جميع المنتجات',
                  onPressed: () {
                    context.read<HomeCubit>().removeallProduct();
                    Navigator.of(context).pop();
                  },
                );
              },
              icon: const Icon(Icons.delete),
            ),
          ],
          title: 'Product Shopping',
          automaticallyImplyLeading: true,
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          // التأكد أن الحالة هي HomeLoaded وتحتوي على المنتجات المضافة إلى السلة
          if (state is HomeLoaded) {
            // إذا كانت السلة فارغة
            if (state.sellproducts.isEmpty) {
              return const Center(child: Text('لا توجد منتجات في السلة'));
            }

            // عرض قائمة المنتجات المضافة إلى السلة
            return ListView.builder(
              itemCount: state.sellproducts.length,
              itemBuilder: (context, index) {
                final product =
                    state.sellproducts[index]; // الحصول على المنتج من السلة
                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: Image.asset(
                      product.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.name),
                    subtitle: Text(product.price),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        context.read<HomeCubit>().removeProduct(product);
                      },
                    ),
                  ),
                );
              },
            );
          }
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeError) {
            return Center(child: Text(state.message));
          }

          return const Center(child: Text('حدث خطأ غير متوقع'));
        },
      ),
    );
  }
}
