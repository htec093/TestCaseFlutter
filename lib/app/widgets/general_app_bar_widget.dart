import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../config/app_theme.dart';

import '../../config/translations/strings_enum.dart';
import 'arrow_back_widget.dart';
import 'custom_icon_btn_widget.dart';

class GeneralAppBar extends StatelessWidget {

  const GeneralAppBar({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: titleWidget(context),
      automaticallyImplyLeading: false,
      centerTitle: true,
      pinned: true,
      actions: [],
    );
  }

  Widget titleWidget(BuildContext context) {
    return Center(
      child: Text(
        Strings.home.tr
      ),
    );
  }
}

class InfoAppBar extends StatelessWidget {
  final Function? onMenuTap;
  final Function? onProfileTap;
  final bool? withMenu;
  final bool? withProfile;
  final String? title;

  const InfoAppBar(
      {Key? key,
      this.onMenuTap,
      this.onProfileTap,
      this.withMenu,
      this.withProfile,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        title!,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      pinned: true,
      leading: withMenu!
          ? CustomIconBtn(
              icon: 'assets/icons/ic_menu.png',
              width: 4.w,
              height: 4.w,
              onPressed: () {
                onMenuTap!();
              },
            )
          : const ArrowBack(),
      actions: [
        SizedBox(
          width: 8.w,
        )
      ],
    );
  }
}

