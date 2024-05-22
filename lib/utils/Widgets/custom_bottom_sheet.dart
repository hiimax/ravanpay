import 'package:flutter/material.dart';

class CustomWidget {
  static customBottomSheet(context, {child, height}) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: height ?? MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width,
            child: child,
          );
        });
  }
}
