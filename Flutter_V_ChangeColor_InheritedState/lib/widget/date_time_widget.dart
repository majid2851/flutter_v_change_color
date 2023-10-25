import 'package:flutter/material.dart';
import 'package:flutter_v_change_colo/provider/ApiProvider.dart';

class DateTimeWidget extends StatelessWidget
{
  const DateTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    final api=ApiProvider.of(context)?.api;
      return Text(
        api?.dateAndTime ?? 'Tab on Screen to fetch date and time',
      );
  }
}
