import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final String? validationMessage;
  // final String? suffixText;
  final bool needValidation;
  final bool isEmailValidation;
  final double? topPadding;
  final double? bottomPadding;
  final TextEditingController? controller;
  final bool isPhoneValidation;
  final bool isPasswordValidation;
  final TextInputType? textInputType;
  final int? maxLine;
  final int? maxLength;
  final double? borderRadius;
  final Widget? suffixIcon;
  final Color? borderColor;
  final Widget? prefixIcon;
  final TextAlign? textAlign;
  // final TextStyle? suffixStyle;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool isTransparentColorBorder;
  final bool isBigTitle;
  final bool autofocus;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final bool obscureText;
  final Color? titleColor;
  final bool readOnly;
  final Color? bgColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? titleMargin;

  const CommonTextField({
    Key? key,
    this.title,
    this.needValidation = false,
    this.isEmailValidation = false,
    this.hintText,
    this.validationMessage,
    this.topPadding,
    this.borderColor,
    this.bottomPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.readOnly = false,
    // this.suffixText,
    // this.suffixStyle,
    this.contentPadding,
    this.isPhoneValidation = false,
    this.textInputType,
    this.textAlign,
    this.borderRadius,
    this.inputFormatters,
    this.maxLine,
    this.maxLength,
    this.bgColor,
    this.isTransparentColorBorder = true,
    this.onTap,
    this.suffixIcon,
    this.isBigTitle = false,
    this.prefixIcon,
    this.validator,
    this.titleColor,
    this.isPasswordValidation = false,
    this.obscureText = false,
    this.onChange,
    this.margin,
    this.titleMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: margin,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.08),
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(1, 1),
                blurRadius: 1,
                spreadRadius: 1,
                color: Colors.white.withOpacity(0.03),
              ),
              BoxShadow(
                offset: const Offset(-1, -1),
                blurRadius: 1,
                spreadRadius: 1,
                color: Colors.white.withOpacity(0.03),
              ),
            ],
          ),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLines: maxLine,
            textAlign: textAlign ?? TextAlign.start,
            onTap: onTap,
            maxLength: maxLength,
            controller: controller,
            onChanged: onChange,
            obscureText: obscureText,
            readOnly: readOnly,
            inputFormatters: inputFormatters ?? [],
            focusNode: focusNode,
            autofocus: autofocus,
            keyboardType: textInputType ?? TextInputType.text,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            // style: AppTextStyle.regular500.copyWith(fontSize: 15),
            decoration: InputDecoration(
              fillColor: bgColor ?? Colors.transparent,
              contentPadding: contentPadding ??
                  const EdgeInsets.only(
                      top: 12, bottom: 12, right: 20, left: 20),
              isDense: true,
              filled: true,
              counterText: "",
              hintText: hintText ?? "",

              suffixIcon: suffixIcon,

              prefixIcon: prefixIcon,
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.grey),

              // hintStyle: AppTextStyle.regular400.copyWith(
              //     color: borderColor ?? AppColors.greyDarkColor, fontSize: 13),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: isTransparentColorBorder
                          ? Colors.transparent
                          : (borderColor ?? Colors.grey)),
                  borderRadius: BorderRadius.circular(borderRadius ?? 10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: isTransparentColorBorder
                          ? Colors.transparent
                          : (borderColor ?? Colors.grey)),
                  borderRadius: BorderRadius.circular(borderRadius ?? 10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: isTransparentColorBorder
                          ? Colors.transparent
                          : (borderColor ?? Colors.grey)),
                  borderRadius: BorderRadius.circular(borderRadius ?? 10)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: isTransparentColorBorder
                          ? Colors.transparent
                          : (borderColor ?? Colors.grey)),
                  borderRadius: BorderRadius.circular(borderRadius ?? 10)),
            ),
            // validator: needValidation
            //     ? validator ??
            //         (v) {
            //           return TextFieldValidation.validation(
            //               message: validationMessage ?? title,
            //               value: v,
            //               isPasswordValidator: isPasswordValidation,
            //               isPhone: isPhoneValidation,
            //               isEmailValidator: isEmailValidation);
            //         }
            //     : null,
          ),
        ),
        SizedBox(height: bottomPadding ?? 16),
      ],
    );
  }
}
