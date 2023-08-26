import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ososs_test/config/translations/strings_enum.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/animation_screen_controller.dart';

class AnimationScreenView extends GetView<AnimationScreenController> {
  const AnimationScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: bodyWidget(context),
    );
  }

  Widget bodyWidget(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(Strings.animations.tr),
          automaticallyImplyLeading: true,
          pinned: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  controller.name == ''
                      ? Strings.yourName.tr
                      : controller.name,
                ),
                SizedBox(height: 5.h,),
                Obx(() => AnimatedContainer(
                  width: 85.w,
                  height: 85.w,
                  decoration: BoxDecoration(
                    color: controller.color.value,
                    borderRadius: controller.borderRadius.value,
                    // shape:controller.shape.value,
                  ),
                  // Define how long the animation should take.
                  duration: const Duration(seconds: 1),
                  // Provide an optional curve to make the animation feel smoother.
                  curve: Curves.fastOutSlowIn,
                ),),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    squareBtn(context),
                    squareRoundedBtn(context),
                    circleBtn(context),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget squareBtn(BuildContext context) {
    return GestureDetector(
      onTap: controller.animateToRectangular,
      child: Container(
        width: 15.w,
        height: 15.w,
        color: Theme.of(context).primaryColorDark,
      ),
    );
  }

  Widget squareRoundedBtn(BuildContext context) {
    return GestureDetector(
      onTap: controller.animateToRoundedRectangular,
      child: Container(
        width: 15.w,
        height: 15.w,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }

  Widget circleBtn(BuildContext context) {
    return GestureDetector(
      onTap: controller.animateToCircle,
      child: Container(
        width: 15.w,
        height: 15.w,
        decoration: const BoxDecoration(
          color: Colors.redAccent,
          shape: BoxShape.circle
        ),
      ),
    );
  }
}
