

import 'package:flutter/material.dart';

import 'home_post.dart';
class HomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Row
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/image/vector_.png', alignment: Alignment.topLeft),
              ),

            ],
          ),

          // Buttons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catButton('Following'),
              catButton('For You'),
              catButton('Trending'),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                _buildUserCutIcon(),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return HomePost();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget catButton(String label)
  {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(36, 33, 33, 1.0),
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserCutIcon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add, color: Colors.black, size: 34.0),
          ),
        ),
        Text(
          'Your Cut',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

}
