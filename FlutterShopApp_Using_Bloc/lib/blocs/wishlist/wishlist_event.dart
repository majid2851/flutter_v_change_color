part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable
{
  const WishlistEvent();

  @override
  List<Object> get props =>[];
}

class StartWishlist extends WishlistEvent
{

}

class AddWishlistProduct extends WishlistEvent
{
  final ProductModel productModel;
  const AddWishlistProduct(this.productModel);

  @override
  List<Object> get props =>[];

}

class RemoveWishlistProduct extends WishlistEvent
{
  final ProductModel productModel;
  const RemoveWishlistProduct(this.productModel);

  @override
  List<Object> get props =>[];

}

