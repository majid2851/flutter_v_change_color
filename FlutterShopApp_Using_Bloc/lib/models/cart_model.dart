
import 'package:equatable/equatable.dart';

import 'product_model.dart';

class CartModel extends Equatable
{
  final List<ProductModel> products;

  const CartModel({this.products=const <ProductModel>[]});

  double get subtotal =>products.fold(0, (total,current) => total+current.price);


  double deliveryFee(subtoatl)
  {
    if(subtotal>=30.0) {
      return 0.0;
    }else{
      return 10.0;
    }
  }

  double total(subtotal,deliveryFee) {
    return subtotal+deliveryFee(subtotal);
  }

  String freeDelivery(subtotal) {
    if(subtotal>=30.0){
      return 'You have free Delivery';
    }else{
      double missing=30.0-subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} For FREE Delivery';
    }
  }

  String get subtotalString =>subtotal.toStringAsFixed(2);
  String get totalString =>total(subtotal,deliveryFee).toStringAsFixed(2);
  String get deliveryFeeString =>deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString=>freeDelivery(subtotal);



  @override
  List<Object?> get props => [products];

  // List<ProductModel> products=[
  //   ProductModel(
  //       name: 'Soft Drink #1',
  //       category:'Soft Drink',
  //       imageUrl: 'https://static.toiimg.com/thumb/70994944.cms?width=400&height=300&resizemode=4&imgsize=600793',
  //       price:10.5,
  //       isPopular: false,
  //       isRecommended:true
  //   ),
  //   ProductModel(
  //       name: 'Soft Drink #2',
  //       category:'Water',
  //       imageUrl: 'https://www.saycheesepizza.ca/wp-content/uploads/2016/10/soft_drink_png_1273911.png',
  //       price:7.3 ,
  //       isPopular:true ,
  //       isRecommended:true
  //   ),
  //   ProductModel(
  //       name: 'Soft Drink #3',
  //       category:'Smoothis',
  //       imageUrl: 'https://loz.hexacodes.net/wp-content/uploads/2021/07/soft-drink-companies.jpg',
  //       price: 8.0,
  //       isPopular: false,
  //       isRecommended:false
  //   ),
  //   ProductModel(
  //       name: 'Soft Drink #4',
  //       category:'Soft Drink',
  //       imageUrl: 'https://s7g10.scene7.com/is/image/tetrapak/variety-of-ingredients-soft-drink-production?wid=600&hei=338&fmt=jpg&resMode=sharp2&qlt=85,0&op_usm=1.75,0.3,2,0',
  //       price: 6.5,
  //       isPopular: true,
  //       isRecommended:true
  //   ),
  //   ProductModel(
  //       name: 'Soft Drink #5',
  //       category:'Soft Drink',
  //       imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS2cEx3oEYBIMBoUMU7mN6t1kJOIDaoyPqmw&usqp=CAU',
  //       price: 11,
  //       isPopular: true,
  //       isRecommended:false
  //   ),
  //
  // ];


}