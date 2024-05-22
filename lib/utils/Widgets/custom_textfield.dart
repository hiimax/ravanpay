import 'package:intl/intl.dart';

import '../../res/import/import.dart';

String decimalValue(String value) {
  const pattern = r'\.\d+';
  final match = RegExp(pattern).firstMatch(value);
  final decimalValues = match?.group(0); // Output: .6300000
  final parsedValue = double.parse(decimalValues!);
  final formattedChange = NumberFormat('+0.00%').format(parsedValue / 100);
  return formattedChange;
}

class CustomTextFormField extends StatelessWidget {
  final String? Function(String? val)? validator;
  final String? label;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Function(String? val)? onchanged;
  final Function(String? val)? onsaved;
  final Function()? onTap;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? titleText;
  final TextStyle? textStyle;
  final int? maxLength;
  final int? maxLines;
  final fillColor;
  final Color? errorBorderColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final double? height;
  final List<TextInputFormatter>? textInputFormatter;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final textAlign;

  const CustomTextFormField(
      {super.key,
      this.validator,
      this.errorBorderColor,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.label,
      this.controller,
      this.textInputType,
      this.onchanged,
      this.onsaved,
      this.textInputAction,
      this.hintText,
      this.titleText,
      this.textStyle,
      this.maxLength,
      this.maxLines,
      this.height,
      this.textInputFormatter,
      this.suffixIcon,
      this.prefixIcon,
      this.onTap,
      this.fillColor,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        textAlign: textAlign ?? TextAlign.start,
        inputFormatters: textInputFormatter,
        textInputAction: textInputAction,
        validator: validator,
        onChanged: onchanged,
        onSaved: onsaved,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        onTap: onTap,
        style: textStyle ??
            RavenTextStyle.size16
                .copyWith(color: ravenBlack, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: label,
          hintStyle: RavenTextStyle.size14.copyWith(
              fontWeight: FontWeight.w500, color: ravenSecondaryTextColor),
          fillColor: fillColor ?? Colors.transparent,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: enabledBorderColor ?? Transparent,
              ),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: errorBorderColor ?? Transparent),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: focusedBorderColor ?? Transparent),
              borderRadius: BorderRadius.circular(10)),
          labelStyle: const TextStyle(
              color: ravenBlack, fontSize: 16, fontWeight: FontWeight.w700),
          prefixIcon: prefixIcon,
          suffix: suffixIcon,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 13,
          ),
        ),
      ),
    );
  }
}
