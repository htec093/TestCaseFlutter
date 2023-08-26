import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../config/app_theme.dart';

class NavItemWidget extends StatelessWidget {
  final Function? onTap;
  final bool? isSelected;
  final String? name;
  final String? image;

  const NavItemWidget(
      {Key? key, this.onTap, this.isSelected, this.name, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Column(
        children: [
          Image.asset(
            image!,
            height: 6.w,
            width: 6.w,
            color:
                isSelected! ? AppColors.mainColor(1) : AppColors.grayColor(1),
          ),
          Text(
            name!,
            style: Theme.of(context).textTheme.labelMedium!.merge(TextStyle(
                  color: isSelected!
                      ? AppColors.mainColor(1)
                      : AppColors.grayColor(1),
                )),
          ),
        ],
      ),
    );
  }
}
