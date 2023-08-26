import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GeneralButton extends StatelessWidget {
  Color? color;
  Color? borderColor;
  Color? textColor;
  String? text;
  Function? onTap;
  double? width;
  double? height;

  GeneralButton(
      {Key? key,
      this.color,
      this.borderColor,
      this.textColor,
      this.text,
      this.width,
      this.height,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(width: 2, color: borderColor!),
        ),
        child: Text(
          text!,
          style: TextStyle(color: textColor,fontSize: 18.sp),
        ),
      ),
    );
  }
}
