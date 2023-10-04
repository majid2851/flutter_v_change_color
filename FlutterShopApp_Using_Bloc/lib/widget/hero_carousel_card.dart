import 'package:flutter/material.dart';
import 'package:flutter_shop_app/models/models.dart';
import '../models/category_model.dart';


class HeroCarouselCard extends StatelessWidget
{
  final CategoryModel ? categoryModel;
  final ProductModel ? productModel;

  const HeroCarouselCard({this.categoryModel,this.productModel});

  @override
  Widget build(BuildContext context)
  {

    return  InkWell(
      onTap: (){
        if(this.productModel==null)
        {
          Navigator.pushNamed(
            context, '/catalog',
            arguments: categoryModel,
          );
        }

      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                    productModel==null ? categoryModel!.imgUrl : productModel!.imageUrl,
                    fit: BoxFit.cover,
                    width: 1000.0
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      '${productModel==null ? categoryModel!.name : ''}',
                      style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

}