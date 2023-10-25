
import 'package:flutter/material.dart';
import 'package:flutter_v_change_colo/provider/ApiProvider.dart';

import 'date_time_widget.dart';

class HomePage extends StatefulWidget
{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  ValueKey _textKey=const ValueKey<String?>(null);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(ApiProvider.of(context)?.api.dateAndTime ?? ''),
        backgroundColor: Colors.blue,
      ),
      body: GestureDetector(
        onTap: () async{
          final api=ApiProvider.of(context)?.api;
          final dateAndTime = await api?.getDateAndTime();
          setState(() {
            _textKey = ValueKey(dateAndTime);
          });

        },
        child: SizedBox(
          child: Container(
            child: DateTimeWidget(key:_textKey),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
