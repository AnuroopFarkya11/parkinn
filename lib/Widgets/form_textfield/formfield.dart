import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parkinn/Utils/sizes.dart';

import '../../Utils/brand_color.dart';

class ParkInField extends StatelessWidget {
  final String labelText;
  final TextInputType textInputType;
  final GlobalKey formKey;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  const ParkInField({
    Key? key,
    required this.labelText,
    required this.formKey,
    required this.controller,
    this.validator,
    this.focusNode,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: CustomSizes.width*0.6,
      child: Form(
        key: formKey,
        child: TextFormField(
          style: TextStyle(fontSize: 20),
          cursorColor: BrandColors.brandBlack,
          controller: controller,
          keyboardType: textInputType,
          validator: validator,
          focusNode: focusNode,


          inputFormatters: [
            textInputType == TextInputType.number
                ? FilteringTextInputFormatter.digitsOnly
                : FilteringTextInputFormatter.singleLineFormatter,
            // FilteringTextInputFormatter.allow(RegExp(r'[0-9]{0,10}'))
          ],
          decoration: InputDecoration(
            labelText: labelText,

          ),
        ),
      ),
    );
  }
}
