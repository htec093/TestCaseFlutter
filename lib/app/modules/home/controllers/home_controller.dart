import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  GlobalKey<ScaffoldState>? scaffoldKey;
  TextEditingController? nameTextEditingController;
  var name=''.obs;

  @override
  void onInit() {
    scaffoldKey = GlobalKey<ScaffoldState>();
    nameTextEditingController=TextEditingController();
    super.onInit();
  }
  clearName(){
    nameTextEditingController!.text='';
    name.value='';
  }

}
