import 'package:flutter/material.dart';
import 'package:raven/res/colors/colors.dart';

class DropDownInput extends StatelessWidget {
  const DropDownInput({
    super.key,
    this.controller,
    required this.items,
    this.hint,
    this.onSelected,
    this.validator,
    this.enabled = true,
    this.fillColor,
  });

  final controller;
  final List<String> items;
  final String? hint;
  final validator;
  final Function(String? val)? onSelected;
  final bool enabled;
  final fillColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        // height: 55,
        child: TextFormField(
          showCursor: false,
          controller: controller,
          validator: validator,
          enabled: enabled,

          //readOnly: true,
          style: const TextStyle(fontSize: 15, color: ravenGrey),
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: fillColor ?? ravenWhite,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ravenGrey.withOpacity(.5), width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            disabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ravenGrey.withOpacity(.5), width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            suffixIcon: PopupMenuButton<String>(
              icon: const Icon(Icons.expand_more),
              onSelected: (String? val) {
                if (onSelected == null) return;

                onSelected!(val);
              },
              itemBuilder: (BuildContext context) {
                return items.map<PopupMenuItem<String>>((String value) {
                  return PopupMenuItem(value: value, child: Text(value));
                }).toList();
              },
            ),
          ),
        ),
      ),
    );
  }
}
