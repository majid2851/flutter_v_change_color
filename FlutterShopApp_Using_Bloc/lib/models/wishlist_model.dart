import 'package:equatable/equatable.dart';

import 'product_model.dart';

class WishListModel extends Equatable
{
  final List<ProductModel>  products;
  const WishListModel({this.products=const <ProductModel>[]});

  @override
  List<Object?> get props => [products];


}