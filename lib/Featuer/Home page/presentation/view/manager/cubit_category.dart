import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freely/Featuer/Home%20page/data/categouris_model.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/manager/category_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Set<ProductModel> sellProducts = {};

  void loadCategories() async {
    emit(HomeLoading());

    try {
      await Future.delayed(
        const Duration(milliseconds: 500),
      ); // simulate loading
      final categoriesList = [
        'all',
        ...{for (var item in categories) item.category},
      ];
      emit(
        HomeLoaded(
          categories: categoriesList,
          filteredCategories: categories,
          selectedCategory: 'all',
          sellproducts: sellProducts.toList(),
        ),
      );
    } catch (e) {
      emit(HomeError("فشل في تحميل البيانات"));
    }
  }

  void filterByCategory(String category) {
    final allCategories = [
      'all',
      ...{for (var item in categories) item.category},
    ];
    final filtered =
        category == 'all'
            ? categories
            : categories.where((item) => item.category == category).toList();

    emit(
      HomeLoaded(
        categories: allCategories,
        filteredCategories: filtered,
        selectedCategory: category,
        sellproducts: sellProducts.toList(),
      ),
    );
  }

  void addproduct(ProductModel product) {
    print('mmmmmmmmmmmmmm${sellProducts.toList()}');
    sellProducts.add(product);

    if (state is HomeLoaded) {
      final current = state as HomeLoaded;

      emit(
        HomeLoaded(
          categories: current.categories,
          filteredCategories: current.filteredCategories,
          selectedCategory: current.selectedCategory,
          sellproducts: List.from(sellProducts),
        ),
      );
    }
  }

  void removeProduct(ProductModel product) {
    sellProducts.remove(product);
    final current = state as HomeLoaded;

    emit(
      HomeLoaded(
        categories: current.categories,
        filteredCategories: current.filteredCategories,
        selectedCategory: current.selectedCategory,
        sellproducts: sellProducts.toList(),
      ),
    );
  }

  void removeallProduct() {
    sellProducts.clear();
    final current = state as HomeLoaded;

    emit(
      HomeLoaded(
        categories: current.categories,
        filteredCategories: current.filteredCategories,
        selectedCategory: current.selectedCategory,
        sellproducts: sellProducts.toList(),
      ),
    );
  }
}
