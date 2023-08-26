import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ososs_test/config/translations/strings_enum.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/general_helper.dart';
import '../../../data/models/route_argument.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/general_app_bar_widget.dart';
import '../../../widgets/general_button_widget.dart';
import '../controllers/home_controller.dart';
import '../widgets/text_input_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: GeneralHelper.of(context).onWillPop,
      child: Scaffold(
        key: controller.scaffoldKey,
        body: bodyWidget(context),
      ),
    );
  }

  Widget bodyWidget(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const GeneralAppBar(),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextInputWidget(
                  controller: controller.nameTextEditingController,
                  hint: Strings.enterYourName,
                  isEnabled: true,
                  validate: false,
                  maxLines: 1,
                  onChanged: (str) {
                    controller.name.value = str;
                  },
                ),
                SizedBox(
                  height: 4.h,
                ),
                Obx(() => Text(
                      controller.name.value == ''
                          ? Strings.yourName.tr
                          : controller.name.value,
                    )),
                SizedBox(
                  height: 50.h,
                ),
                clearTextWidget(),
                SizedBox(
                  height: 2.h,
                ),
                GeneralButton(
                  color: Theme.of(context).primaryColorDark,
                  borderColor: Theme.of(context).primaryColorDark,
                  textColor: Colors.white,
                  text: Strings.goToPageOne.tr,
                  onTap: () {
                    Get.toNamed(
                      Routes.ANIMATION_SCREEN,
                      arguments: RouteArgument(param: controller.name.value),
                    );
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                GeneralButton(
                  color: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  text: Strings.goToPageSecond.tr,
                  onTap: () {
                    Get.toNamed(
                      Routes.POKEMONS,);
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget clearTextWidget() {
    return GestureDetector(
      onTap: () {
        controller.clearName();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          SizedBox(
            width: 3.w,
          ),
          Text(
            Strings.clearText.tr,
            style: const TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
