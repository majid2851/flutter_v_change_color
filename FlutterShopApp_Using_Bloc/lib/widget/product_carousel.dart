
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/widget/product_card.dart';

import '../models/product_model.dart';

class ProductCarousel extends StatelessWidget
{
  final List<ProductModel> products;


  const ProductCarousel({
    super.key,
    required this.products
  });

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 165,
        child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context,index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: ProductCard(productModel: products[index]),
              );
            }
        ),
      ),
    );
  }
}