import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../config/app_theme.dart';

class DrawerListingItem extends StatelessWidget {
  final Function? onTap;
  final String? title;
  final String? icon;

  const DrawerListingItem({Key? key, this.onTap, this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   onTap: (){
    //     onTap!();
    //   },
    //   child: Container(
    //     margin: EdgeInsets.only(left: 8.w,right: 8.w),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Container(
    //           color: AppColors.mainColor(1),
    //           height: 1,
    //         ),
    //         SizedBox(height: 3.w,),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Image.asset(
    //               icon!,
    //               width: 5.w,
    //               height: 5.w,
    //             ),
    //             SizedBox(width: 2.w,),
    //             Text(
    //               title!,
    //               style: Theme.of(context).textTheme.labelLarge,
    //             ),
    //           ],
    //         ),
    //         SizedBox(height: 3.w,),
    //       ],
    //     ),
    //   ),
    // );
    return newItem(context);
  }

  Widget newItem(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          color: AppColors.mainColor(1),
          height: 1,
        ),
        // SizedBox(height: 3.w,),
        ListTile(
          leading: Image.asset(
            icon!,
            width: 5.w,
            height: 5.w,
          ),
          title: Text(
            title!,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          onTap: (){
            onTap!();
          },

        ),
        // SizedBox(height: 3.w,),
      ],
    );
  }

}
