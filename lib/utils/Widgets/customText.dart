import '../../res/import/import.dart';

Widget customText({
  final String? title,
  final Color? color,
  final double? size,
  final FontWeight? weight,
  final String? font,
}) {
  return Text(
    title!,
    style: TextStyle(
      fontWeight: weight,
      fontFamily: font,
      color: color,
      fontSize: size,
    ),
    softWrap: true,
  );
}
