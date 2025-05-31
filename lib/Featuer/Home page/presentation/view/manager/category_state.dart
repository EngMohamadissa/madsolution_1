import 'package:freely/Featuer/Home%20page/data/categouris_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<String> categories;
  final List<ProductModel> filteredCategories;
  final String selectedCategory;
  final List<ProductModel> sellproducts;

  HomeLoaded({
    required this.categories,
    required this.filteredCategories,
    required this.selectedCategory,
    required this.sellproducts,
  });
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
