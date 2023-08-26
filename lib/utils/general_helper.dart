import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../app/data/models/route_argument.dart';
import '../app/routes/app_pages.dart';
import '../app/widgets/general_button_widget.dart';
import '../config/app_theme.dart';
import '../config/translations/strings_enum.dart';

class GeneralHelper {
  BuildContext? context;
  DateTime? currentBackPressTime;

  GeneralHelper.of(BuildContext _context) {
    context = _context;
  }

  showErrorMessage(String message) {
    Future.delayed(const Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message.tr,
          duration: const Duration(seconds: 3),
        ).show(context!);
      }
    });
    return const SizedBox.shrink();
  }

  showConnectionLostMessage() {
    Flushbar(
      message: Strings.checkInternetConnection.tr,
      icon: Icon(
        Icons.wifi_off,
        size: 28.0,
        color: Colors.red[300],
      ),
      leftBarIndicatorColor: Colors.red[300],
      duration: const Duration(seconds: 3),
    ).show(context!);
  }

  showConnectionRestoredMessage() {
    Flushbar(
      message: Strings.connectionRestored.tr,
      icon: Icon(
        Icons.wifi,
        size: 28.0,
        color: Colors.green[300],
      ),
      leftBarIndicatorColor: Colors.green[300],
      duration: const Duration(seconds: 3),
    ).show(context!);
  }

  showInfoMessage(String message) {
    Future.delayed(const Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        FlushbarHelper.createInformation(
          message: message.tr,
          duration: const Duration(seconds: 3),
        ).show(context!);
      }
    });
    return SizedBox.shrink();
  }

  showFailureMessage(String message) {
    Future.delayed(const Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message.tr,
          duration: const Duration(seconds: 3),
        ).show(context!);
      }
    });

    return const SizedBox.shrink();
  }

  showSuccessMessage(String message) {
    Future.delayed(const Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        FlushbarHelper.createSuccess(
          message: message.tr,
          duration: const Duration(seconds: 3),
        ).show(context!);
      }
    });

    return const SizedBox.shrink();
  }

  Future<void> showLoadingDialog() async {
    return showDialog<void>(
      context: context!,
      builder: (BuildContext ctx) => SpinKitFadingCircle(
        color: Colors.white,
        size: 20.w,
      ),
      barrierDismissible: false,
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'tap_again_to_leave'.tr);
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  Widget btnOk(String text, Function onPresses) {
    return GeneralButton(
      width: 30.w,
      height: 8.w,
      color: Colors.white,
      borderColor: AppColors.mainColor(1),
      textColor: AppColors.mainColor(1),
      text: text,
      onTap: onPresses,
    );
  }

  Widget btnCancel(String text, Function onPresses) {
    return GeneralButton(
      width: 30.w,
      height: 8.w,
      color: AppColors.mainColor(1),
      borderColor: AppColors.mainColor(1),
      textColor: Colors.white,
      text: text,
      onTap: onPresses,
    );
  }

  showProcessingDialog() {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          SpinKitCubeGrid(
            color: AppColors.secondColor(1),
          ),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: Text(
                Strings.processingVideo.tr,
                style: Theme.of(context!).textTheme.headlineSmall,
              )),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context!,
      builder: (BuildContext context) {
        return WillPopScope(
          child: alert,
          onWillPop: () {
            return Future.value(false);
          },
        );
      },
    );
  }

  Widget btnBuySubscription(String text, Function onPresses) {
    return GeneralButton(
      // width: 30.w,
      height: 8.w,
      color: AppColors.mainColor(1),
      borderColor: AppColors.mainColor(1),
      textColor: Colors.white,
      text: text,
      onTap: onPresses,
    );
  }
}
