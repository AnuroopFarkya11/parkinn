import 'package:flutter/material.dart';

import '../../Utils/brand_color.dart';

class ParkInField extends StatelessWidget {
  final String labelText;
  final TextInputType textInputType;
  final GlobalKey formKey;
  final TextEditingController controller;
  final String Function(String?)? validator;

  const ParkInField({
    Key? key,
    required this.labelText,
    required this.formKey,
    required this.controller,
    this.validator,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        cursorColor: BrandColors.brandBlack,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(labelText: labelText),
      ),
    );
  }
}
