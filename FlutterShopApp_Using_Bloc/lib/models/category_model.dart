  import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable
{
  final String name;
  final String imgUrl;

  const CategoryModel({required this.name,required this.imgUrl});


  @override
  List<Object?> get props => [name,imgUrl];

  static List<CategoryModel> categories=[
    CategoryModel(name: "Soft Drink",
        imgUrl:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgUDxOm8K70kdDBRvvtO0CLwSQNEabG_MWqVvtXyP5MQ&s"),
    CategoryModel(name: "Smoothis",
        imgUrl:"https://hips.hearstapps.com/hmg-prod/images/delish-how-to-make-a-smoothie-horizontal-1542310071.png?crop=1xw:0.843328335832084xh;center,top"),
    CategoryModel(name: "Water",
        imgUrl:"https://siwi.org/wp-content/uploads/2021/09/colorful-water-drop-splash-e1635164525186.jpg"),
  ];


}