part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable
{
  const CartEvent();

  @override
  List<Object> get props =>[];
}

class CartStarted extends CartEvent
{
  @override
  List<Object> get props=>[];

}

class CartProductAdded extends CartEvent
{
  final ProductModel productModel;
  const CartProductAdded(this.productModel);

  @override
  List<Object> get props=>[productModel];

}

class CartProductRemoved extends CartEvent
{
  final ProductModel productModel;
  const CartProductRemoved(this.productModel);

  @override
  List<Object> get props=>[productModel];
}


