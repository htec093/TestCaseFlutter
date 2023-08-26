import 'package:flutter/cupertino.dart';

class CustomIconBtn extends StatelessWidget {
  final double? width;
  final double? height;
  final Function? onPressed;
  final String? icon;

  const CustomIconBtn(
      {Key? key, this.width, this.height, this.onPressed, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed!();
      },
      child: Center(
        child: Image.asset(
          icon!,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
