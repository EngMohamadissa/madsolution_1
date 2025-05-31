import 'package:freely/core/utils/image.dart';

class ProductModel {
  final int id;
  final String name;
  final String image;
  final String price;
  final String address;
  final String category;

  ProductModel({
    required this.id,
    required this.price,
    required this.name,
    required this.image,
    required this.address,
    required this.category,
  });

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, price: $price, address: $address, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

final List<ProductModel> categories = [
  ProductModel(
    id: 1,
    price: '22',
    name: 'مطعم الفورسيزون',
    image: Assets.resturant1,
    address: 'ابو رمانه',
    category: 'مطاعم',
  ),
  ProductModel(
    id: 2,
    price: '22',
    name: 'مطعم الشيرتون',
    image: Assets.resturant2,
    address: 'ساحه الامويين',
    category: 'مطاعم',
  ),
  ProductModel(
    id: 3,
    price: '22',
    name: 'مطعم الياسمين',
    image: Assets.resturant3,
    address: 'الربوه',
    category: 'مطاعم',
  ),
  ProductModel(
    id: 4,
    price: '22',
    name: 'بطاطا',
    image: Assets.imagefastfood1,
    address: 'البرمكة',
    category: 'ماكولات سريعة',
  ),
  ProductModel(
    id: 5,
    price: '22',
    name: 'برغر',
    image: Assets.imagefastfood2,
    address: ' القصاع',
    category: 'ماكولات سريعة',
  ),
  ProductModel(
    id: 6,
    price: '22',
    name: 'وجبه كاملة',
    image: Assets.imagefastfood1,
    address: 'دمر',
    category: 'ماكولات سريعة',
  ),
  ProductModel(
    id: 7,
    price: '22',
    name: 'عصير طبيعي',
    image: Assets.drink1,
    address: 'مشروع دمر',
    category: 'مشروبات',
  ),
  ProductModel(
    id: 8,
    price: '22',
    name: 'سلاش',
    image: Assets.drink2,
    address: 'بانياس',
    category: 'مشروبات',
  ),
  ProductModel(
    id: 9,
    price: '22',
    name: 'ليمونادا',
    image: Assets.drink3,
    address: 'المزه',
    category: 'مشروبات',
  ),
  ProductModel(
    id: 10,
    price: '22',
    name: 'متجر Shop',
    image: Assets.shop3,
    address: 'الهامه',
    category: 'Shops',
  ),
  ProductModel(
    id: 11,
    price: '22',
    name: 'متجر الكرم',
    image: Assets.shop1,
    address: 'مول العرب، جدة',
    category: 'Shops',
  ),
  ProductModel(
    id: 12,
    price: '22',
    name: 'متجر الكرم',
    image: Assets.shop2,
    address: 'المزة  ',
    category: 'Shops',
  ),
  ProductModel(
    id: 13,
    price: '22',
    name: 'متجر الكرم',
    image: Assets.shop4,
    address: 'المرجة',
    category: 'Shops',
  ),
];
