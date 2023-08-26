import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/route_argument.dart';

class AnimationScreenController extends GetxController {
  GlobalKey<ScaffoldState>? scaffoldKey;
  RouteArgument? routeArgument;

  var color=Colors.white.obs;
  var borderRadius=BorderRadius.zero.obs;
  var shape=BoxShape.rectangle.obs;

  String name='';

  @override
  void onInit() {
    scaffoldKey = GlobalKey<ScaffoldState>();
    if (Get.arguments != null) {
      routeArgument = Get.arguments;
      name=routeArgument!.param;
    }
    super.onInit();
  }

  animateToRectangular(){
    color.value=Theme.of(scaffoldKey!.currentContext!).primaryColorDark;
    borderRadius.value=BorderRadius.zero;
    // shape.value=BoxShape.rectangle;
  }

  animateToRoundedRectangular(){
    color.value=Theme.of(scaffoldKey!.currentContext!).primaryColorLight;
    borderRadius.value=const BorderRadius.all(Radius.circular(50));
    // shape.value=BoxShape.rectangle;
  }

  animateToCircle(){
    color.value=Colors.redAccent;
    borderRadius.value= const BorderRadius.all(Radius.circular(500));
    // shape.value=BoxShape.circle;
  }
}
