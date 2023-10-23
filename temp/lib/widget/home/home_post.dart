
import 'package:flutter/material.dart';

class HomePost extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    String postDesc='What do you think about AI? '
        'You are thinking of a limited scale or should be the development'
        ' of the next step? Maybe humanity doesn’t ready for this situation. Who knows? ';
    String postHashtag='#AI #humanity #chatgpt #ArtificialIntelligence';
    
    RichText formattedText = formatTextWithHashtags(postDesc, postHashtag);

    return Padding(
      padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 8,bottom: 8),
      child: Container(
        width: 450,
        decoration: BoxDecoration(
          color: Color.fromRGBO(26, 33, 33, 1),
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: Center(
                          child: Image.asset('assets/image/post_profile.png', alignment: Alignment.topLeft)
                      ),

                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Albert901',style:TextStyle(color: Colors.white),),
                        Row(
                          children: [
                            Text('Albert901',style:TextStyle(color: Colors.grey,fontSize: 9),),
                            Image.asset('assets/image/dot.png',width: 10,height: 10),
                            Text('5',style:TextStyle(color: Colors.grey,fontSize: 9),),
                          ],
                        ),

                      ],
                    ),
                  ],),
                  Image.asset('assets/image/more.png')


                ],
              ),
              RichText(text: formattedText.text),
              Image.asset('assets/image/albert.png',height: 270,),
              SizedBox(height:5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.favorite_border,color: Colors.white,size: 24,),
                      Text('245K',style: TextStyle(color: Colors.white,fontSize: 13),)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.mode_comment_outlined,color: Colors.white,size: 24,),
                      Text('12',style: TextStyle(color: Colors.white,fontSize: 13),)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.repeat_one_sharp,color: Colors.white,size: 24,),
                      Text('256K',style: TextStyle(color: Colors.white,fontSize: 13),)
                    ],
                  ),
                  Icon(Icons.share,color: Colors.white,size: 24,),
                  Row(
                    children: [
                      Icon(Icons.bar_chart,color: Colors.white,size: 24,),
                      Text('20K View',style: TextStyle(color: Colors.white,fontSize: 13),)
                    ],
                  ),
                ],



              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Created 30 Jun 2023',style: TextStyle(color: Colors.white,fontSize: 12)),
                    Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFED79B8),
                            Color(0xFFF37382),
                            Color(0xFFF1A617),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Bid',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  RichText formatTextWithHashtags(String postDesc, String postHashtag)
  {
    final List<TextSpan> textSpans = [];
    final List<String> hashtags = postHashtag.split(' ');
    textSpans.add(TextSpan(text: postDesc, style: TextStyle(color: Colors.white,fontSize: 15)));

    for (String hashtag in hashtags) {
      textSpans.add(TextSpan(text: ' $hashtag', style: TextStyle(color: Colors.blue,fontSize: 16)));
    }

    return RichText(
      text: TextSpan(
        children: textSpans,
      ),
    );
  }



}