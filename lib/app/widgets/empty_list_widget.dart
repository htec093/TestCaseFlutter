import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class EmptyList extends StatelessWidget {
  const EmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 95.w,
      height: 80.h,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: 7,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            width: 90.w,
            height: 10.h,
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white
            ),
          );
        },
      ),
    );
  }
}
