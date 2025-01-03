import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../settings/theme/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextInputType keyboardType;
  final String hintText;
  final String? initialValue;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Color? fillColor;
  final TextEditingController? textEditingController;
  final Function(String value)? onChanged;
  final Function(dynamic value)? onSaved;
  final Function()? onTap;
  final String? Function(String?)? validate;
  final VoidCallback? onEditingComplete;

  final Widget? prefix;
  final Widget? suffixIcon;
  final String? labelText;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldWidget({
    super.key,
    this.onTap,
    this.onEditingComplete,
    this.prefixIcon,
    required this.hintText,
    required this.keyboardType,
    this.textEditingController,
    this.onChanged,
    this.onSaved,
    required this.validate,
    this.labelText,
    this.obscureText,
    this.suffixIcon,
    this.prefix,
    this.initialValue,
    this.maxLines,
    this.fillColor,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: onEditingComplete,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      initialValue: initialValue,

      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.normal, fontSize: 14),
      obscureText: obscureText ?? false,
      controller: textEditingController,

      onTap: onTap,
      // cursorColor: ,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,

        hintStyle: const TextStyle(color: AppColor.textSecondary),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        labelText: labelText,
        labelStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),
        prefix: prefix,
        prefixIcon: prefixIcon,

        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor ?? Colors.white,
        enabled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide:
                const BorderSide(width: 0.5, color: AppColor.textSecondary)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFF232B35)),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.5, color: Color(0xFFEB5757)),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.5, color: Color(0xFFEEEEEE)),
          borderRadius: BorderRadius.circular(10),
        ),
        // hintText: hintText,
      ),
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validate,
    );
  }
}
