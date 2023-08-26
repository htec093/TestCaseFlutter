import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/general_helper.dart';
import '../../../../config/app_theme.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/general_button_widget.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: GeneralHelper.of(context).onWillPop,
      child: Scaffold(
        key: controller.scaffoldKey,
        body: Obx(() => Container(
              padding: EdgeInsets.only(bottom: 8.h),
              width: 100.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: FlutterLogo(
                      size: 50.w,
                      duration: const Duration(seconds: 3),
                    ).animate()
                        .slideY(duration: 900.ms, curve: Curves.easeOutCubic)
                        .fadeIn(delay: 200.ms),
                  ),
                  //  Expanded(
                  //    child: MyHomePage(),
                  //  ),
                  btnStateWidget(context),
                ],
              ),
            )),
      ),
    );
  }

  Widget btnStateWidget(BuildContext context) {
    switch (controller.screenState.value) {
      case 0:
        return const SizedBox();
      case 1:
        return errorWidget(context);
      default:
        return const SizedBox();
    }
  }

  Widget errorWidget(context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(5.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_outlined,
                color: AppColors.mainColor(1),
                size: 8.w,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                controller.failure!.message.tr,
                overflow: TextOverflow.clip,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ),
        GeneralButton(
          width: 40.w,
          height: 12.w,
          color: AppColors.mainColor(1),
          borderColor: AppColors.mainColor(1),
          textColor: Colors.white,
          text: Strings.tryAgain.tr,
          onTap: () {
            controller.listenForSettings();
          },
        ),
      ],
    );
  }
}
