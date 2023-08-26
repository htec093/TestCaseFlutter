import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../config/app_theme.dart';

class FloatingAddButton extends StatelessWidget {
  final Function? onTap;
  const FloatingAddButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        width: 17.w,
        height: 17.w,
        decoration: BoxDecoration(
          color: AppColors.mainColor(1),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.add,
          size: 32,
          color: Colors.white,
        ),
      ),
    );
  }
}
