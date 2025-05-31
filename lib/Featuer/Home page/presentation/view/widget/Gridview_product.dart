import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/manager/category_state.dart';
import 'package:freely/core/style.dart';
import 'package:freely/core/utils/app_router.dart';

class GridViewProduct extends StatelessWidget {
  const GridViewProduct({super.key, required this.state});

  final HomeLoaded state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: state.filteredCategories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            final item = state.filteredCategories[index];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.asset(
                        item.image,
                        height: 140,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: Styles.textStyle14(
                            context,
                          ).copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 16,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                item.address,
                                style: Styles.textStyle18(context),
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),
                        // مثال لمحتوى إضافي
                        TextButton(
                          onPressed: () {
                            GoRouter.of(
                              context,
                            ).push(AppRouter.kdetailsproduct, extra: item);
                          },
                          child: Text(
                            'التفاصيل',
                            style: Styles.textStyle14(context).copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 76, 54, 244),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
