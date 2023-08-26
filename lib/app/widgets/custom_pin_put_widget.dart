import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../config/app_theme.dart';
import '../../config/translations/localization_service.dart';
import '../../config/translations/strings_enum.dart';
import 'pin_put/pin_put.dart';

class CustomPinPut extends StatelessWidget {
  final TextEditingController? controller;

  CustomPinPut({Key? key, this.controller}) : super(key: key);

  final FocusNode _pinPutFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 15.sp),
      child: PinPut(
        validator: (v) {
          if (v!.length < 4) {
            return Strings.codeCheck.tr;
          } else {
            return null;
          }
        },
        withCursor: true,
        isRTL: !LocalizationService.isItEnglish(),
        fieldsCount: 4,
        fieldsAlignment: MainAxisAlignment.spaceAround,
        textStyle: Theme.of(context).textTheme.displayMedium,
        eachFieldMargin: const EdgeInsets.all(0),
        eachFieldWidth: 11.w,
        eachFieldHeight: 12.w,
        focusNode: _pinPutFocusNode,
        controller: controller,
        submittedFieldDecoration: submittedFieldDecoration,
        selectedFieldDecoration:selectedFieldDecoration,
        followingFieldDecoration: selectedFieldDecoration,
        disabledDecoration: selectedFieldDecoration,
        pinAnimationType: PinAnimationType.scale,
        onChanged: (value) {},
      ),
    );
  }

  BoxDecoration selectedFieldDecoration = BoxDecoration(
    color: Colors.transparent,
    // borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      width: 2,
      color: AppColors.mainColor(1),
    ),
  );
  BoxDecoration submittedFieldDecoration = BoxDecoration(
    color: Colors.transparent,
    // borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      width: 2,
      color: AppColors.secondColor(1),
    ),
  );
}
