import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freely/Featuer/Home%20page/data/categouris_model.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/manager/cubit_category.dart';
import 'package:freely/core/style.dart';
import 'package:freely/core/utils/funcations/customsnakbar.dart';
import 'package:freely/core/widget/appare_widget.dart';
import 'package:freely/core/widget/custom_buttom.dart';

class DetailsProduct extends StatelessWidget {
  const DetailsProduct({super.key, required this.detailsProduct});

  final ProductModel detailsProduct;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppareWidget(
          title: 'Details Product',
          automaticallyImplyLeading: true,
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height * 0.35,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                  image: DecorationImage(
                    image: AssetImage(detailsProduct.image),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        detailsProduct.name,
                        style: Styles.textStyle14(context).copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: ListView(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money_rounded,
                        color: Colors.green,
                        size: 28,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        detailsProduct.price,
                        style: Styles.textStyle14(context).copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'الوصف',
                    style: Styles.textStyle14(context).copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "هذا المنتج مصمم بعناية ليمنحك الجودة والراحة. مثالي للاستخدام اليومي، ويضفي لمسة من التميز في كل مرة.",
                    style: Styles.textStyle14(context).copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  buildFeature(
                    icon: Icons.verified,
                    label: 'ضمان الجودة العالية',
                  ),
                  buildFeature(icon: Icons.style, label: 'تصميم عصري ومريح'),
                  buildFeature(
                    icon: Icons.local_shipping,
                    label: 'شحن سريع وآمن',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 50,
          right: 50,
        ),
        child: CustomButton(
          onPressed: () {
            final homeCubit = context.read<HomeCubit>();
            if (homeCubit.sellProducts.contains(detailsProduct)) {
              showCustomSnackBar(
                (context),
                'المنتج موجود بالفعل في السلة ',
                color: Colors.orange,
                time: 300,
              );
            } else {
              homeCubit.addproduct(detailsProduct);
              showCustomSnackBar(
                (context),
                'تمت إضافة المنتج إلى السلة!',
                color: Colors.green,
                time: 300,
              );
            }
          },
          text: ' أضف الى السلة',
        ),
      ),
    );
  }

  Widget buildFeature({required IconData icon, required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
