import 'package:flutter/material.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/manager/category_state.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/widget/Gridview_product.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/widget/category_product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.state});

  final HomeLoaded state;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [CategoryProducts(state: state), GridViewProduct(state: state)],
    );
  }
}
