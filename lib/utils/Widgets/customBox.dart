import '../../res/import/import.dart';

Widget customBox({
  final double? height,
  final double? width,
  final Color? color,
  final Color? shadowColor,
  final BorderRadius? radius,
  final BoxShape? shapes,
  final Border? border,
  final Widget? widget,
  final DecorationImage? image,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      image: image,
      color: color,
      borderRadius: radius,
      border: border,
      shape: shapes ?? BoxShape.rectangle,
    ),
    child: widget,
  );
}
