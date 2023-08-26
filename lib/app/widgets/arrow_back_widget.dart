import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Image.asset(
            'assets/icons/ic_arrow_back.png',
          width: 5.w,
          height: 5.w,
          fit: BoxFit.fill,
        ));
  }
}
class CustomArrowBack extends StatelessWidget {
  final Function? onBack;
  const CustomArrowBack({Key? key, this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
         onBack!();
        },
        icon: Image.asset(
            'assets/icons/ic_arrow_back.png',
          width: 5.w,
          height: 5.w,
          fit: BoxFit.fill,
        ));
  }
}
