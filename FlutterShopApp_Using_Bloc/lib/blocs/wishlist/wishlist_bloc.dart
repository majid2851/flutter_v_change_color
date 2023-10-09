

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import  'dart:async';
import 'package:flutter_shop_app/models/models.dart';
import 'package:flutter_shop_app/models/wishlist_model.dart';
import 'package:flutter_shop_app/blocs/wishlist/wishlist_bloc.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent,WishlistState>
{
    WishlistBloc():super(WishlistLoading());

    @override
    Stream<WishlistState> mapEventToState(
        WishlistEvent event,
    ) async*
    {
      if (event is StartWishlist) {
        yield* _mapStartWishListToState();
      } else if (event is AddWishlistProduct) {
        yield* _mapAddWishListProductToState(event, state);
      } else if (event is RemoveWishlistProduct) {
        yield* _mapRemoveWishListProductToState(event, state);
      }
    }

    Stream<WishlistState> _mapStartWishListToState() async* {
      yield WishlistLoading();
      try{
        await Future<void>.delayed(Duration(seconds:1));
        yield const WishlistLoaded();
      }catch(e){
        print('mag2851-'+e.toString());
      }
    }

    Stream<WishlistState> _mapAddWishListProductToState(
      AddWishlistProduct event,
      WishlistState state,
    ) async*{
      if(state is WishlistLoaded)
      {
        try{
          yield WishlistLoaded(wishlist:
            WishListModel(products:List.from(state.wishlist.products)
            ..add(event.productModel)
            ));
        }catch(e) {
          print('mag2851-'+e.toString());
        }

      }
    }


    Stream<WishlistState> _mapRemoveWishListProductToState(
        RemoveWishlistProduct event,
        WishlistState state,
        ) async*{
      if(state is WishlistLoaded)
      {
        try{
          yield WishlistLoaded(wishlist:
          WishListModel(products:List.from(state.wishlist.products)
            ..remove(event.productModel)
          ));
        }catch(_) {
          print('mag2851-'+_.toString());
        }

      }
    }



}