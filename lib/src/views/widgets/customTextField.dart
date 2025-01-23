import 'package:cinemax/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final double? width;
  final bool? readOnly;

  final Widget? suffix;
  final Widget? prefix;
  final bool? digitsOnly;
  final bool? shouldValidate;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? initial;
  final String? hintText;
  final bool? obscureText;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;

  const CustomTextField(
      {super.key,
      required this.label,
      this.width,
      this.controller,
      this.readOnly,
      this.suffix,
      this.prefix,
      this.onChanged,
      this.digitsOnly,
      this.keyboardType,
      this.maxLines,
      this.shouldValidate,
      this.maxLength,
      this.initial,
      this.obscureText,
      this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      this.borderRadius = const BorderRadius.all(Radius.circular(12)),
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: margin,
      width: width,
      child: TextFormField(
        obscureText: obscureText ?? false,
        initialValue: initial,
        keyboardType: keyboardType,
        onChanged: onChanged,
        onTapOutside: (value) {
          FocusScope.of(context).dispose();
        },
        readOnly: readOnly ?? false,
        controller: controller,
        maxLength: maxLength,
        validator: (val) {
          if (shouldValidate != false && controller!.text == '') {
            return "Please Input A Valid $label";
          }
          return null;
        },
        inputFormatters: digitsOnly ?? false
            ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))]
            : null,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
            filled: true, // Enables background color
            fillColor: AppColors.softColor,
            prefixIcon: prefix,
            focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius!,
                borderSide:
                    const BorderSide(color: AppColors.primaryColor, width: 2)),
            hintText: hintText,
            counterText: "",
            suffixIcon: suffix,
            labelText: label,
            contentPadding: const EdgeInsets.all(10),
            
            isDense: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius!,
                borderSide: const BorderSide(color: Colors.grey, width: 1)),
            errorMaxLines: 1,
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
            errorStyle: const TextStyle(color: Colors.red, height: 1),
            disabledBorder: OutlineInputBorder(
                borderRadius: borderRadius!,
                borderSide:
                    const BorderSide(color: AppColors.primaryColor, width: 2)),
            errorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            border: OutlineInputBorder(
                borderRadius: borderRadius!,
                borderSide:
                    const BorderSide(color: AppColors.primaryColor, width: 2))),
      ),
    );
  }
}
