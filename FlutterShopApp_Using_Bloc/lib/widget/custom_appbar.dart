import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Center(
        child: Container(
          color: Colors.black,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline2!.
              copyWith(color: Colors.white,),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
        ),
      ),
      centerTitle: true, // Center the title horizontally
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/wishlist');
          },
          icon: Icon(Icons.favorite),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
