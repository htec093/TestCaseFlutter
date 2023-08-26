import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/general_validator.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final int? maxLines;
  final String? validationMessage;
  final bool? isNumber;
  final bool? isEnabled;
  final bool? validate;
  final bool? isEmail;
  final Function? onChanged;

  TextInputWidget({
    Key? key,
    this.controller,
    this.maxLines,
    this.validationMessage,
    this.isNumber,
    this.hint,
    this.isEmail,
    this.isEnabled, this.validate, this.onChanged,
  }) : super(key: key);

  String? textValidation(String input) {
    if(!validate!){
      return null;
    }else{
      if(isEmail != null){
        return validator.email(input)
            ? null
            :validationMessage!.tr;
      }
      if(input.isEmpty){
        return validationMessage!.tr;
      }else{
        return null;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: isEnabled,
        controller: controller,
        keyboardType: isNumber == null ? null : TextInputType.number,
        textInputAction: maxLines! > 1 ? TextInputAction.newline : null,
        maxLines: maxLines,
        validator: (input) => textValidation(input!),
      decoration: InputDecoration(
        // hintStyle: Theme.of(context).textTheme.labelMedium,
        hintText: hint!.tr,
      ),
        onChanged: (str){
          onChanged!(str);
        },);
  }
}