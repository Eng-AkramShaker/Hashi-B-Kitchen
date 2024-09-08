// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

// ==========================================================================

import 'group_product _model.dart';

class CategoryItem {
  int category;
  int number;
  String price;
  int stock_qty;
  Item item;

  CategoryItem({
    required this.category,
    required this.number,
    required this.price,
    required this.stock_qty,
    required this.item,
  });

  @override
  String toString() {
    return 'CategoryItem{ category: $category, item: $item}';
  }
}

// ==========================================================================

class SearchItem {
  int index_group;
  int index_category;
  String name;
  double valuationRate;
  String? image;
  var stock_qty;
  var price_rate;

  SearchItem({
    required this.index_group,
    required this.index_category,
    required this.name,
    required this.valuationRate,
    required this.image,
    required this.stock_qty,
    required this.price_rate,
  });
}
